/*!
 * @license
 * Copyright 2021 Google Inc.
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

import 'package:firebase_js_interop/src/admin/app/index.dart';
import 'package:firebase_js_interop/src/google_cloud/firestore/types/firestore.dart';
import 'package:firebase_js_interop/src/admin/firestore/firestore_internal.dart';

export 'package:firebase_js_interop/src/google_cloud/firestore/types/firestore.dart';
export 'firestore_internal.dart';

/// Cloud Firestore.
extension type FirebaseAdminFirestore._(JSObject _) implements JSObject {
  /// Get a Firestore instance for the current app
  external Firestore getFirestore([
    JSAny? appOrDatabaseId,
    String? optionalDatabaseId,
  ]);

  /// Gets the named {@link https://googleapis.dev/nodejs/firestore/latest/Firestore.html | Firestore}
  /// service for the given app, passing extra parameters to its constructor.
  ///
  /// @example
  /// ```javascript
  /// // Get the Firestore service for a specific app, require HTTP/1.1 REST transport
  /// const otherFirestore = initializeFirestore(app, {preferRest: true}, 'otherDb');
  /// ```
  ///
  /// @param app - which `Firestore` service to return.
  ///
  /// @param settings - Settings object to be passed to the constructor.
  ///
  /// @param databaseId - name of database to return.
  ///
  /// @returns The named `Firestore` service associated with the provided app and settings.
  /// @beta
  external Firestore initializeFirestore(
    App app, [
    FirestoreSettings settings,
    String databaseId,
  ]);
}
