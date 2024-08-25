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

import 'package:firebase_js_interop/admin.dart';

extension type Messaging._(JSObject _) implements JSObject {
  /**
   * The {@link firebase-admin.app#App} associated with the current `Messaging` service
   * instance.
   *
   * @example
   * ```javascript
   * var app = messaging.app;
   * ```
   */
  external App app();

/**
   * Sends the given message via FCM.
   *
   * @param message - The message payload.
   * @param dryRun - Whether to send the message in the dry-run
   *   (validation only) mode.
   * @returns A promise fulfilled with a unique message ID
   *   string after the message has been successfully handed off to the FCM
   *   service for delivery.
   */
  // TODO: Implement tomorrow
  // external JSPromise<JSString> send(Message message, [bool dryRun]);
}
