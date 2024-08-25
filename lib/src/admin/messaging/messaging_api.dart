// This is copied verbatim from the JS SDK
// ignore_for_file: doc_directive_unknown

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

import 'package:firebase_js_interop/js.dart';
import 'package:firebase_js_interop/src/admin/app/core.dart';

/// Base class for FCM messages
extension type BaseMessage._(JSObject _) implements JSObject {
  /// The data to send in this message
  external JSObject? get data;

  /// The notification that will display to end users
  external Notification? get notification;

  /// The Android-specific options for messages sent through FCM
  external AndroidConfig? get android;

  /// The Webpush-specific options for messages sent through FCM
  external WebpushConfig? get webpush;

  /// The APNs-specific options for messages sent through FCM
  external ApnsConfig? get apns;

  /// Generic FCM options
  external FcmOptions? get fcmOptions;
}

/// A message sent to a single device
extension type TokenMessage._(JSObject _) implements Message {
  /// The FCM registration token to send the message to
  external String get token;

  /// Constructor
  external TokenMessage({
    required String token,
    JSObject? data,
    Notification? notification,
    AndroidConfig? android,
    WebpushConfig? webpush,
    ApnsConfig? apns,
    FcmOptions? fcmOptions,
  });
}

/// A message sent to a topic
extension type TopicMessage._(JSObject _) implements Message {
  /// The topic to send the message to
  external String get topic;

  /// Constructor
  external TopicMessage({
    required String topic,
    JSObject? data,
    Notification? notification,
    AndroidConfig? android,
    WebpushConfig? webpush,
    ApnsConfig? apns,
    FcmOptions? fcmOptions,
  });
}

/// A message sent to a condition
extension type ConditionMessage._(JSObject _) implements Message {
  /// The condition to send the message to
  external String get condition;

  /// Constructor
  external ConditionMessage({
    required String condition,
    JSObject? data,
    Notification? notification,
    AndroidConfig? android,
    WebpushConfig? webpush,
    ApnsConfig? apns,
    FcmOptions? fcmOptions,
  });
}

/// Payload for the {@link Messaging.send} operation. The payload contains all the fields
/// in the BaseMessage type, and exactly one of token, topic or condition.
extension type Message._(JSObject _) implements BaseMessage {}

/// Payload for the {@link Messaging.sendMulticast} method. The payload contains all the fields
/// in the BaseMessage type, and a list of tokens.
extension type MulticastMessage._(JSObject _) implements BaseMessage {
  /// The list of FCM registration tokens to send the message to
  external JSArray<JSString> get tokens;

  /// Constructor
  external MulticastMessage({
    required JSArray<JSString> tokens,
    JSObject? data,
    Notification? notification,
    AndroidConfig? android,
    WebpushConfig? webpush,
    ApnsConfig? apns,
    FcmOptions? fcmOptions,
  });
}

/// A notification that can be included in {@link Message}.
extension type Notification._(JSObject _) implements JSObject {
  /// The title of the notification.
  external String? get title;

  /// The notification body
  external String? get body;

  /// URL of an image to be displayed in the notification.
  external String? get imageUrl;

  /// Constructor
  external Notification({
    String? title,
    String? body,
    String? imageUrl,
  });
}

/// Represents platform-independent options for features provided by the FCM SDKs.
extension type FcmOptions._(JSObject _) implements JSObject {
  /// The label associated with the message's analytics data.
  external String? get analyticsLabel;

  /// Constructor
  external FcmOptions({
    String? analyticsLabel,
  });
}

/// Represents the WebPush protocol options that can be included in an
/// {@link Message}.
extension type WebpushConfig._(JSObject _) implements JSObject {
  /// A collection of WebPush headers. Header values must be strings.
  ///
  /// See {@link https://tools.ietf.org/html/rfc8030#section-5 | WebPush specification}
  /// for supported headers.
  external JSObject? get headers;

  /// A collection of data fields.
  external JSObject? get data;

  /// A WebPush notification payload to be included in the message.
  external WebpushNotification? get notification;

  /// Options for features provided by the FCM SDK for Web.
  external WebpushFcmOptions? get fcmOptions;

  /// Constructor
  external WebpushConfig({
    JSObject? headers,
    JSObject? data,
    WebpushNotification? notification,
    WebpushFcmOptions? fcmOptions,
  });
}

/// Represents options for features provided by the FCM SDK for Web
/// (which are not part of the Webpush standard).
extension type WebpushFcmOptions._(JSObject _) implements JSObject {
  /// The link to open when the user clicks on the notification.
  /// For all URL values, HTTPS is required.
  external String? get link;

