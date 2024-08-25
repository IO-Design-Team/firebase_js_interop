// The MIT License (MIT)
//
// Copyright (c) 2023 Firebase
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import 'dart:js_interop';

import 'package:firebase_js_interop/src/functions/v2/core.dart';

/// A CloudEvent that contains a DocumentSnapshot or a Change<DocumentSnapshot>
extension type FirestoreEvent<T>._(JSObject _) implements CloudEvent<T> {
  /// The location of the Firestore instance
  external String get location;

  /// The project identifier
  external String get project;

  /// The Firestore database
  external String get database;

  /// The Firestore namespace
  external String get namespace;

  /// The document path
  external String get document;

  /// An object containing the values of the path patterns.
  /// Only named capture groups will be populated - {key}, {key=*}, {key=**}
  external JSObject get params;
}

/// A FirestoreEvent with auth context
extension type FirestoreAuthEvent<T>._(JSObject _)
    implements FirestoreEvent<T> {
  /// The type of principal that triggered the event
  external String get authType;

  /// The unique identifier for the principal
  external String? get authId;
}

/// DocumentOptions extend EventHandlerOptions with provided document and optional database and namespace.
extension type DocumentOptions._(JSObject _) implements JSObject {
  /// The document path
  external String get document;

  /// The Firestore database
  external String? get database;

  /// The Firestore namespace
  external String? get namespace;
}

/// The Firebase Functions Firestore namespace
extension type FirebaseFunctionsFirestore._(JSObject _) implements JSObject {
  /// Event handler that triggers when a document is created, updated, or deleted in Firestore.
  ///
  /// @param documentOrOpts - Options or a string document path.
  /// @param handler - Event handler which is run every time a Firestore create, update, or delete occurs.
  external JSFunction onDocumentWritten(
    JSAny documentOrOpts,
    // (FirestoreEvent<DocumentSnapshot> event) {}
    JSFunction handler,
  );

  /// Event handler that triggers when a document is created, updated, or deleted in Firestore.
  /// This trigger also provides the authentication context of the principal who triggered the event.
  ///
  /// @param document - The Firestore document path to trigger on.
  /// @param handler - Event handler which is run every time a Firestore create, update, or delete occurs.
  external JSFunction onDocumentWrittenWithAuthContext(
    JSAny documentOrOpts,
    // (FirestoreAuthEvent<DocumentSnapshot> event) {}
    JSFunction handler,
  );

  /// Event handler that triggers when a document is created in Firestore.
  ///
  /// @param documentOrOpts - Options or a string document path.
  /// @param handler - Event handler which is run every time a Firestore create occurs.
  external JSFunction onDocumentCreated(
    JSAny documentOrOpts,
    // (FirestoreEvent<DocumentSnapshot> event) {}
    JSFunction handler,
  );

  /// Event handler that triggers when a document is created in Firestore.
  ///
  /// @param documentOrOpts - Options or a string document path.
  /// @param handler - Event handler which is run every time a Firestore create occurs.
  external JSFunction onDocumentCreatedWithAuthContext(
    JSAny documentOrOpts,
    // (FirestoreAuthEvent<QueryDocumentSnapshot> event) {}
    JSFunction handler,
  );

  /// Event handler that triggers when a document is updated in Firestore.
  ///
  /// @param documentOrOpts - Options or a string document path.
  /// @param handler - Event handler which is run every time a Firestore update occurs.
  external JSFunction onDocumentUpdated(
    JSAny documentOrOpts,
    JSFunction handler,
  );

  /// Event handler that triggers when a document is updated in Firestore.
  ///
  /// @param documentOrOpts - Options or a string document path.
  /// @param handler - Event handler which is run every time a Firestore update occurs.
  external JSFunction onDocumentUpdatedWithAuthContext(
    JSAny documentOrOpts,
    // (FirestoreAuthEvent<QueryDocumentSnapshot> event) {}
    JSFunction handler,
  );

  /// Event handler that triggers when a document is deleted in Firestore.
  ///
  /// @param documentOrOpts - Options or a string document path.
  /// @param handler - Event handler which is run every time a Firestore delete occurs.
  external JSFunction onDocumentDeleted(
    JSAny documentOrOpts,
    // (FirestoreAuthEvent<QueryDocumentSnapshot> event) {}
    JSFunction handler,
  );

  /// Event handler that triggers when a document is deleted in Firestore.
  ///
  /// @param documentOrOpts - Options or a string document path.
  /// @param handler - Event handler which is run every time a Firestore delete occurs.
  external JSFunction onDocumentDeletedWithAuthContext(
    JSAny documentOrOpts,
    // (FirestoreAuthEvent<QueryDocumentSnapshot> event) {}
    JSFunction handler,
  );
}
