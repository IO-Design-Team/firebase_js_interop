import 'dart:convert';
import 'dart:js_interop';

/// Adds convenience methods to [JSObject]
extension FirebaseJsInteropJSObjectExtension on JSObject {
  /// Convert a [JSObject] to a [Map<String, dynamic>]
  // TODO: Is there a better way to do this?
  Map<String, dynamic> toJson() => jsonDecode(jsonEncode(this));
}
