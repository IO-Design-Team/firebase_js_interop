// The MIT License (MIT)
//
// Copyright (c) 2021 Firebase
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

/// An express request with the wire format representation of the request body.
extension type Request._(JSObject _) implements JSObject {
  /// The wire format representation of the request body.
  external JSUint8Array get rawBody;
}

/// The interface for AppCheck tokens verified in Callable functions
extension type AppCheckData._(JSObject _) implements JSObject {
  /// The app ID of a Firebase App attested by the App Check token.
  external String get appId;

  /// Decoded App Check token.
  // TODO: Implement this class
  // external DecodedAppCheckToken get token;

  /// Indicates if the token has been consumed.
  ///
  /// @remarks
  /// `false` value indicates that this is the first time the App Check service has seen this token and marked the
  /// token as consumed for future use of the token.
  ///
  /// `true` value indicates the token has previously been marked as consumed by the App Check service. In this case,
  ///  consider taking extra precautions, such as rejecting the request or requiring additional security checks.
  external bool? get alreadyConsumed;
}

/// The interface for Auth tokens verified in Callable functions
extension type AuthData._(JSObject _) implements JSObject {
  /// The caller's uid
  external String get uid;

  /// The caller's token
  // TODO: Implement this class
  // external DecodedIdToken get token;
}

/// The request used to call a callable function.
extension type CallableRequest<T extends JSAny?>._(JSObject _)
    implements JSObject {
  /// The parameters used by a client when calling this function.
  external T get data;

  /// The result of decoding and verifying a Firebase AppCheck token.
  external AppCheckData get app;

  /// The result of decoding and verifying a Firebase Auth ID token.
  external AuthData? get auth;

  /// An unverified token for a Firebase Instance ID.
  external String? get instanceIdToken;

  /// The raw request handled by the callable.
  external Request get rawRequest;
}
