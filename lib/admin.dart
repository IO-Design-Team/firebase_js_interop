import 'package:firebase_js_interop/admin.dart';
import 'package:firebase_js_interop/node.dart';

export 'src/admin/app/app.dart';

/// Access to Firebase Admin components
sealed class FirebaseAdmin {
  FirebaseAdmin._();

  static FirebaseAdminApp get app =>
      require('firebase-admin/app') as FirebaseAdminApp;
}
