// This is copied verbatim from the JS SDK
// ignore_for_file: doc_directive_unknown

/*!
 * Copyright 2020 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'dart:js_interop';

import 'package:firebase_js_interop/src/database_types/index.dart'
    show FirebaseDatabase;

/// The Firebase Database service interface. Extends the
/// {@link https://firebase.google.com/docs/reference/js/v8/firebase.database.Database | Database}
/// interface provided by the `@firebase/database-compat` package.
extension type Database._(JSObject _) implements FirebaseDatabase {
  /// Gets the currently applied security rules as a string. The return value consists of
  /// the rules source including comments.
  ///
  /// @returns A promise fulfilled with the rules as a raw string.
  external JSPromise<JSString> getRules();

  /// Gets the currently applied security rules as a parsed JSON object. Any comments in
  /// the original source are stripped away.
  ///
  /// @returns A promise fulfilled with the parsed rules object.
  @JS('getRulesJSON')
  external JSPromise<JSObject> getRulesJson();

  /// Sets the specified rules on the Firebase Realtime Database instance. If the rules source is
  /// specified as a string or a Buffer, it may include comments.
  ///
  /// @param source - Source of the rules to apply. Must not be `null` or empty.
  /// @returns Resolves when the rules are set on the Realtime Database.
  external JSPromise setRules(JSAny source);
}
