import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
import 'package:fji_example/firebase_options.dart';
import 'package:fji_example_core_flutter/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  await auth.useAuthEmulator('localhost', 9099);
  firestore.useFirestoreEmulator('localhost', 8080);

  // This will call the `beforeUserCreated` function
  await auth.signInAnonymously();

  runApp(const MaterialApp(home: ChatsList()));
}

class ChatsList extends StatelessWidget {
  static final _auth = FirebaseAuth.instance;

  const ChatsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chats')),
      body: FirestoreListView(
        query: chatsRef
            .whereParticipants(arrayContains: _auth.currentUser!.uid)
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
            onTap: () => showChat(Navigator.of(context), snap.id),
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
    final chat = FjiChat(id: doc.id, participants: {_auth.currentUser!.uid});
    await doc.set(chat);
    showChat(navigator, doc.id);
  }

  void showChat(NavigatorState navigator, String chatId) {
    navigator.push(
      MaterialPageRoute(builder: (context) => ChatScreen(chatId: chatId)),
    );
  }
}

class ChatScreen extends StatelessWidget {
  static final _auth = FirebaseAuth.instance;

  final String chatId;

  const ChatScreen({super.key, required this.chatId});

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
            builder: (context, snap, child) {
              if (snap.hasError) {
                return Center(child: Text('Error\n${snap.error}'));
              }
              if (snap.isFetching) {
                return const Center(child: CircularProgressIndicator());
              }
              return Chat(
                user: types.User(id: _auth.currentUser!.uid),
                messages: snap.docs
                    .map(
                      (snap) => types.TextMessage(
                        id: snap.id,
                        createdAt: snap.data().timestamp.millisecondsSinceEpoch,
                        author: types.User(id: snap.data().author),
                        text: snap.data().text,
                      ),
                    )
                    .toList(),
                onEndReached: () async => snap.fetchMore(),
                isLastPage: !snap.hasMore,
                onSendPressed: (partial) {
                  final text = partial.text;
                  if (text.isEmpty) return;
                  // This will call the `onMessageCreated` function
                  chatsRef.doc(chatId).messages.add(
                        FjiMessage(
                          //! Use `FieldValue.serverTimestamp()` in production
                          timestamp: DateTime.timestamp(),
                          author: _auth.currentUser!.uid,
                          text: text,
                        ),
                      );
                },
              );
            },
          );
        },
      ),
    );
  }
}
