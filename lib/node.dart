import 'dart:js_interop';

/// Node exports
@JS()
external JSObject exports;

/// Node require function
@JS()
external JSObject require(String name);

/// Date object
extension type Date._(JSObject _) implements JSObject {
  /// Create a JS Date object from a Dart DateTime object
  static Date fromDateTime(DateTime dateTime) =>
      Date(dateTime.millisecondsSinceEpoch.toJS);

  /// Constructor
  external Date(JSAny value);
}
