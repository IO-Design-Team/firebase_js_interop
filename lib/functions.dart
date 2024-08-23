import 'package:firebase_js_interop/functions.dart';
import 'package:firebase_js_interop/node.dart';

export 'src/functions/https.dart';

sealed class FirebaseFunctions {
  FirebaseFunctions._();

  static FirebaseFunctionsHttps get https =>
      require('firebase-functions/v2/https') as FirebaseFunctionsHttps;
}
