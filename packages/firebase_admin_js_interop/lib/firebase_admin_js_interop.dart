import 'dart:js_interop';

import 'package:firebase_admin_js_interop/firebase_admin_js_interop.dart';

export 'src/app/app.dart';

/// Access to Firebase Admin components
sealed class FirebaseAdmin {
  FirebaseAdmin._();

  static Future<FirebaseAdminApp> get app async {
    final app = await importModule('firebase-admin/app'.toJS).toDart;
    return app as FirebaseAdminApp;
  }
}
