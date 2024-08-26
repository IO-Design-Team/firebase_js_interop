import 'dart:js_interop';

/// Date object
extension type Date._(JSObject _) implements JSObject {
  /// Create a JS Date object from a Dart DateTime object
  static Date fromDateTime(DateTime dateTime) =>
      Date(dateTime.millisecondsSinceEpoch.toJS);

  /// Constructor
  external Date(JSAny value);

  /// Returns the numeric value of the specified date as the number of
  /// milliseconds since January 1, 1970 00:00:00 UTC. (Negative values are
  /// returned for prior times.)
  external int getTime();

  /// Create a Dart DateTime object from a JS Date object
  DateTime toDateTime() => DateTime.fromMillisecondsSinceEpoch(getTime());
}

/// Create a [JSPromise] from a Dart function that returns a [Future]
JSPromise<T> promise<T extends JSAny?>(
  Future<T> Function() function,
) =>
    function().toJS;
