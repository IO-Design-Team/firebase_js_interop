import 'dart:js_interop';

/// A JS interop wrapper for the Express `Request` object.
///
/// This class allows you to interact with the Express `Request` object
/// from Dart code using js_interop. The properties of this class correspond
/// to the properties of the Express `Request` object in JavaScript.
extension type Request._(JSObject _) implements JSObject {
  /// The HTTP method of the request (e.g., GET, POST, etc.).
  external String get method;

  /// The full URL of the request.
  external String get url;

  /// The path of the request (without the query string).
  external String get path;

  /// The headers of the request as a dynamic object (key-value pairs).
  external JSObject get headers;

  /// The query parameters of the request as a dynamic object.
  external JSAny? get query;

  /// The body of the request as a dynamic object (if available).
  external JSAny? get body;
}

/// A JS interop wrapper for the Express `Response` object.
///
/// This class allows you to interact with the Express `Response` object
/// from Dart code using js_interop. The methods and properties of this class
/// correspond to the methods and properties of the Express `Response` object
/// in JavaScript.
extension type Response._(JSObject _) implements JSObject {
  /// Sets the HTTP status for the response.
  external Response status(int code);

  /// Sends the response with the specified body.
  external Response send(JSAny? body);

  /// Sends a JSON response with the specified body.
  external Response json(JSAny? body);

  /// Sets a header field in the response.
  external Response setHeader(String field, String value);

  /// Ends the response process.
  external void end();
}
