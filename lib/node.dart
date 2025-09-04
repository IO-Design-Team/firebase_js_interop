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

/// Access to Node components
abstract final class Node {
  /// Access to file system methods
  static NodeFs get fs => require('node:fs') as NodeFs;
}

/// Node file system access
extension type NodeFs._(JSObject _) implements JSObject {
  /// `path` string | Buffer | URL | integer filename or file descriptor
  /// `options` Object | string
  /// `encoding` string | null Default: null
  /// `flag` string See support of file system flags. Default: 'r'.
  /// Returns: string | Buffer
  ///
  /// Returns the contents of the path.
  ///
  /// If the encoding option is specified then this function returns a string. Otherwise it returns a buffer.
  ///
  /// Ex to read a file as a string: `fs.readFileSync('/Users/joe/test.txt', 'utf8');`
  external JSAny readFileSync(JSAny path, JSAny options);
}
