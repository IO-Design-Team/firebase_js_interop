import 'package:firebase_js_interop/functions.dart';
import 'package:firebase_js_interop/node.dart';

export 'src/functions/common/options.dart';
export 'src/functions/v2/providers/firestore.dart';
export 'src/functions/v2/providers/https.dart';
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
}