  /// Constructor
  external WebpushFcmOptions({
    String? link,
  });
}

/// Web push notification actions structure
@anonymous
extension type WebpushNotificationActions._(JSObject _) implements JSObject {
  /// An action available to the user when the notification is presented
  external String get action;

  /// Optional icon for a notification action.
  external String? get icon;

  /// Title of the notification action.
  external String get title;

  /// Constructor
  external WebpushNotificationActions({
    required String action,
    String? icon,
    required String title,
  });
}

/// Represents the WebPush-specific notification options that can be included in
/// {@link WebpushConfig}. This supports most of the standard
/// options as defined in the Web Notification
/// {@link https://developer.mozilla.org/en-US/docs/Web/API/notification/Notification | specification}.
extension type WebpushNotification._(JSObject _) implements JSObject {
  /// Title text of the notification.
  external String? get title;

  /// An array of notification actions representing the actions
  /// available to the user when the notification is presented.
  external JSArray<WebpushNotificationActions>? get actions;

  /// URL of the image used to represent the notification when there is
  /// not enough space to display the notification itself.
  external String? get badge;

  /// Body text of the notification.
  external String? get body;

  /// Arbitrary data that you want associated with the notification.
  /// This can be of any data type.
  external JSAny? get data;

  /// The direction in which to display the notification. Must be one
  /// of `auto`, `ltr` or `rtl`.
  external String? get dir;

  /// URL to the notification icon.
  external String? get icon;

  /// URL of an image to be displayed in the notification.
  external String? get image;

  /// The notification's language as a BCP 47 language tag.
  external String? get lang;

  /// A boolean specifying whether the user should be notified after a
  /// new notification replaces an old one. Defaults to false.
  external bool? get renotify;

  /// Indicates that a notification should remain active until the user
  /// clicks or dismisses it, rather than closing automatically.
  /// Defaults to false.
  external bool? get requireInteraction;

  /// A boolean specifying whether the notification should be silent.
  /// Defaults to false.
  external bool? get silent;

  /// An identifying tag for the notification.
  external String? get tag;

  /// Timestamp of the notification. Refer to
  /// https://developer.mozilla.org/en-US/docs/Web/API/notification/timestamp
  /// for details.
  external num? get timestamp;

  /// A vibration pattern for the device's vibration hardware to emit
  /// when the notification fires.
  external JSAny? get vibrate;

  // Must be added after construction in Dart
  // [key: string]: any;

  /// Constructor
  external WebpushNotification({
    String? title,
    JSArray<WebpushNotificationActions>? actions,
    String? badge,
    String? body,
    JSAny? data,
    String? dir,
    String? icon,
    String? image,
    String? lang,
    bool? renotify,
    bool? requireInteraction,
    bool? silent,
    String? tag,
    num? timestamp,
    JSAny? vibrate,
  });
}

/// Represents the APNs-specific options that can be included in an
/// {@link Message}. Refer to
/// {@link https://developer.apple.com/library/content/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/CommunicatingwithAPNs.html |
/// Apple documentation} for various headers and payload fields supported by APNs.
extension type ApnsConfig._(JSObject _) implements JSObject {
  /// A collection of APNs headers. Header values must be strings.
  external JSObject? get headers;

  /// An APNs payload to be included in the message.
  external ApnsPayload? get payload;

  /// Options for features provided by the FCM SDK for iOS.
  external ApnsFcmOptions? get fcmOptions;

  /// Constructor
  external ApnsConfig({
    JSObject? headers,
    ApnsPayload? payload,
    ApnsFcmOptions? fcmOptions,
  });
}

/// Represents the payload of an APNs message. Mainly consists of the `aps`
/// dictionary. But may also contain other arbitrary custom keys.
extension type ApnsPayload._(JSObject _) implements JSObject {
  /// The `aps` dictionary to be included in the message.
  external Aps get aps;

  // Must be added after construction in Dart
  // [customData: string]: any;

  /// Constructor
  external ApnsPayload({
    required Aps aps,
  });
}

/// Represents the {@link https://developer.apple.com/library/content/documentation/NetworkingInternet/Conceptual/RemoteNotificationsPG/PayloadKeyReference.html |
/// aps dictionary} that is part of APNs messages.
extension type Aps._(JSObject _) implements JSObject {
  /// Alert to be included in the message. This may be a string or an object of
  /// type `admin.messaging.ApsAlert`.
  external JSAny? get alert;

