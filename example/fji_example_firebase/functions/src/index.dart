import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:fji_example_core_js_interop/model.dart';
import 'package:firebase_js_interop/admin.dart';
import 'package:firebase_js_interop/functions.dart';
import 'package:firebase_js_interop/express.dart' as express;
import 'package:firebase_js_interop/js.dart';
import 'package:firebase_js_interop/node.dart';
import 'package:firebase_js_interop/extensions.dart';

void main() {
  FirebaseAdmin.app.initializeApp();

  final firestore = FirebaseAdmin.firestore.getFirestore();
  final messaging = FirebaseAdmin.messaging.getMessaging();

  exports['helloWorld'] = FirebaseFunctions.https.onRequest(
    (Request request, express.Response response) {
      return response.send('Hello from Firebase!'.toJS);
    }.toJS,
  );

  exports['beforeUserCreated'] = FirebaseFunctions.identity.beforeUserCreated(
    (AuthBlockingEvent event) {
      return firestore
          .collection('users')
          .doc(event.data.uid)
          .set(FjiUser().toJson().toJS);
    }.toJS,
  );

  exports['onMessageCreated'] = FirebaseFunctions.firestore.onDocumentCreated(
    '/chats/{chatId}/messages/{messageId}'.toJS,
    (FirestoreEvent<DocumentSnapshot> event) {
      // Make sure to return promises for async operations
      return promise(() async {
        final chatId = event.params['chatId'] as JSString;
        final chatDoc = firestore.collection('chats').doc(chatId.toDart);
        final chatSnapshot = await chatDoc.get().toDart;
        final chat = FjiChat.fromJson(chatSnapshot.data().toJson());

        final message = FjiMessage.fromJson(event.data.data().toJson());
        await chatDoc
            .update(
              chat
                  .copyWith(
                    lastMessage: message.text,
                    lastMessageTime: message.timestamp,
                  )
                  .toJson()
                  .toJS,
            )
            .toDart;

        for (final participant in chat.participants) {
          final userSnapshot =
              await firestore.collection('users').doc(participant).get().toDart;
          final user = FjiUser.fromJson(userSnapshot.data().toJson());
          for (final token in user.fcmTokens) {
            try {
              await messaging
                  .send(
                    TokenMessage(
                      token: token,
                      notification: Notification(
                        title: 'New Message',
                        body: message.text,
                      ),
                    ),
                  )
                  .toDart;
            } on FirebaseError catch (error) {
              if (error.code == 'messaging/registration-token-not-registered') {
                await firestore
                    .collection('users')
                    .doc(participant)
                    .update(
                      {
                        'fcmTokens': FieldValue.arrayRemove([token.toJS].toJS),
                      }.toJS,
                    )
                    .toDart;
              }
            }
          }
        }
      });
    }.toJS,
  );
}
