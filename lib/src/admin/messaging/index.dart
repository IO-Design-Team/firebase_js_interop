/*!
 * Copyright 2020 Google Inc.
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

import 'package:firebase_js_interop/src/admin/messaging/index.dart';

export 'messaging.dart' show Messaging;
export 'messaging_api.dart'
    show
        AndroidConfig,
        AndroidFcmOptions,
        AndroidNotification,
        ApnsConfig,
        ApnsFcmOptions,
        ApnsPayload,
        Aps,
        ApsAlert,
        BaseMessage,
        BatchResponse,
        CriticalSound,
        ConditionMessage,
        FcmOptions,
        LightSettings,
        Message,
        MessagingTopicManagementResponse,
        MulticastMessage,
        Notification,
        SendResponse,
        TokenMessage,
        TopicMessage,
        WebpushConfig,
        WebpushFcmOptions,
        WebpushNotification;

/// Firebase Cloud Messaging (FCM).
extension type FirebaseAdminMessaging._(JSObject _) implements JSObject {
  /// Gets the {@link Messaging} service for the default app or a given app.
  ///
  /// `admin.messaging()` can be called with no arguments to access the default
  /// app's `Messaging` service or as `admin.messaging(app)` to access the
  /// `Messaging` service associated with aspecific app.
  ///
  /// @example
  /// ```javascript
  /// // Get the Messaging service for the default app
  /// const defaultMessaging = getMessaging();
  /// ```
  ///
  /// @example
  /// ```javascript
  /// // Get the Messaging service for a given app
  /// const otherMessaging = getMessaging(otherApp);
  /// ```
  ///
  /// @param app - Optional app whose `Messaging` service to
  ///   return. If not provided, the default `Messaging` service will be returned.
  ///
  /// @returns The default `Messaging` service if no
  ///   app is provided or the `Messaging` service associated with the provided
  ///   app.
  external Messaging getMessaging([JSObject? app]);
}
