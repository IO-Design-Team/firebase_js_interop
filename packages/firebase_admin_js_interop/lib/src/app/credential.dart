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

/// A service account object
extension type ServiceAccount._(JSObject _) implements JSObject {
  /// The project ID associated with the service account.
  external String? get projectId;

  /// The client email address associated with the service account.
  external String? get clientEmail;

  /// The private key associated with the service account.
  external String? get privateKey;
}

/// Interface for Google OAuth 2.0 access tokens.
extension type GoogleOAuthAccessToken._(JSObject _) implements JSObject {
  /// The Google OAuth2 access token.
  @JS('access_token')
  external String get accessToken;

  /// The number of seconds from when the token was issued that it expires.
  @JS('expires_in')
  external int get expiresIn;
}

/// Interface that provides Google OAuth2 access tokens used to authenticate
/// with Firebase services.
///
/// In most cases, you will not need to implement this yourself and can instead
/// use the default implementations provided by the `firebase-admin/app` module.
extension type Credential._(JSObject _) implements JSObject {
  /// Returns a Google OAuth2 access token object used to authenticate with
  /// Firebase services.
  ///
  /// @returns A Google OAuth2 access token object.
  external JSPromise<GoogleOAuthAccessToken> getAccessToken();
}
