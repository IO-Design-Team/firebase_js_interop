import 'package:firebase_js_interop/functions.dart';
import 'package:firebase_js_interop/node.dart';

export 'src/functions/https.dart';

/// Access to Firebase Functions components
abstract final class FirebaseFunctions {
  FirebaseFunctions._();

  /// Access to the Firebase Functions HTTPS methods
  static FirebaseFunctionsHttps get https =>
      require('firebase-functions/v2/https') as FirebaseFunctionsHttps;
}
