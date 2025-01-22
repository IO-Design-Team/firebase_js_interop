/*!
 * @license
 * Copyright 2017 Google LLC
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

import 'package:firebase_js_interop/src/app_types/index.dart' show FirebaseApp;

/// Represents a child snapshot of a `Reference` that is being iterated over.
/// The key will never be undefined.
extension type IteratedDataSnapshot._(JSObject _) implements DataSnapshot {
  /// key of the location of this snapshot.
  external String get key;
}

/// A [DataSnapshot] contains data from a Database location.
extension type DataSnapshot._(JSObject _) {
  /// Gets another [DataSnapshot] for the location at the specified relative path.
  external DataSnapshot child(String path);

  /// Returns true if this [DataSnapshot] contains any data. It is slightly
  /// more efficient than using `snapshot.val() !== null`.
  external bool exists();

  /// Exports the entire contents of the DataSnapshot as a JavaScript object.
  ///
  /// The `exportVal()` method is similar to `val()`, except priority
  /// information is included (if available), making it suitable for backing up
  /// your data.
  external JSAny? exportVal();

  /// Enumerates the top-level children in the DataSnapshot.
  ///
  /// [action]: A function that will be called for each child DataSnapshot. The
  /// callback can return true to cancel further enumeration.
  external bool forEach(
    //  (a: IteratedDataSnapshot) => boolean | void
    JSFunction action,
  );

  /// Gets the priority value of the data in this [DataSnapshot].
  external JSAny? getPriority();

  /// Returns true if the specified child path has (non-null) data.
  external bool hasChild(String path);

  /// Returns whether or not the [DataSnapshot] has any non-`null` child
  /// properties.
  external bool hasChildren();

  /// The key (last part of the path) of the location of this [DataSnapshot].
  external String? get key;

  /// Returns the number of child properties of this [DataSnapshot].
  external int numChildren();

  /// The [Reference] for the location that generated this DataSnapshot.
  external Reference get ref;

  /// Returns a JSON-serializable representation of this object.
  @JS('toJSON')
  external JSObject? toJson();

  /// Extracts a JavaScript value from a [DataSnapshot].
  external JSAny? val();
}

/// Database emulator options structure
@anonymous
extension type DatabaseEmulatorOptions._(JSObject _) implements JSObject {
  /// the mock auth token to use for unit testing Security Rules
  // TODO: Structure EmulatorMockTokenOptions
  external JSAny? get mockUserToken;
}

/// The Firebase Database service interface.
extension type FirebaseDatabase._(JSObject _) implements JSObject {
  /// The `app` associated with the [Database] service instance.
  external FirebaseApp get app;

  /// Modify this instance to communicate with the Realtime Database emulator.
  ///
  /// Note: This method must be called before performing any other operation.
  external void useEmulator(
    String host,
    int port, [
    DatabaseEmulatorOptions options,
  ]);

  /// Disconnects from the server (all Database operations will be completed
  /// offline).
  external void goOffline();

  /// Reconnects to the server and synchronizes the offline Database state with
  /// the server state.
  external void goOnline();

  /// Returns a [Reference] representing the location in the Database
  /// corresponding to the provided path. If no path is provided, the
  /// [Reference] will point to the root of the Database.
  external Reference ref([JSAny path]);

  /// Returns a [Reference] representing the location in the Database
  /// corresponding to the provided Firebase URL.
  external Reference refFromURL(String url);
}

/// The `onDisconnect` class allows you to write or clear data when your client
/// disconnects from the Database server. These updates occur whether your
/// client disconnects cleanly or not, so you can rely on them to clean up data
/// even if a connection is dropped or a client crashes.
extension type OnDisconnect._(JSObject _) implements JSObject {
  /// Cancels all previously queued `onDisconnect()` set or update events for
  /// this location and all children.
  external JSPromise cancel([
    // (a: Error | null) => any
    JSFunction onComplete,
  ]);

  /// Ensures the data at this location is deleted when the client is
  /// disconnected (due to closing the browser, navigating to a new page, or
  /// network issues).
  external JSPromise remove([
    // (a: Error | null) => any
    JSFunction onComplete,
  ]);

  /// Ensures the data at this location is set to the specified value when the
  /// client is disconnected (due to closing the browser, navigating to a new
  /// page, or network issues).
  external JSPromise set(
    JSAny? value, [
    // (a: Error | null) => any
    JSFunction onComplete,
  ]);

  /// Ensures the data at this location is set to the specified value and
  /// priority when the client is disconnected (due to closing the browser,
  /// navigating to a new page, or network issues).
  external JSPromise<JSAny?> setWithPriority(
    JSAny? value,
    JSAny? priority, [
    // (a: Error | null) => any
    JSFunction onComplete,
  ]);

  /// Writes multiple values at this location when the client is disconnected
  /// (due to closing the browser, navigating to a new page, or network issues).
  external JSPromise update(
    JSObject values, [
    // (a: Error | null) => any
    JSFunction onComplete,
  ]);
}

/// Query event types
class EventType {
  EventType._();

  /// value
  static const value = 'value';

  /// child_added
  static const childAdded = 'child_added';

  /// child_changed
  static const childChanged = 'child_changed';

  /// child_moved
  static const childMoved = 'child_moved';

  /// child_removed
  static const childRemoved = 'child_removed';
}

/// A [Query] sorts and filters the data at a Database location so only a subset
/// of the child data is included. This can be used to order a collection of
/// data by some attribute (for example, height of dinosaurs) as well as to
/// restrict a large list of items (for example, chat messages) down to a number
/// suitable for synchronizing to the client. Queries are created by chaining
/// together one or more of the filter methods defined here.
extension type Query._(JSObject _) implements JSObject {
  /// Creates a [Query] with the specified ending point (exclusive).
  external Query endBefore(JSAny? value, [String key]);

  /// Creates a [Query] with the specified ending point.
  external Query endAt(JSAny? value, [String key]);

  /// Creates a [Query] that includes children that match the specified value.
  external Query equalTo(JSAny? value, [String key]);

  /// Returns whether or not the current and provided queries represent the same
  /// location, have the same query parameters, and are from the same instance
  /// of `firebase.app.App`.
  external bool isEqual(Query? other);

  /// Generates a new [Query] limited to the first specific number of children.
  external Query limitToFirst(int limit);

  /// Generates a new [Query] object limited to the last specific number of children.
  external Query limitToLast(int limit);

  /// Detaches a callback previously attached with `on()`.
  external void off({
    String eventType,
    // (a: DataSnapshot, b?: string | null) => any
    JSFunction callback,
    JSObject? context,
  });

  /// Gets the most up-to-date result for this query.
  external JSPromise<DataSnapshot> get();

  /// Listens for data changes at a particular location.
  ///
  /// The provided callback function is returned unmodified. This is just for
  /// convenience if you want to pass an inline function to `on()` but store the
  /// callback function for later passing to `off()`.
  external JSFunction on(
    String eventType,
    // (a: DataSnapshot, b?: string | null) => any
    JSFunction callback, [
    // (a: Error) => any)
    JSObject? cancelCallbackOrContext,
    JSObject? context,
  ]);

  /// Listens for exactly one event of the specified event type, and then stops
  /// listening.
  external JSPromise<DataSnapshot> once(
    String eventType, [
    // (a: DataSnapshot, b?: string | null) => any
    JSFunction successCallback,
    // (a: Error) => any
    JSObject? failureCallbackOrContext,
    JSObject? context,
  ]);

  /// Generates a new [Query] object ordered by the specified child key.
  external Query orderByChild(String path);

  /// Generates a new [Query] object ordered by key.
  external Query orderByKey();

  /// Generates a new [Query] object ordered by priority.
  external Query orderByPriority();

  /// Generates a new [Query] object ordered by value.
  external Query orderByValue();

  /// Returns a [Reference] to the [Query]'s location.
  external Reference get ref;

  /// Creates a [Query] with the specified starting point.
  external Query startAt(JSAny? value, [String key]);

  /// Creates a [Query] with the specified starting point (exclusive).
  external Query startAfter(JSAny? value, [String key]);

  /// Returns a JSON-serializable representation of this object.
  @JS('toJSON')
  external JSObject toJson();

  /// Gets the absolute URL for this location.
  @JS('toString')
  external String getUrl();
}

/// Server values
extension type ServerValue._(JSObject _) implements JSObject {
  /// A placeholder value for auto-populating the current timestamp (time since
  /// the Unix epoch, in milliseconds) as determined by the Firebase servers.
  @JS('TIMESTAMP')
  external JSObject get timestamp;

  /// Returns a placeholder value that can be used to atomically increment the
  /// current database value by the provided delta.
  external JSObject increment(num delta);
}
