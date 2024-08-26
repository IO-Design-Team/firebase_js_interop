import 'dart:js_interop';
import 'dart:js_interop_unsafe';

import 'package:firebase_js_interop/functions.dart';
import 'package:firebase_js_interop/node.dart';
import 'package:firebase_js_interop/express.dart' as express;

void main() {
  exports['helloWorld'] = FirebaseFunctions.https.onRequest(
    (Request request, express.Response response) {
      return response.send('Hello from Firebase!'.toJS);
    }.toJS,
  );
}
