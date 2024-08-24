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

import 'package:firebase_js_interop/src/admin/app/core.dart';

/// Access to the Firebase Admin App lifecycle methods
extension type FirebaseAdminApp._(JSObject _) implements JSObject {
  /// Initializes and returns a Firebase App instance.
  external App initializeApp([AppOptions? options, String appName]);

  /// Get a Firebase App instance by name
  external App getApp([String appName]);

  /// Returns an array of all the non-deleted Firebase App instances.
  external JSArray<App> getApps();

  /// Deletes a Firebase App instance.
  external void deleteApp(String appName);
}
