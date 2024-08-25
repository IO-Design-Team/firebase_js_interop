import 'package:firebase_js_interop/admin.dart';
import 'package:firebase_js_interop/node.dart';

export 'src/admin/app/index.dart';
export 'src/admin/firestore/index.dart';
export 'src/admin/messaging/index.dart';

/// Access to Firebase Admin components
abstract final class FirebaseAdmin {
  FirebaseAdmin._();

  /// Access to the Firebase Admin App lifecycle methods
  static FirebaseAdminApp get app =>
      require('firebase-admin/app') as FirebaseAdminApp;

  /// Access to the Firebase Admin Firestore methods
  static FirebaseAdminFirestore get firestore =>
      require('firebase-admin/firestore') as FirebaseAdminFirestore;

  /// Access to the Firebase Admin Messaging methods
  static FirebaseAdminMessaging get messaging =>
      require('firebase-admin/messaging') as FirebaseAdminMessaging;
}
