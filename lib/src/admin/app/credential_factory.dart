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

// This is copied verbatim from the JS SDK
// ignore_for_file: doc_directive_unknown

import 'dart:js_interop';

import 'package:firebase_js_interop/src/admin/app/index.dart';
import 'package:firebase_js_interop/node.dart';

/// Access to the Firebase Admin App Credential Factory methods
extension FirebaseAdminAppCredentialFactory on FirebaseAdminApp {
  /// Returns a credential created from the
  /// {@link https://developers.google.com/identity/protocols/application-default-credentials |
  /// Google Application Default Credentials}
  /// that grants admin access to Firebase services. This credential can be used
  /// in the call to {@link firebase-admin.app#initializeApp}.
  ///
  /// Google Application Default Credentials are available on any Google
  /// infrastructure, such as Google App Engine and Google Compute Engine.
  ///
  /// See
  /// {@link https://firebase.google.com/docs/admin/setup#initialize_the_sdk | Initialize the SDK}
  /// for more details.
  ///
  /// @example
  /// ```javascript
  /// initializeApp({
  ///   credential: applicationDefault(),
  ///   databaseURL: "https://<DATABASE_NAME>.firebaseio.com"
  /// });
  /// ```
  ///
  /// @param httpAgent - Optional {@link https://nodejs.org/api/http.html#http_class_http_agent | HTTP Agent}
  ///   to be used when retrieving access tokens from Google token servers.
  ///
  /// @returns A credential authenticated via Google
  ///   Application Default Credentials that can be used to initialize an app.
  external Credential applicationDefault([Agent httpAgent]);

  /// Returns a credential created from the provided service account that grants
  /// admin access to Firebase services. This credential can be used in the call
  /// to {@link firebase-admin.app#initializeApp}.
  ///
  /// See
  /// {@link https://firebase.google.com/docs/admin/setup#initialize_the_sdk | Initialize the SDK}
  /// for more details.
  ///
  /// @example
  /// ```javascript
  /// // Providing a path to a service account key JSON file
  /// const serviceAccount = require("path/to/serviceAccountKey.json");
  /// initializeApp({
  ///   credential: cert(serviceAccount),
  ///   databaseURL: "https://<DATABASE_NAME>.firebaseio.com"
  /// });
  /// ```
  ///
  /// @example
  /// ```javascript
  /// // Providing a service account object inline
  /// initializeApp({
  ///   credential: cert({
  ///     projectId: "<PROJECT_ID>",
  ///     clientEmail: "foo@<PROJECT_ID>.iam.gserviceaccount.com",
  ///     privateKey: "-----BEGIN PRIVATE KEY-----<KEY>-----END PRIVATE KEY-----\n"
  ///   }),
  ///   databaseURL: "https://<DATABASE_NAME>.firebaseio.com"
  /// });
  /// ```
  ///
  /// @param serviceAccountPathOrObject - The path to a service
  ///   account key JSON file or an object representing a service account key.
  /// @param httpAgent - Optional {@link https://nodejs.org/api/http.html#http_class_http_agent | HTTP Agent}
  ///   to be used when retrieving access tokens from Google token servers.
  ///
  /// @returns A credential authenticated via the
  ///   provided service account that can be used to initialize an app.
  external Credential cert(JSAny serviceAccountPathOrObject, [Agent httpAgent]);

  /// Returns a credential created from the provided refresh token that grants
  /// admin access to Firebase services. This credential can be used in the call
  /// to {@link firebase-admin.app#initializeApp}.
  ///
  /// See
  /// {@link https://firebase.google.com/docs/admin/setup#initialize_the_sdk | Initialize the SDK}
  /// for more details.
  ///
  /// @example
  /// ```javascript
  /// // Providing a path to a refresh token JSON file
  /// const refreshToken = require("path/to/refreshToken.json");
  /// initializeApp({
  ///   credential: refreshToken(refreshToken),
  ///   databaseURL: "https://<DATABASE_NAME>.firebaseio.com"
  /// });
  /// ```
  ///
  /// @param refreshTokenPathOrObject - The path to a Google
  ///   OAuth2 refresh token JSON file or an object representing a Google OAuth2
  ///   refresh token.
  /// @param httpAgent - Optional {@link https://nodejs.org/api/http.html#http_class_http_agent | HTTP Agent}
  ///   to be used when retrieving access tokens from Google token servers.
  ///
  /// @returns A credential authenticated via the
  ///   provided service account that can be used to initialize an app.
  external Credential refreshToken(
    JSAny refreshTokenPathOrObject, [
    Agent httpAgent,
  ]);
}