  /// Badge to be displayed with the message. Set to 0 to remove the badge. When
  /// not specified, the badge will remain unchanged.
  external int? get badge;

  /// Sound to be played with the message.
  external JSAny? get sound;

  /// Specifies whether to configure a background update notification.
  external bool? get contentAvailable;

  /// Specifies whether to set the `mutable-content` property on the message
  /// so the clients can modify the notification via app extensions.
  external bool? get mutableContent;

  /// Type of the notification.
  external String? get category;

  /// An app-specific identifier for grouping notifications.
  external String? get threadId;

  // Must be added after construction in Dart
  // [customData: string]: any;

  /// Constructor
  external Aps({
    JSAny? alert,
    int? badge,
    JSAny? sound,
    bool? contentAvailable,
    bool? mutableContent,
    String? category,
    String? threadId,
  });
}

/// Aps alert
extension type ApsAlert._(JSObject _) implements JSObject {
  /// title
  external String? get title;

  /// subtitle
  external String? get subtitle;

  /// body
  external String? get body;

  /// locKey
  external String? get locKey;

  /// locArgs
  external JSArray<JSString>? get locArgs;

  /// titleLocKey
  external String? get titleLocKey;

  /// titleLocArgs
  external JSArray<JSString>? get titleLocArgs;

  /// subtitleLocKey
  external String? get subtitleLocKey;

  /// subtitleLocArgs
  external JSArray<JSString>? get subtitleLocArgs;

  /// actionLocKey
  external String? get actionLocKey;

  /// launchImage
  external String? get launchImage;

  /// Constructor
  external ApsAlert({
    String? title,
    String? subtitle,
    String? body,
    String? locKey,
    JSArray<JSString>? locArgs,
    String? titleLocKey,
    JSArray<JSString>? titleLocArgs,
    String? subtitleLocKey,
    JSArray<JSString>? subtitleLocArgs,
    String? actionLocKey,
    String? launchImage,
  });
}

/// Represents a critical sound configuration that can be included in the
/// `aps` dictionary of an APNs payload.
extension type CriticalSound._(JSObject _) implements JSObject {
  /// The critical alert flag. Set to `true` to enable the critical alert.
  external bool? get critical;

  /// The name of a sound file in the app's main bundle or in the `Library/Sounds`
  /// folder of the app's container directory. Specify the string "default" to play
  /// the system sound.
  external String? get name;

  /// The volume for the critical alert's sound. Must be a value between 0.0
  /// (silent) and 1.0 (full volume).
  external num? get volume;

  /// Constructor
  external CriticalSound({
    bool? critical,
    String? name,
    num? volume,
  });
}

/// Represents options for features provided by the FCM SDK for iOS.
extension type ApnsFcmOptions._(JSObject _) implements JSObject {
  /// The label associated with the message's analytics data.
  external String? get analyticsLabel;

  /// URL of an image to be displayed in the notification.
  external String? get imageUrl;

  /// Constructor
  external ApnsFcmOptions({
    String? analyticsLabel,
    String? imageUrl,
  });
}

/// Represents the Android-specific options that can be included in an
/// {@link Message}.

extension type AndroidConfig._(JSObject _) implements JSObject {
  /// Collapse key for the message. Collapse key serves as an identifier for a
  /// group of messages that can be collapsed, so that only the last message gets
  /// sent when delivery can be resumed. A maximum of four different collapse keys
  /// may be active at any given time.
  external String? get collapseKey;

  /// Priority of the message. Must be either `normal` or `high`.
  external String? get priority;

  /// Time-to-live duration of the message in milliseconds.
  external int? get ttl;

  /// Package name of the application where the registration tokens must match
  /// in order to receive the message.
  external String? get restrictedPackageName;

  /// A collection of data fields to be included in the message. All values must
  /// be strings. When provided, overrides any data fields set on the top-level
  /// {@link Message}.
  external JSObject? get data;

  /// Android notification to be included in the message.
  external AndroidNotification? get notification;

  /// Options for features provided by the FCM SDK for Android.
  external AndroidFcmOptions? get fcmOptions;

  /// Constructor
  external AndroidConfig({
    String? collapseKey,
    String? priority,
    int? ttl,
    String? restrictedPackageName,
    JSObject? data,
    AndroidNotification? notification,
    AndroidFcmOptions? fcmOptions,
  });
}

/// Represents the Android-specific notification options that can be included in
/// {@link AndroidConfig}.
extension type AndroidNotification._(JSObject _) implements JSObject {
  /// Title of the Android notification. When provided, overrides the title set via
  /// `admin.messaging.Notification`.
  external String? get title;

