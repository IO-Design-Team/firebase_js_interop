// The MIT License (MIT)
//
// Copyright (c) 2017 Firebase
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

// This is coped verbatim from the JS SDK
// ignore_for_file: doc_directive_unknown

import 'dart:js_interop';

/// The auth field of [EventContext]
@anonymous
extension type EventContextAuth._(JSObject _) implements JSObject {
  /// The auth token
  external JSObject get token;

  /// The caller's uid
  external String get uid;
}

/// The context in which an event occurred.
///
/// @remarks
/// An EventContext describes:
/// - The time an event occurred.
/// - A unique identifier of the event.
/// - The resource on which the event occurred, if applicable.
/// - Authorization of the request that triggered the event, if applicable and
///   available.
extension type EventContext._(JSObject _) implements JSObject {
  /// Authentication information for the user that triggered the function.
  ///
  /// @remarks
  /// This object contains `uid` and `token` properties for authenticated users.
  /// For more detail including token keys, see the
  /// {@link https://firebase.google.com/docs/reference/rules/rules#properties | security rules reference}.
  ///
  /// This field is only populated for Realtime Database triggers and Callable
  /// functions. For an unauthenticated user, this field is null. For Firebase
  /// admin users and event types that do not provide user information, this field
  /// does not exist.
  external EventContextAuth? get auth;

  /// The level of permissions for a user.
  ///
  /// @remarks
  /// Valid values are:
  ///
  /// - `ADMIN`: Developer user or user authenticated via a service account.
  ///
  /// - `USER`: Known user.
  ///
  /// - `UNAUTHENTICATED`: Unauthenticated action
  ///
  /// - `null`: For event types that do not provide user information (all except
  ///   Realtime Database).
  external String? get authType;

  /// The event’s unique identifier.
  external String get eventId;

  /// Type of event.
  ///
  /// @remarks
  /// Possible values are:
  ///
  /// - `google.analytics.event.log`
  ///
  /// - `google.firebase.auth.user.create`
  ///
  /// - `google.firebase.auth.user.delete`
  ///
  /// - `google.firebase.database.ref.write`
  ///
  /// - `google.firebase.database.ref.create`
  ///
  /// - `google.firebase.database.ref.update`
  ///
  /// - `google.firebase.database.ref.delete`
  ///
  /// - `google.firestore.document.write`
  ///
  /// - `google.firestore.document.create`
  ///
  /// - `google.firestore.document.update`
  ///
  /// - `google.firestore.document.delete`
  ///
  /// - `google.pubsub.topic.publish`
  ///
  /// - `google.firebase.remoteconfig.update`
  ///
  /// - `google.storage.object.finalize`
  ///
  /// - `google.storage.object.archive`
  ///
  /// - `google.storage.object.delete`
  ///
  /// - `google.storage.object.metadataUpdate`
  ///
  /// - `google.testing.testMatrix.complete`
  external String get eventType;

  /// An object containing the values of the wildcards in the `path` parameter
  /// provided to the {@link fireabase-functions.v1.database#ref | `ref()`} method for a Realtime Database trigger.
  external JSObject get params;

  /// The resource that emitted the event.
  ///
  /// @remarks
  /// Valid values are:
  ///
  /// Analytics: `projects/<projectId>/events/<analyticsEventType>`
  ///
  /// Realtime Database: `projects/_/instances/<databaseInstance>/refs/<databasePath>`
  ///
  /// Storage: `projects/_/buckets/<bucketName>/objects/<fileName>#<generation>`
  ///
  /// Authentication: `projects/<projectId>`
  ///
  /// Pub/Sub: `projects/<projectId>/topics/<topicName>`
  ///
  /// Because Realtime Database instances and Cloud Storage buckets are globally
  /// unique and not tied to the project, their resources start with `projects/_`.
  /// Underscore is not a valid project name.
  external Resource get resource;

  /// Timestamp for the event as an {@link https://www.ietf.org/rfc/rfc3339.txt | RFC 3339} string.
  external String get timestamp;
}

/// Resource is a standard format for defining a resource
/// (google.rpc.context.AttributeContext.Resource). In Cloud Functions, it is the
/// resource that triggered the function - such as a storage bucket.
extension type Resource._(JSObject _) implements JSObject {
  /// The name of the service that this resource belongs to.
  external String get service;

  /// The stable identifier (name) of a resource on the service.
  /// A resource can be logically identified as "//{resource.service}/{resource.name}"
  external String get name;

  /// The type of the resource. The syntax is platform-specific because different platforms define their resources differently.
  /// For Google APIs, the type format must be "{service}/{kind}"
  external String? get type;

  /// Map of Resource's labels.
  external JSObject? get labels;
}
