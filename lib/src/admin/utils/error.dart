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
import 'dart:js_interop_unsafe';

import 'package:firebase_js_interop/node.dart';
import 'package:firebase_js_interop/src/admin/app/index.dart' as app
    show FirebaseError;

/// Firebase error code structure. This extends Error.
extension type FirebaseError._(JSObject _) implements app.FirebaseError {
  /// @returns The error code.
  external String code();

  /// @returns The error message.
  external String message();

  /// @returns The object representation of the error.
  @JS('toJSON')
  external JSObject toJson();
}

/// A FirebaseError with a prefix in front of the error code.
extension type PrefixedFirebaseError._(JSObject _) implements FirebaseError {
  /// Allows the error type to be checked without needing to know implementation details
  /// of the code prefixing.
  ///
  /// @param code - The non-prefixed error code to test against.
  /// @returns True if the code matches, false otherwise.
  external bool hasCode(String code);
}

/// Firebase App error code structure. This extends PrefixedFirebaseError.
extension type FirebaseAppError._(JSObject _)
    implements PrefixedFirebaseError {}

/// Static members on [AppErrorCodes]
extension type AppErrorCodesStatic._(JSObject _) implements FirebaseError {
  /// APP_DELETED
  @JS('APP_DELETED')
  external String get appDeleted;

  /// DUPLICATE_APP
  @JS('DUPLICATE_APP')
  external String get duplicateApp;

  /// INVALID_ARGUMENT
  @JS('INVALID_ARGUMENT')
  external String get invalidArgument;

  /// INTERNAL_ERROR
  @JS('INTERNAL_ERROR')
  external String get internalError;

  /// INVALID_APP_NAME
  @JS('INVALID_APP_NAME')
  external String get invalidAppName;

  /// INVALID_APP_OPTIONS
  @JS('INVALID_APP_OPTIONS')
  external String get invalidAppOptions;

  /// INVALID_CREDENTIAL
  @JS('INVALID_CREDENTIAL')
  external String get invalidCredential;

  /// NETWORK_ERROR
  @JS('NETWORK_ERROR')
  external String get networkError;

  /// NETWORK_TIMEOUT
  @JS('NETWORK_TIMEOUT')
  external String get networkTimeout;

  /// NO_APP
  @JS('NO_APP')
  external String get noApp;

  /// UNABLE_TO_PARSE_RESPONSE
  @JS('UNABLE_TO_PARSE_RESPONSE')
  external String get unableToParseResponse;
}

/// App client error codes and their default messages.
extension type AppErrorCodes._(JSObject _) implements FirebaseError {
  static AppErrorCodesStatic get static =>
      require('firebase-admin/utils/error')['AppErrorCodes']
          as AppErrorCodesStatic;
}