  /// Body of the Android notification. When provided, overrides the body set via
  /// `admin.messaging.Notification`.
  external String? get body;

  /// Icon resource for the Android notification.
  external String? get icon;

  /// Notification icon color in `#rrggbb` format.
  external String? get color;

  /// File name of the sound to be played when the device receives the
  /// notification.
  external String? get sound;

  /// Notification tag. This is an identifier used to replace existing
  /// notifications in the notification drawer. If not specified, each request
  /// creates a new notification.
  external String? get tag;

  /// URL of an image to be displayed in the notification.
  external String? get imageUrl;

  /// Action associated with a user click on the notification. If specified, an
  /// activity with a matching Intent Filter is launched when a user clicks on the
  /// notification.
  external String? get clickAction;

  /// Key of the body string in the app's string resource to use to localize the
  /// body text.
  external String? get bodyLocKey;

  /// An array of resource keys that will be used in place of the format
  /// specifiers in `bodyLocKey`.
  external JSArray<JSString>? get bodyLocArgs;

  /// Key of the title string in the app's string resource to use to localize the
  /// title text.
  external String? get titleLocKey;

  /// An array of resource keys that will be used in place of the format
  /// specifiers in `titleLocKey`.
  external JSArray<JSString>? get titleLocArgs;

  /// The Android notification channel ID (new in Android O). The app must create
  /// a channel with this channel ID before any notification with this channel ID
  /// can be received. If you don't send this channel ID in the request, or if the
  /// channel ID provided has not yet been created by the app, FCM uses the channel
  /// ID specified in the app manifest.
  external String? get channelId;

  /// Sets the "ticker" text, which is sent to accessibility services. Prior to
  /// API level 21 (Lollipop), sets the text that is displayed in the status bar
  /// when the notification first arrives.
  external String? get ticker;

  /// When set to `false` or unset, the notification is automatically dismissed when
  /// the user clicks it in the panel. When set to `true`, the notification persists
  /// even when the user clicks it.
  external bool? get sticky;

  /// For notifications that inform users about events with an absolute time reference, sets
  /// the time that the event in the notification occurred. Notifications
  /// in the panel are sorted by this time.
  external Date? get eventTimestamp;

  /// Sets whether or not this notification is relevant only to the current device.
  /// Some notifications can be bridged to other devices for remote display, such as
  /// a Wear OS watch. This hint can be set to recommend this notification not be bridged.
  /// See {@link https://developer.android.com/training/wearables/notifications/bridger#existing-method-of-preventing-bridging |
  /// Wear OS guides}.
  external bool? get localOnly;

  /// Sets the relative priority for this notification. Low-priority notifications
  /// may be hidden from the user in certain situations. Note this priority differs
  /// from `AndroidMessagePriority`. This priority is processed by the client after
  /// the message has been delivered. Whereas `AndroidMessagePriority` is an FCM concept
  /// that controls when the message is delivered.
  // priority?: ('min' | 'low' | 'default' | 'high' | 'max');
  external String? get priority;

  /// Sets the vibration pattern to use. Pass in an array of milliseconds to
  /// turn the vibrator on or off. The first value indicates the duration to wait before
  /// turning the vibrator on. The next value indicates the duration to keep the
  /// vibrator on. Subsequent values alternate between duration to turn the vibrator
  /// off and to turn the vibrator on. If `vibrate_timings` is set and `default_vibrate_timings`
  /// is set to `true`, the default value is used instead of the user-specified `vibrate_timings`.
  external JSArray<JSNumber>? get vibrateTimingsMillis;

  /// If set to `true`, use the Android framework's default vibrate pattern for the
  /// notification. Default values are specified in {@link https://android.googlesource.com/platform/frameworks/base/+/master/core/res/res/values/config.xml |
  /// config.xml}. If `default_vibrate_timings` is set to `true` and `vibrate_timings` is also set,
  /// the default value is used instead of the user-specified `vibrate_timings`.
  external bool? get defaultVibrateTimings;

  /// If set to `true`, use the Android framework's default sound for the notification.
  /// Default values are specified in {@link https://android.googlesource.com/platform/frameworks/base/+/master/core/res/res/values/config.xml |
  /// config.xml}.
  external bool? get defaultSound;

  /// Settings to control the notification's LED blinking rate and color if LED is
  /// available on the device. The total blinking time is controlled by the OS.
  external LightSettings? get lightSettings;

