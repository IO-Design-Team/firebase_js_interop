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

export 'core.dart' show App, AppOptions, FirebaseArrayIndexError, FirebaseError;
export 'lifecycle.dart';

export 'credential.dart'
    show Credential, ServiceAccount, GoogleOAuthAccessToken;
export 'credential_factory.dart';

export '../utils/error.dart' show FirebaseAppError, AppErrorCodes;

/// Firebase App and SDK initialization.
extension type FirebaseAdminApp._(JSObject _) implements JSObject {
  /// SDK_VERSION
  @JS('SDK_VERSION')
  external String get sdkVersion;
}
