import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:fji_example/firebase_options.dart';
import 'package:fji_example_core_flutter/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart' as chat;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  await auth.useAuthEmulator('localhost', 9099);
  firestore.useFirestoreEmulator('localhost', 8080);

  // Start fresh every time for the demo
  await auth.currentUser?.delete();

  // This will call the `beforeUserCreated` function
  final credential = await auth.createUserWithEmailAndPassword(
    email: 'test@example.com',
    password: 'password1234',
  );

  final uid = credential.user?.uid;
  if (uid == null) throw 'Failed to create user';

  runApp(MaterialApp(home: ChatsList(uid: uid)));
}

class ChatsList extends StatelessWidget {
  final String uid;

  const ChatsList({super.key, required this.uid});

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Chats')),
      body: FirestoreListView(
        query: chatsRef
            .whereParticipants(arrayContains: uid)
            .orderByLastMessageTime(descending: true)
            .reference,
        emptyBuilder: (context) => const Center(child: Text('No chats')),
        itemBuilder: (context, snap) {
          final lastMessage = snap.data().lastMessage;
          final lastMessageTime = snap.data().lastMessageTime;
          return ListTile(
            title: Row(
              children: [
                const Text('Chat'),
                const Spacer(),
                if (lastMessageTime != null) Text(lastMessageTime.toString()),
              ],
            ),
            subtitle: lastMessage != null ? Text(lastMessage) : null,
            onTap: () => showChat(navigator, snap.id),
            leading: const Icon(Icons.chat),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => createChat(context),
        child: const Icon(Icons.add),
      ),
    );
  }

  void createChat(BuildContext context) async {
    final navigator = Navigator.of(context);
    final doc = chatsRef.doc();
    final chat = FjiChat(id: doc.id, participants: {uid});
    await doc.set(chat);
    showChat(navigator, doc.id);
  }

  void showChat(NavigatorState navigator, String chatId) {
    navigator.push(
      MaterialPageRoute(
          builder: (context) => ChatScreen(uid: uid, chatId: chatId)),
    );
  }
}

class ChatScreen extends StatelessWidget {
  final String uid;
  final String chatId;

  const ChatScreen({super.key, required this.uid, required this.chatId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chat')),
      body: Builder(
        builder: (context) {
          return FirestoreQueryBuilder(
            //! Use a smaller page size in production
            pageSize: 100,
            query: chatsRef
                .doc(chatId)
                .messages
                .orderByTimestamp(descending: true)
                .reference,
            builder: (context, snap, _) {
              if (snap.hasError) {
                return Center(child: Text('Error\n${snap.error}'));
              }
              if (snap.isFetching) {
                return const Center(child: CircularProgressIndicator());
              }
              return Chat(
                currentUserId: uid,
                resolveUser: (id) async {
                  final snapshot = await usersRef.doc(id).get();
                  final data = snapshot.data;
                  if (data == null) return null;

                  return chat.User(id: id, name: data.displayName);
                },
                chatController: chat.InMemoryChatController(
                  messages: snap.docs
                      .map(
                        (e) => chat.Message.text(
                          id: e.id,
                          authorId: e.data().author,
                          createdAt: e.data().timestamp,
                          text: e.data().text,
                        ),
                      )
                      .toList(),
                ),
                onMessageSend: (text) =>
                    chatsRef.doc(chatId).messages.doc().set(
                          FjiMessage(
                            author: uid,
                            text: text,
                          ),
                          timestampFieldValue: FieldValue.serverTimestamp(),
                        ),
                builders: chat.Builders(
                  chatAnimatedListBuilder: (context, itemBuilder) =>
                      ChatAnimatedList(
                    itemBuilder: itemBuilder,
                    onEndReached: () async => snap.fetchMore(),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
