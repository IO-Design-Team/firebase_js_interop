import 'dart:js_interop';

/// The typescript error model
extension type Error._(JSObject _) implements JSObject {
  /// The name of the error
  external String get name;

  /// The error message
  external String get message;

  /// The stack trace if available
  external String? get stack;
}
