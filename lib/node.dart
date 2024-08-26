import 'dart:js_interop';

/// Node exports
@JS()
external JSObject exports;

/// Node require function
@JS()
external JSObject require(String name);

/// Node http agent
@JS()
extension type Agent._(JSObject _) implements JSObject {
  // TODO: Add members
}
