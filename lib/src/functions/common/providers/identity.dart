// The MIT License (MIT)
//
// Copyright (c) 2022 Firebase
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import 'dart:js_interop';

import 'package:firebase_js_interop/src/functions/v1/cloud_functions.dart';

/// User info that is part of the `AuthUserRecord`.
extension type AuthUserInfo._(JSObject _) implements JSObject {
  /// The user identifier for the linked provider.
  external String get uid;

  /// The display name for the linked provider.
  external String get displayName;

  /// The email for the linked provider.
  external String get email;

  /// The photo URL for the linked provider.
  @JS('photoURL')
  external String get photoUrl;

  /// The linked provider ID (for example, "google.com" for the Google provider).
  external String get providerId;

  /// The phone number for the linked provider.
  external String get phoneNumber;
}

/// Additional metadata about the user.
extension type AuthUserMetadata._(JSObject _) implements JSObject {
  /// The date the user was created, formatted as a UTC string.
  external String get creationTime;

  /// The date the user last signed in, formatted as a UTC string.
  external String get lastSignInTime;
}

/// Interface representing the common properties of a user-enrolled second factor.
extension type AuthMultiFactorInfo._(JSObject _) implements JSObject {
  /// The ID of the enrolled second factor. This ID is unique to the user.
  external String get uid;

  /// The optional display name of the enrolled second factor.
  external String? get displayName;

  /// The type identifier of the second factor. For SMS second factors, this is `phone`.
  external String get factorId;

  /// The optional date the second factor was enrolled, formatted as a UTC string.
  external String? get enrollmentTime;

  /// The phone number associated with a phone second factor.
  external String? get phoneNumber;
}

/// The multi-factor related properties for the current user, if available.
extension type AuthMultiFactorSettings._(JSObject _) implements JSObject {
  /// List of second factors enrolled with the current user.
  external JSArray<AuthMultiFactorInfo> get enrolledFactors;
}

/// The `UserRecord` passed to auth blocking functions from the identity platform.
extension type AuthUserRecord._(JSObject _) implements JSObject {
  /// The user's `uid`.
  external String get uid;

  /// The user's primary email, if set.
  external String? get email;

  /// Whether or not the user's primary email is verified.
  external bool get emailVerified;

  /// The user's display name.
  external String? get displayName;

  /// The user's photo URL.
  @JS('photoURL')
  external String? get photoUrl;

  /// The user's primary phone number, if set.
  external String? get phoneNumber;

  /// Whether or not the user is disabled: `true` for disabled; `false` for
  /// enabled.
  external bool get disabled;

  /// Additional metadata about the user.
  external AuthUserMetadata get metadata;

  /// An array of providers (for example, Google, Facebook) linked to the user.
  external JSArray<AuthUserInfo> get providerData;

  /// The user's hashed password (base64-encoded).
  external String? get passwordHash;

  /// The user's password salt (base64-encoded).
  external String? get passwordSalt;

  /// The user's custom claims object if available, typically used to define
  /// user roles and propagated to an authenticated user's ID token.
  external JSObject? get customClaims;

  /// The ID of the tenant the user belongs to, if available.
  external String? get tenantId;

  /// The date the user's tokens are valid after, formatted as a UTC string.
  external String? get tokensValidAfterTime;

  /// The multi-factor related properties for the current user, if available.
  external AuthMultiFactorSettings? get multiFactor;
}

/// The additional user info component of the auth event context
extension type AdditionalUserInfo._(JSObject _) implements JSObject {
  /// The provider ID for the current auth provider
  external String get providerId;

  /// The user's profile object
  external JSObject? get profile;

  /// The user's username
  external String? get username;

  /// If this user was just created
  external bool get isNewUser;

  /// The user's recaptcha score
  external num? get recaptchaScore;
}

/// The credential component of the auth event context
extension type Credential._(JSObject _) implements JSObject {
  /// The user's claims
  external JSObject? get claims;

  /// The user's ID token
  external String? get idToken;

  /// The user's access token
  external String? get accessToken;

  /// The user's refresh token
  external String? get refreshToken;

  /// The time credential token expires
  external String? get expirationTime;

  /// The secret
  external String? get secret;

  /// The ID of the provider that generated this credential
  external String get providerId;

  /// The sign in method that generated this credential
  external String signInMethod;
}

/// Defines the auth event context for blocking events
extension type AuthEventContext._(JSObject _) implements EventContext {
  /// The locale of the caller
  external String? get locale;

  /// The IP address of the caller
  external String get ipAddress;

  /// The caller's user agent
  external String get userAgent;

  /// Additional user info
  external AdditionalUserInfo? get additionalUserInfo;

  /// The caller's auth credential
  external Credential? get credential;
}

/// Defines the auth event for 2nd gen blocking events
extension type AuthBlockingEvent._(JSObject _) implements AuthEventContext {
  /// The caller's user record
  external AuthUserRecord get data;
}

/// The handler response type for `beforeCreate` blocking events
extension type BeforeCreateResponse._(JSObject _) implements JSObject {
  /// The user's display name
  external String? get displayName;

  /// If this account is disabled
  external bool? get disabled;

  /// If this user's email address is verified
  external bool? get emailVerified;

  /// The url of the user's profile picture
  @JS('photoURL')
  external String? get photoUrl;

  /// Any custom claims set on the user
  external JSObject? get customClaims;

  /// export type RecaptchaActionOptions = "ALLOW" | "BLOCK";
  external String? get recaptchaActionOverride;
}

/// The handler response type for `beforeSignIn` blocking events
extension type BeforeSignInResponse._(JSObject _)
    implements BeforeCreateResponse {
  /// Any claims set on this session
  external JSObject? get sessionClaims;
}
