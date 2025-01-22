import 'dart:js_interop';

/// Adds convenience methods to [JSAny]
extension FirebaseJsInteropJSAnyExtension on JSAny {
  /// Convert a [JSAny] to a [Map<String, dynamic>]
  Map<String, dynamic> toJson() => (dartify() as Map).cast<String, dynamic>();
}

/// Adds convenience methods to [Map<String, dynamic>]
extension FirebaseJsInteropMapExtension on Map<String, dynamic> {
  /// Convert a [Map<String, dynamic>] to a [JSObject]
  JSObject get toJS => jsify() as JSObject;
}