  /// If set to `true`, use the Android framework's default LED light settings
  /// for the notification. Default values are specified in {@link https://android.googlesource.com/platform/frameworks/base/+/master/core/res/res/values/config.xml |
  /// config.xml}.
  /// If `default_light_settings` is set to `true` and `light_settings` is also set,
  /// the user-specified `light_settings` is used instead of the default value.
  external bool? get defaultLightSettings;

  /// Sets the visibility of the notification. Must be either `private`, `public`,
  /// or `secret`. If unspecified, defaults to `private`.
  external String? get visibility;

  /// Sets the number of items this notification represents. May be displayed as a
  /// badge count for Launchers that support badging. See {@link https://developer.android.com/training/notify-user/badges |
  /// NotificationBadge}.
  /// For example, this might be useful if you're using just one notification to
  /// represent multiple new messages but you want the count here to represent
  /// the number of total new messages. If zero or unspecified, systems
  /// that support badging use the default, which is to increment a number
  /// displayed on the long-press menu each time a new notification arrives.
  external int? get notificationCount;

  /// Constructor
  external AndroidNotification({
    String? title,
    String? body,
    String? icon,
    String? color,
    String? sound,
    String? tag,
    String? imageUrl,
    String? clickAction,
    String? bodyLocKey,
    JSArray<JSString>? bodyLocArgs,
    String? titleLocKey,
    JSArray<JSString>? titleLocArgs,
    String? channelId,
    String? ticker,
    bool? sticky,
    Date? eventTimestamp,
    bool? localOnly,
    String? priority,
    JSArray<JSNumber>? vibrateTimingsMillis,
    bool? defaultVibrateTimings,
    bool? defaultSound,
    LightSettings? lightSettings,
    bool? defaultLightSettings,
    String? visibility,
    int? notificationCount,
  });
}

/// Represents settings to control notification LED that can be included in
/// {@link AndroidNotification}.
extension type LightSettings._(JSObject _) implements JSObject {
  /// Required. Sets color of the LED in `#rrggbb` or `#rrggbbaa` format.
  external String get color;

  /// Required. Along with `light_off_duration`, defines the blink rate of LED flashes.
  external int get lightOnDurationMillis;

  /// Required. Along with `light_on_duration`, defines the blink rate of LED flashes.
  external int get lightOffDurationMillis;

  /// Constructor
  external LightSettings({
    required String color,
    required int lightOnDurationMillis,
    required int lightOffDurationMillis,
  });
}

/// Represents options for features provided by the FCM SDK for Android.
extension type AndroidFcmOptions._(JSObject _) implements JSObject {
  /// The label associated with the message's analytics data.
  external String? get analyticsLabel;

  /// Constructor
  external AndroidFcmOptions({
    String? analyticsLabel,
  });
}

/// Interface representing the server response from the
/// {@link Messaging.subscribeToTopic} and {@link Messaging.unsubscribeFromTopic}
/// methods.
///
/// See
/// {@link https://firebase.google.com/docs/cloud-messaging/manage-topics |
/// Manage topics from the server} for code samples and detailed documentation.
extension type MessagingTopicManagementResponse._(JSObject _)
    implements JSObject {
  /// The number of registration tokens that could not be subscribed to the topic
  /// and resulted in an error.
  external int get failureCount;

  /// The number of registration tokens that were successfully subscribed to the
  /// topic.
  external int get successCount;

  /// An array of errors corresponding to the provided registration token(s). The
  /// length of this array will be equal to {@link MessagingTopicManagementResponse.failureCount}.
  external JSArray<FirebaseArrayIndexError> get errors;
}

/// Interface representing the server response from the
/// {@link Messaging.sendAll} and {@link Messaging.sendMulticast} methods.
extension type BatchResponse._(JSObject _) implements JSObject {
  /// An array of responses, each corresponding to a message.
  external JSArray<SendResponse> get responses;

  /// The number of messages that were successfully handed off for sending.
  external int get successCount;

  /// The number of messages that resulted in errors when sending.
  external int get failureCount;
}

/// Interface representing the status of an individual message that was sent as
/// part of a batch request.
extension type SendResponse._(JSObject _) implements JSObject {
  /// A boolean indicating if the message was successfully handed off to FCM or
  /// not. When true, the `messageId` attribute is guaranteed to be set. When
  /// false, the `error` attribute is guaranteed to be set.
  external bool get success;

  /// A unique message ID string, if the message was handed off to FCM for
  /// delivery.
  ///
  external String? get messageId;

  /// An error, if the message was not handed off to FCM successfully.
  external FirebaseError? get error;
}
