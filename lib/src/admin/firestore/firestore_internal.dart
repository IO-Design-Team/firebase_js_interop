/*!
 * @license
 * Copyright 2017 Google Inc.
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

/// Settings to pass to the Firestore constructor.
extension type FirestoreSettings._(JSObject _) implements JSObject {
  /// Use HTTP/1.1 REST transport where possible.
  ///
  /// `preferRest` will force the use of HTTP/1.1 REST transport until a method
  /// that requires gRPC is called. When a method requires gRPC, this Firestore
  /// client will load dependent gRPC libraries and then use gRPC transport for
  /// all communication from that point forward. Currently the only operation
  /// that requires gRPC is creating a snapshot listener using `onSnapshot()`.
  ///
  /// @defaultValue `undefined`
  external bool? get preferRest;

  /// Constructor
  external FirestoreSettings({
    bool? preferRest,
  });
}
