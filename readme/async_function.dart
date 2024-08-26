import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:firebase_js_interop/functions.dart';
import 'package:firebase_js_interop/js.dart';
import 'package:firebase_js_interop/node.dart';
import 'package:firebase_js_interop/admin.dart';

void main() {
  exports['onMessageCreated'] = FirebaseFunctions.firestore.onDocumentCreated(
    '/chats/{chatId}/messages/{messageId}'.toJS,
    (FirestoreEvent<DocumentSnapshot> event) {
      return promise(() async {
        await Future.delayed(const Duration(seconds: 1));
      });
    }.toJS,
  );
}
