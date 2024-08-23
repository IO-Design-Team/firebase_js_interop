import 'dart:js_interop';

import 'package:firebase_functions_js_interop/firebase_functions_js_interop.dart';

export 'src/https.dart';

sealed class FirebaseFunctions {
  FirebaseFunctions._();

  static Future<FirebaseFunctionsHttps> get https async {
    final https = await importModule('firebase-functions/v2/https'.toJS).toDart;
    return https as FirebaseFunctionsHttps;
  }
}
