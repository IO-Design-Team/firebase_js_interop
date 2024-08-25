import 'dart:js_interop';

/// A `CloudEventBase` is the base of a cross-platform format for encoding a serverless event.
/// For more information, see https://github.com/cloudevents/spec.
/// @typeParam T - The type of the event data.
/// @beta
extension type CloudEvent<T extends JSObject>._(JSObject _)
    implements JSObject {
  /// Version of the CloudEvents spec for this event.
  external String get specversion;

  /// A globally unique ID for this event.
  external String get id;

  /// The resource that published this event.
  external String get source;

  /// The resource, provided by source, that this event relates to.
  external String? get subject;

  /// The type of event that this represents.
  external String get type;

  /// When this event occurred.
  external String get time;

  /// Information about this specific event.
  external T get data;
}
