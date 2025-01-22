// This is copied verbatim from the JS SDK
// ignore_for_file: doc_directive_unknown

import 'dart:js_interop';

import 'package:firebase_js_interop/src/database_types/index.dart' as rtdb;

import 'package:firebase_js_interop/src/admin/app/index.dart' show App;
import 'package:firebase_js_interop/src/admin/database/database.dart'
    show Database;

export 'database.dart' show Database;
export '../../database_types/index.dart'
    show DataSnapshot, EventType, OnDisconnect, Query, Reference;

export '../utils/error.dart' show FirebaseDatabaseError;

/// Firebase Realtime Database.
///
/// @packageDocumentation
extension type FirebaseAdminDatabase._(JSObject _) implements JSObject {
  /// {@link https://firebase.google.com/docs/reference/js/v8/firebase.database#enablelogging | enableLogging}
  /// function from the `@firebase/database-compat` package.
  external JSAny? enableLogging({JSAny? logger, bool? persistent});

  /// {@link https://firebase.google.com/docs/reference/js/v8/firebase.database.ServerValue | ServerValue}
  /// constant from the `@firebase/database-compat` package.
  // ignore: non_constant_identifier_names
  external rtdb.ServerValue get ServerValue;

  /// Gets the {@link Database} service for the default
  /// app or a given app.
  ///
  /// `getDatabase()` can be called with no arguments to access the default
  /// app's `Database` service or as `getDatabase(app)` to access the
  /// `Database` service associated with a specific app.
  ///
  /// @example
  /// ```javascript
  /// // Get the Database service for the default app
  /// const defaultDatabase = getDatabase();
  /// ```
  ///
  /// @example
  /// ```javascript
  /// // Get the Database service for a specific app
  /// const otherDatabase = getDatabase(app);
  /// ```
  ///
  /// @param App - whose `Database` service to
  ///   return. If not provided, the default `Database` service will be returned.
  ///
  /// @returns The default `Database` service if no app
  ///   is provided or the `Database` service associated with the provided app.
  external Database getDatabase([App app]);

  /// Gets the {@link Database} service for the default
  /// app or a given app.
  ///
  /// `getDatabaseWithUrl()` can be called with no arguments to access the default
  /// app's {@link Database} service or as `getDatabaseWithUrl(app)` to access the
  /// {@link Database} service associated with a specific app.
  ///
  /// @example
  /// ```javascript
  /// // Get the Database service for the default app
  /// const defaultDatabase = getDatabaseWithUrl('https://example.firebaseio.com');
  /// ```
  ///
  /// @example
  /// ```javascript
  /// // Get the Database service for a specific app
  /// const otherDatabase = getDatabaseWithUrl('https://example.firebaseio.com', app);
  /// ```
  ///
  /// @param App - whose `Database` service to
  ///   return. If not provided, the default `Database` service will be returned.
  ///
  /// @returns The default `Database` service if no app
  ///   is provided or the `Database` service associated with the provided app.
  external Database getDatabaseWithUrl(String url, [App app]);
}
