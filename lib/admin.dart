import 'package:firebase_js_interop/admin.dart';
import 'package:firebase_js_interop/node.dart';

export 'src/admin/app/index.dart';

/// Access to Firebase Admin components
abstract final class FirebaseAdmin {
  FirebaseAdmin._();

  /// Access to the Firebase Admin App lifecycle methods
  static FirebaseAdminApp get app =>
      require('firebase-admin/app') as FirebaseAdminApp;
}
