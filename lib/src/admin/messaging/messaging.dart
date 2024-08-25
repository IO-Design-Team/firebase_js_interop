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
import 'package:firebase_js_interop/src/admin/messaging/messaging_api.dart';

/// Messaging service bound to the provided app.
extension type Messaging._(JSObject _) implements JSObject {
  /// The {@link firebase-admin.app#App} associated with the current `Messaging` service
  /// instance.
  ///
  /// @example
  /// ```javascript
  /// var app = messaging.app;
  /// ```
  external App app();

  /// Sends the given message via FCM.
  ///
  /// @param message - The message payload.
  /// @param dryRun - Whether to send the message in the dry-run
  ///   (validation only) mode.
  /// @returns A promise fulfilled with a unique message ID
  ///   string after the message has been successfully handed off to the FCM
  ///   service for delivery.
  external JSPromise<JSString> send(Message message, [bool dryRun]);

  /// Sends each message in the given array via Firebase Cloud Messaging.
  ///
  /// Unlike {@link Messaging.sendAll}, this method makes a single RPC call for each message
  /// in the given array.
  ///
  /// The responses list obtained from the return value corresponds to the order of `messages`.
  /// An error from this method or a `BatchResponse` with all failures indicates a total failure,
  /// meaning that none of the messages in the list could be sent. Partial failures or no
  /// failures are only indicated by a `BatchResponse` return value.
  ///
  /// @param messages - A non-empty array
  ///   containing up to 500 messages.
  /// @param dryRun - Whether to send the messages in the dry-run
  ///   (validation only) mode.
  /// @returns A Promise fulfilled with an object representing the result of the
  ///   send operation.
  external JSPromise<BatchResponse> sendEach(
    JSArray<Message> messages, [
    bool dryRun,
  ]);

  /// Sends the given multicast message to all the FCM registration tokens
  /// specified in it.
  ///
  /// This method uses the {@link Messaging.sendEach} API under the hood to send the given
  /// message to all the target recipients. The responses list obtained from the
  /// return value corresponds to the order of tokens in the `MulticastMessage`.
  /// An error from this method or a `BatchResponse` with all failures indicates a total
  /// failure, meaning that the messages in the list could be sent. Partial failures or
  /// failures are only indicated by a `BatchResponse` return value.
  ///
  /// @param message - A multicast message
  ///   containing up to 500 tokens.
  /// @param dryRun - Whether to send the message in the dry-run
  ///   (validation only) mode.
  /// @returns A Promise fulfilled with an object representing the result of the
  ///   send operation.
  external JSPromise<BatchResponse> sendEachForMulticast(
    MulticastMessage message, [
    bool dryRun,
  ]);

  // TODO: The rest of the methods
}
