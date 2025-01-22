import 'dart:js_interop';

/// Firebase Options
extension type FirebaseOptions._(JSObject _) implements JSObject {
  /// API key
  external String? get apiKey;

  /// Auth domain
  external String? get authDomain;

  /// Database URL
  @JS('databaseURL')
  external String? get databaseUrl;

  /// Project ID
  external String? get projectId;

  /// Storage bucket
  external String? get storageBucket;

  /// Messaging sender ID
  external String? get messagingSenderId;

  /// App ID
  external String? get appId;

  /// Measurement ID
  external String? get measurementId;
}

/// Firebase App
extension type FirebaseApp._(JSObject _) implements JSObject {
  /// The (read-only) name (identifier) for this App. '[DEFAULT]' is the default
  /// App.
  external String get name;

  /// The (read-only) configuration options from the app initialization.
  external FirebaseOptions get options;

  /// The settable config flag for GDPR opt-in/opt-out
  external bool automaticDataCollectionEnabled;

  /// Make the given App unusable and free resources.
  external JSPromise delete();
}
