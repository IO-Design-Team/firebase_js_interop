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
