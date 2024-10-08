import 'package:firebase_js_interop/functions.dart';
import 'package:firebase_js_interop/node.dart';

export 'src/functions/common/options.dart';
export 'src/functions/v2/providers/firestore.dart';
export 'src/functions/v2/providers/https.dart';
export 'src/functions/v2/providers/identity.dart';
export 'src/functions/v2/providers/scheduler.dart';
export 'src/functions/v2/core.dart';

/// Access to Firebase Functions components
abstract final class FirebaseFunctions {
  FirebaseFunctions._();

  /// Access to the Firebase Functions HTTPS methods
  static FirebaseFunctionsHttps get https =>
      require('firebase-functions/v2/https') as FirebaseFunctionsHttps;

  /// Access to the Firebase Functions Firestore methods
  static FirebaseFunctionsFirestore get firestore =>
      require('firebase-functions/v2/firestore') as FirebaseFunctionsFirestore;

  /// Access to the Firebase Functions Identity methods
  static FirebaseFunctionsIdentity get identity =>
      require('firebase-functions/v2/identity') as FirebaseFunctionsIdentity;

  /// Access to the Firebase Functions Schedule methods
  static FirebaseFunctionsSchedule get schedule =>
      require('firebase-functions/v2/scheduler') as FirebaseFunctionsSchedule;
}
