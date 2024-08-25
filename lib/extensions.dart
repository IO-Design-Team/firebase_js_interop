import 'dart:js_interop';

/// Adds convenience methods to [JSObject]
extension FirebaseJsInteropJSObjectExtension on JSObject {
  /// Convert a [JSObject] to a [Map<String, dynamic>]
  Map<String, dynamic> toJson() => (dartify() as Map).cast<String, dynamic>();
}
