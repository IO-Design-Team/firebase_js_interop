import 'dart:js_interop';

/// Node exports
@JS()
external JSObject get exports;

/// Node require function
@JS()
external JSObject require(String name);

/// Node http agent
@JS()
extension type Agent._(JSObject _) implements JSObject {
  // TODO: Add members
}

/// Node process object
extension type Process._(JSObject _) implements JSObject {
  /// Process environment
  external JSObject get env;

  /// Exit the process
  external void exit([JSAny? code]);
}

/// Access to the node process object
@JS()
external Process get process;
