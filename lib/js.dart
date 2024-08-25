import 'dart:js_interop';

/// Date object
extension type Date._(JSObject _) implements JSObject {
  /// Create a JS Date object from a Dart DateTime object
  static Date fromDateTime(DateTime dateTime) =>
      Date(dateTime.millisecondsSinceEpoch.toJS);

  /// Constructor
  external Date(JSAny value);

  /// Returns the milliseconds (0 – 999) in the specified date according to local time.
  external int getMilliseconds();

  /// Create a Dart DateTime object from a JS Date object
  DateTime toDateTime() =>
      DateTime.fromMillisecondsSinceEpoch(getMilliseconds());
}

/// Create a [JSPromise] from a Dart function that returns a [Future]
JSPromise<T> promise<T extends JSAny?>(
  Future<T> Function() function,
) =>
    function().toJS;
