// This is copied verbatim from the JS SDK
// ignore_for_file: constant_identifier_names, doc_directive_unknown

/*!
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import 'dart:js_interop';

import 'package:firebase_js_interop/js.dart';
import 'package:firebase_js_interop/src/utils.dart';
import 'package:firebase_js_interop/typescript.dart';

/// Converter used by `withConverter()` to transform user objects of type
/// `AppModelType` into Firestore data of type `DbModelType`.
///
/// Using the converter allows you to specify generic type arguments when
/// storing and retrieving objects from Firestore.
///
/// In this context, an "AppModel" is a class that is used in an application to
/// package together related information and functionality. Such a class could,
/// for example, have properties with complex, nested data types, properties
/// used for memoization, properties of types not supported by Firestore (such
/// as `symbol` and `bigint`), and helper functions that perform compound
/// operations. Such classes are not suitable and/or possible to store into a
/// Firestore database. Instead, instances of such classes need to be converted
/// to "plain old JavaScript objects" (POJOs) with exclusively primitive
/// properties, potentially nested inside other POJOs or arrays of POJOs. In
/// this context, this type is referred to as the "DbModel" and would be an
/// object suitable for persisting into Firestore. For convenience,
/// applications can implement `FirestoreDataConverter` and register the
/// converter with Firestore objects, such as `DocumentReference` or `Query`,
/// to automatically convert `AppModel` to `DbModel` when storing into
/// Firestore, and convert `DbModel` to `AppModel` when retrieving from
/// Firestore.
extension type FirestoreDataConverter._(JSObject _) implements JSObject {
  /// Called by the Firestore SDK to convert a custom model object of type
  /// `AppModelType` into a plain Javascript object (suitable for writing
  /// directly to the Firestore database) of type `DbModelType`.
  ///
  /// To use set() with `merge` and `mergeFields`,
  /// toFirestore() must be defined with `Partial<T>`.
  ///
  /// The `WithFieldValue<T>` type extends `T` to also allow FieldValues such
  /// as `FieldValue.delete()` to be used as property values.
  external JSObject toFirestore(JSObject modelObject, [SetOptions options]);

  /// Called by the Firestore SDK to convert Firestore data into an object of
  /// type `AppModelType`. You can access your data by calling:
  /// `snapshot.data()`.
  ///
  /// Generally, the data returned from `snapshot.data()` can be cast to
  /// `DbModelType`; however, this is not guaranteed because Firestore does not
  /// enforce a schema on the database. For example, writes from a previous
  /// version of the application or writes from another client that did not use
  /// a type converter could have written data with different properties and/or
  /// property types. The implementation will need to choose whether to
  /// gracefully recover from non-conforming data or throw an error.
  external JSObject fromFirestore(QueryDocumentSnapshot snapshot);
}

/// Settings used to directly configure a `Firestore` instance.
extension type Settings._(JSObject _) implements JSObject {
  /// The project ID from the Google Developer's Console, e.g.
  /// 'grape-spaceship-123'. We will also check the environment variable
  /// GCLOUD_PROJECT for your project ID.  Can be omitted in environments that
  /// support {@link https://cloud.google.com/docs/authentication Application
  /// Default Credentials}
  external String? get projectId;

  /// The database name. If omitted, the default database will be used.
  external String? get databaseId;

  /// The hostname to connect to.
  external String? get host;

  /// The port to connect to.
  external int? get port;

  /// Local file containing the Service Account credentials as downloaded from
  /// the Google Developers Console. Can  be omitted in environments that
  /// support {@link https://cloud.google.com/docs/authentication Application
  /// Default Credentials}. To configure Firestore with custom credentials, use
  /// the `credentials` property to provide the `client_email` and
  /// `private_key` of your service account.
  external String? get keyFilename;

  /// The 'client_email' and 'private_key' properties of the service account
  /// to use with your Firestore project. Can be omitted in environments that
  /// support {@link https://cloud.google.com/docs/authentication Application
  /// Default Credentials}. If your credentials are stored in a JSON file, you
  /// can specify a `keyFilename` instead.
  external JSObject? get credentials;

  /// Whether to use SSL when connecting.
  external bool? get ssl;

  /// The maximum number of idle GRPC channels to keep. A smaller number of idle
  /// channels reduces memory usage but increases request latency for clients
  /// with fluctuating request rates. If set to 0, shuts down all GRPC channels
  /// when the client becomes idle. Defaults to 1.
  external int? get maxIdleChannels;

  /// Whether to use `BigInt` for integer types when deserializing Firestore
  /// Documents. Regardless of magnitude, all integer values are returned as
  /// `BigInt` to match the precision of the Firestore backend. Floating point
  /// numbers continue to use JavaScript's `number` type.
  external bool? get useBigInt;

  /// Whether to skip nested properties that are set to `undefined` during
  /// object serialization. If set to `true`, these properties are skipped
  /// and not written to Firestore. If set `false` or omitted, the SDK throws
  /// an exception when it encounters properties of type `undefined`.
  external bool? get ignoreUndefinedProperties;

  /// Whether to force the use of HTTP/1.1 REST transport until a method that requires gRPC
  /// is called. When a method requires gRPC, this Firestore client will load dependent gRPC
  /// libraries and then use gRPC transport for communication from that point forward.
  /// Currently the only operation that requires gRPC is creating a snapshot listener with
  /// the method `DocumentReference<T>.onSnapshot()`, `CollectionReference<T>.onSnapshot()`,
  /// or `Query<T>.onSnapshot()`.
  external bool? get preferRest;

  // Must be set after initialization in Dart
  // [key: string]: any; // Accept other properties, such as GRPC settings.

  /// Constructor
  external factory Settings({
    String? projectId,
    String? databaseId,
    String? host,
    int? port,
    String? keyFilename,
    JSObject? credentials,
    bool? ssl,
    int? maxIdleChannels,
    bool? useBigInt,
    bool? ignoreUndefinedProperties,
    bool? preferRest,
  });
}

/// Options to configure a transaction.
extension type TransactionOptions._(JSObject _) implements JSObject {
  /// Set to true to indicate a read-only transaction.
  external bool readOnly;

  /// If specified, documents are read at the given time. This may not be more
  /// than 60 seconds in the past from when the request is processed by the
  /// server.
  ///
  /// Only available if [readOnly] is true.
  external Timestamp? get readTime;

  /// The maximum number of attempts for this transaction. Defaults to 5.
  ///
  /// Only available if [readOnly] is false.
  external int? get maxAttempts;

  /// Constructor
  external factory TransactionOptions({
    bool readOnly,
    Timestamp? readTime,
    int? maxAttempts,
  });
}

/// `Firestore` represents a Firestore Database and is the entry point for all
/// Firestore operations.
extension type Firestore._(JSObject _) implements JSObject {
  /// Specifies custom settings to be used to configure the `Firestore`
  /// instance. Can only be invoked once and before any other Firestore
  /// method.
  ///
  /// If settings are provided via both `settings()` and the `Firestore`
  /// constructor, both settings objects are merged and any settings provided
  /// via `settings()` take precedence.
  ///
  /// @param {object} settings The settings to use for all Firestore
  /// operations.
  external void settings(Settings settings);

  /// Returns the Database ID for this Firestore instance.
  external String databaseId();

  /// Gets a `CollectionReference` instance that refers to the collection at
  /// the specified path.
  ///
  /// @param collectionPath A slash-separated path to a collection.
  /// @return The `CollectionReference` instance.
  external CollectionReference collection(String collectionPath);

  /// Gets a `DocumentReference` instance that refers to the document at the
  /// specified path.
  ///
  /// @param documentPath A slash-separated path to a document.
  /// @return The `DocumentReference` instance.
  external DocumentReference doc(String documentPath);

  /// Creates and returns a new Query that includes all documents in the
  /// database that are contained in a collection or subcollection with the
  /// given collectionId.
  ///
  /// @param collectionId Identifies the collections to query over. Every
  /// collection or subcollection with this ID as the last segment of its path
  /// will be included. Cannot contain a slash.
  /// @return The created `CollectionGroup`.
  external CollectionGroup collectionGroup(String collectionId);

  /// Retrieves multiple documents from Firestore.
  ///
  /// The first argument is required and must be of type `DocumentReference`
  /// followed by any additional `DocumentReference` documents. If used, the
  /// optional `ReadOptions` must be the last argument.
  ///
  /// @param {Array.<DocumentReference|ReadOptions>} documentRefsOrReadOptions
  /// The `DocumentReferences` to receive, followed by an optional field
  /// mask.
  /// @return A Promise that resolves with an array of resulting document
  /// snapshots.
  // TODO: Is this possible in dart?
  // getAll(
  //   ...documentRefsOrReadOptions: Array<DocumentReference | ReadOptions>
  // ): Promise<Array<DocumentSnapshot>>;

  /// Recursively deletes all documents and subcollections at and under the
  /// specified level.
  ///
  /// If any delete fails, the promise is rejected with an error message
  /// containing the number of failed deletes and the stack trace of the last
  /// failed delete. The provided reference is deleted regardless of whether
  /// all deletes succeeded.
  ///
  /// `recursiveDelete()` uses a BulkWriter instance with default settings to
  /// perform the deletes. To customize throttling rates or add success/error
  /// callbacks, pass in a custom BulkWriter instance.
  ///
  /// @param ref The reference of a document or collection to delete.
  /// @param bulkWriter A custom BulkWriter instance used to perform the
  /// deletes.
  /// @return A promise that resolves when all deletes have been performed.
  /// The promise is rejected if any of the deletes fail.
  ///
  /// @example
  /// // Recursively delete a reference and log the references of failures.
  /// const bulkWriter = firestore.bulkWriter();
  /// bulkWriter
  ///   .onWriteError((error) => {
  ///     if (
  ///       error.failedAttempts < MAX_RETRY_ATTEMPTS
  ///     ) {
  ///       return true;
  ///     } else {
  ///       console.log('Failed write at document: ', error.documentRef.path);
  ///       return false;
  ///     }
  ///   });
  /// await firestore.recursiveDelete(docRef, bulkWriter);
  external JSPromise recursiveDelete(JSObject ref, [BulkWriter bulkWriter]);

  /// Terminates the Firestore client and closes all open streams.
  ///
  /// @return A Promise that resolves when the client is terminated.
  external JSPromise terminate();

  /// Fetches the root collections that are associated with this Firestore
  /// database.
  ///
  /// @returns A Promise that resolves with an array of CollectionReferences.
  external JSPromise<JSArray<CollectionReference>> listCollections();

  /// Executes the given updateFunction and commits the changes applied within
  /// the transaction.
  ///
  /// You can use the transaction object passed to 'updateFunction' to read and
  /// modify Firestore documents under lock. You have to perform all reads
  /// before you perform any write.
  ///
  /// Transactions can be performed as read-only or read-write transactions. By
  /// default, transactions are executed in read-write mode.
  ///
  /// A read-write transaction obtains a pessimistic lock on all documents that
  /// are read during the transaction. These locks block other transactions,
  /// batched writes, and other non-transactional writes from changing that
  /// document. Any writes in a read-write transactions are committed once
  /// 'updateFunction' resolves, which also releases all locks.
  ///
  /// If a read-write transaction fails with contention, the transaction is
  /// retried up to five times. The `updateFunction` is invoked once for each
  /// attempt.
  ///
  /// Read-only transactions do not lock documents. They can be used to read
  /// documents at a consistent snapshot in time, which may be up to 60 seconds
  /// in the past. Read-only transactions are not retried.
  ///
  /// Transactions time out after 60 seconds if no documents are read.
  /// Transactions that are not committed within than 270 seconds are also
  /// aborted. Any remaining locks are released when a transaction times out.
  ///
  /// @param updateFunction The function to execute within the transaction
  /// context.
  /// @param transactionOptions Transaction options.
  /// @return If the transaction completed successfully or was explicitly
  /// aborted (by the updateFunction returning a failed Promise), the Promise
  /// returned by the updateFunction will be returned here. Else if the
  /// transaction failed, a rejected Promise with the corresponding failure
  /// error will be returned.
  external JSPromise<T> runTransaction<T extends JSAny>(
    JSFunction updateFunction, [
    JSObject transactionOptions,
  ]);

  /// Creates a write batch, used for performing multiple writes as a single
  /// atomic operation.
  external WriteBatch batch();

  /// Creates a [BulkWriter]{@link BulkWriter}, used for performing
  /// multiple writes in parallel. Gradually ramps up writes as specified
  /// by the 500/50/5 rule.
  ///
  /// @see https://firebase.google.com/docs/firestore/best-practices#ramping_up_traffic
  ///
  /// @param options An options object used to configure the throttling
  /// behavior for the underlying BulkWriter.
  external BulkWriter bulkWriter([BulkWriterOptions options]);

  /// Creates a new `BundleBuilder` instance to package selected Firestore data into
  /// a bundle.
  ///
  /// @param bundleId The ID of the bundle. When loaded on clients, client SDKs use this ID
  /// and the timestamp associated with the bundle to tell if it has been loaded already.
  /// If not specified, a random identifier will be used.
  ///
  ///
  /// @example
  /// const bundle = firestore.bundle('data-bundle');
  /// const docSnapshot = await firestore.doc('abc/123').get();
  /// const querySnapshot = await firestore.collection('coll').get();
  ///
  /// const bundleBuffer = bundle.add(docSnapshot); // Add a document
  ///                            .add('coll-query', querySnapshot) // Add a named query.
  ///                            .build()
  /// // Save `bundleBuffer` to CDN or stream it to clients.
  external BundleBuilder bundle([String bundleId]);
}

/// An immutable object representing a geo point in Firestore. The geo point
/// is represented as latitude/longitude pair.
///
/// Latitude values are in the range of [-90, 90].
/// Longitude values are in the range of [-180, 180].
extension type GeoPoint._(JSObject _) implements JSObject {
  /// Creates a new immutable GeoPoint object with the provided latitude and
  /// longitude values.
  /// @param latitude The latitude as number between -90 and 90.
  /// @param longitude The longitude as number between -180 and 180.
  external factory GeoPoint({required num latitude, required num longitude});

  /// latitude
  external num get latitude;

  /// longitude
  external num get longitude;

  /// Returns true if this `GeoPoint` is equal to the provided one.
  ///
  /// @param other The `GeoPoint` to compare against.
  /// @return true if this `GeoPoint` is equal to the provided one.
  external bool isEqual(GeoPoint other);
}

/// A reference to a transaction.
/// The `Transaction` object passed to a transaction's updateFunction provides
/// the methods to read and write data within the transaction context. See
/// `Firestore.runTransaction()`.
extension type Transaction._(JSObject _) implements JSObject {
  /// Retrieves a query result. Holds a pessimistic lock on all returned
  /// documents.
  ///
  /// @param query A query to execute.
  /// @return A QuerySnapshot for the retrieved data.
  external JSPromise<QuerySnapshot> get(Query query);

  /// Reads the document referenced by the provided `DocumentReference.`
  /// Holds a pessimistic lock on the returned document.
  ///
  /// @param documentRef A reference to the document to be read.
  /// @return A DocumentSnapshot for the read data.
  @JS('get')
  external JSPromise<DocumentSnapshot> getDocument(
    DocumentReference documentRef,
  );

  /// Retrieves an aggregate query result. Holds a pessimistic lock on all
  /// documents that were matched by the underlying query.
  ///
  /// @param aggregateQuery An aggregate query to execute.
  /// @return An AggregateQuerySnapshot for the retrieved data.
  @JS('get')
  external JSPromise<AggregateQuerySnapshot> getAggregateQuery(
    AggregateQuery aggregateQuery,
  );

  /// Retrieves multiple documents from Firestore. Holds a pessimistic lock on
  /// all returned documents.
  ///
  /// The first argument is required and must be of type `DocumentReference`
  /// followed by any additional `DocumentReference` documents. If used, the
  /// optional `ReadOptions` must be the last argument.
  ///
  /// @param {Array.<DocumentReference|ReadOptions>} documentRefsOrReadOptions
  /// The `DocumentReferences` to receive, followed by an optional field
  /// mask.
  /// @return A Promise that resolves with an array of resulting document
  /// snapshots.

  // TODO: Is this possible in dart?
  // getAll<AppModelType, DbModelType extends DocumentData>(
  //   ...documentRefsOrReadOptions: Array<
  //     DocumentReference<AppModelType, DbModelType> | ReadOptions
  //   >
  // ): Promise<Array<DocumentSnapshot<AppModelType, DbModelType>>>;

  /// Create the document referred to by the provided `DocumentReference`.
  /// The operation will fail the transaction if a document exists at the
  /// specified location.
  ///
  /// @param documentRef A reference to the document to be create.
  /// @param data The object data to serialize as the document.
  /// @throws Error If the provided input is not a valid Firestore document.
  /// @return This `Transaction` instance. Used for chaining method calls.
  external Transaction create(DocumentReference documentRef, JSObject data);

  /// Writes to the document referred to by the provided `DocumentReference`.
  /// If the document does not exist yet, it will be created. If you pass
  /// `SetOptions`, the provided data can be merged into the existing document.
  ///
  /// @param documentRef A reference to the document to be set.
  /// @param data An object of the fields and values for the document.
  /// @param options An object to configure the set behavior.
  /// @param  options.merge - If true, set() merges the values specified in its
  /// data argument. Fields omitted from this set() call remain untouched. If
  /// your input sets any field to an empty map, all nested fields are
  /// overwritten.
  /// @param options.mergeFields - If provided, set() only replaces the
  /// specified field paths. Any field path that is not specified is ignored
  /// and remains untouched. If your input sets any field to an empty map, all
  /// nested fields are overwritten.
  /// @throws Error If the provided input is not a valid Firestore document.
  /// @return This `Transaction` instance. Used for chaining method calls.
  external Transaction set(
    DocumentReference documentRef,
    JSObject data, [
    SetOptions options,
  ]);

  /// Updates fields in the document referred to by the provided
  /// `DocumentReference`. The update will fail if applied to a document that
  /// does not exist.
  ///
  /// Nested fields can be updated by providing dot-separated field path
  /// strings.
  ///
  /// @param documentRef A reference to the document to be updated.
  /// @param data An object containing the fields and values with which to
  /// update the document.
  /// @param precondition A Precondition to enforce on this update.
  /// @throws Error If the provided input is not valid Firestore data.
  /// @return This `Transaction` instance. Used for chaining method calls.
  external Transaction update(
    DocumentReference documentRef,
    JSObject data, [
    Precondition precondition,
  ]);

  /// Updates fields in the document referred to by the provided
  /// `DocumentReference`. The update will fail if applied to a document that
  /// does not exist.
  ///
  /// Nested fields can be updated by providing dot-separated field path
  /// strings or by providing FieldPath objects.
  ///
  /// A `Precondition` restricting this update can be specified as the last
  /// argument.
  ///
  /// @param documentRef A reference to the document to be updated.
  /// @param field The first field to update.
  /// @param value The first value
  /// @param fieldsOrPrecondition An alternating list of field paths and values
  /// to update, optionally followed by a `Precondition` to enforce on this
  /// update.
  /// @throws Error If the provided input is not valid Firestore data.
  /// @return This `Transaction` instance. Used for chaining method calls.
  @JS('update')
  external Transaction updateFieldPath(
    DocumentReference documentRef,
    JSAny field,
    JSObject value, [
    JSArray<JSAny> precondition,
  ]);

  /// Deletes the document referred to by the provided `DocumentReference`.
  ///
  /// @param documentRef A reference to the document to be deleted.
  /// @param precondition A Precondition to enforce for this delete.
  /// @return This `Transaction` instance. Used for chaining method calls.
  external Transaction delete(
    DocumentReference documentRef, [
    Precondition precondition,
  ]);
}

/// A Firestore BulkWriter than can be used to perform a large number of writes
/// in parallel. Writes to the same document will be executed sequentially.
///
/// @class
extension type BulkWriter._(JSObject _) implements JSObject {
  /// Create a document with the provided data. This single operation will fail
  /// if a document exists at its location.
  ///
  /// @param documentRef A reference to the document to be
  /// created.
  /// @param data The object to serialize as the document.
  /// @throws Error If the provided input is not a valid Firestore document.
  /// @returns A promise that resolves with the result of the write. If the
  /// write fails, the promise is rejected with a
  /// [BulkWriterError]{@link BulkWriterError}.
  external JSPromise<WriteResult> create(
    DocumentReference documentRef,
    JSObject data,
  );

  /// Delete a document from the database.
  ///
  /// @param documentRef A reference to the document to be
  /// deleted.
  /// @param precondition A precondition to enforce for this
  /// delete.
  /// @param precondition.lastUpdateTime If set, enforces that the
  /// document was last updated at lastUpdateTime. Fails the batch if the
  /// document doesn't exist or was last updated at a different time.
  /// @param precondition.exists If set, enforces that the target document
  /// must or must not exist.
  /// @returns A promise that resolves with the result of the delete. If the
  /// delete fails, the promise is rejected with a
  /// [BulkWriterError]{@link BulkWriterError}.
  external JSPromise<WriteResult> delete(
    DocumentReference documentRef, [
    Precondition precondition,
  ]);

  /// Write to the document referred to by the provided
  /// [DocumentReference]{@link DocumentReference}. If the document does not
  /// exist yet, it will be created. If you pass
  /// [SetOptions]{@link SetOptions}., the provided data can be merged into the
  /// existing document.
  ///
  /// @param  documentRef A reference to the document to be
  /// set.
  /// @param data The object to serialize as the document.
  /// @param options An object to configure the set behavior.
  /// @param  options.merge - If true, set() merges the values specified in its
  /// data argument. Fields omitted from this set() call remain untouched. If
  /// your input sets any field to an empty map, all nested fields are
  /// overwritten.
  /// @param options.mergeFields - If provided, set() only replaces the
  /// specified field paths. Any field path that is not specified is ignored
  /// and remains untouched. If your input sets any field to an empty map, all
  /// nested fields are overwritten.
  /// @throws Error If the provided input is not a valid Firestore document.
  /// @returns A promise that resolves with the result of the write. If the
  /// write fails, the promise is rejected with a
  /// [BulkWriterError]{@link BulkWriterError}.
  external JSPromise<WriteResult> set(
    DocumentReference documentRef,
    JSObject data, [
    SetOptions options,
  ]);

  /// Update fields of the document referred to by the provided
  /// [DocumentReference]{@link DocumentReference}. If the document doesn't yet
  /// exist, the update fails and the entire batch will be rejected.
  ///
  /// The update() method accepts either an object with field paths encoded as
  /// keys and field values encoded as values, or a variable number of
  /// arguments that alternate between field paths and field values. Nested
  /// fields can be updated by providing dot-separated field path strings or by
  /// providing FieldPath objects.
  ///
  ///
  /// A Precondition restricting this update can be specified as the last
  /// argument.
  ///
  /// @param documentRef A reference to the document to be updated.
  /// @param data An object containing the fields and values with which to
  /// update the document.
  /// @param precondition A Precondition to enforce on this update.
  /// @throws Error If the provided input is not valid Firestore data.
  /// @returns A promise that resolves with the result of the write. If the
  /// write fails, the promise is rejected with a
  /// [BulkWriterError]{@link BulkWriterError}.
  external JSPromise<WriteResult> update(
    DocumentReference documentRef,
    JSObject data, [
    Precondition precondition,
  ]);

  /// Update fields of the document referred to by the provided
  /// [DocumentReference]{@link DocumentReference}. If the document doesn't yet
  /// exist, the update fails and the entire batch will be rejected.
  ///
  /// The update() method accepts either an object with field paths encoded as
  /// keys and field values encoded as values, or a variable number of
  /// arguments that alternate between field paths and field values. Nested
  /// fields can be updated by providing dot-separated field path strings or by
  /// providing FieldPath objects.
  ///
  ///
  /// A Precondition restricting this update can be specified as the last
  /// argument.
  ///
  /// @param documentRef A reference to the document to be updated.
  /// @param field The first field to update.
  /// @param value The first value
  /// @param fieldsOrPrecondition An alternating list of field paths and values
  /// to update, optionally followed a `Precondition` to enforce on this
  /// update.
  /// @throws Error If the provided input is not valid Firestore data;
  /// @returns A promise that resolves with the result of the write. If the
  /// write fails, the promise is rejected with a
  /// [BulkWriterError]{@link BulkWriterError}.
  @JS('update')
  external JSPromise<WriteResult> updateFieldPath(
    DocumentReference documentRef,
    JSAny field,
    JSObject value, [
    JSArray<JSAny> precondition,
  ]);

  /// Attaches a listener that is run every time a BulkWriter operation
  /// successfully completes.
  ///
  /// @param callback A callback to be called every time a BulkWriter operation
  /// successfully completes.
  external void onWriteResult(JSFunction callback);

  /// Attaches an error handler listener that is run every time a BulkWriter
  /// operation fails.
  ///
  /// BulkWriter has a default error handler that retries UNAVAILABLE and
  /// ABORTED errors up to a maximum of 10 failed attempts. When an error
  /// handler is specified, the default error handler will be overwritten.
  ///
  /// @param shouldRetryCallback A callback to be called every time a BulkWriter
  /// operation fails. Returning `true` will retry the operation. Returning
  /// `false` will stop the retry loop.
  external void onWriteError(JSFunction shouldRetryCallback);

  /// Commits all writes that have been enqueued up to this point in parallel.
  ///
  /// Returns a Promise that resolves when all currently queued operations have
  /// been committed. The Promise will never be rejected since the results for
  /// each individual operation are conveyed via their individual Promises.
  ///
  /// The Promise resolves immediately if there are no pending writes.
  /// Otherwise, the Promise waits for all previously issued writes, but it
  /// does not wait for writes that were added after the method is called. If
  /// you want to wait for additional writes, call `flush()` again.
  ///
  /// @return A promise that resolves when all enqueued writes
  /// up to this point have been committed.
  external JSPromise flush();

  /// Commits all enqueued writes and marks the BulkWriter instance as closed.
  ///
  /// After calling `close()`, calling any method will throw an error. Any
  /// retries scheduled as part of an `onWriteError()` handler will be run
  /// before the `close()` promise resolves.
  ///
  /// Returns a Promise that resolves when all writes have been committed. The
  /// Promise will never be rejected. Calling this method will send all
  /// requests. The promise resolves immediately if there are no pending
  /// writes.
  ///
  /// @return A promise that resolves when all enqueued writes
  /// up to this point have been committed.
  external JSPromise close();
}

/// An options object to configure throttling on BulkWriter.
extension type BulkWriterOptions._(JSObject _) implements JSObject {
  /// Whether to disable or configure throttling. By default, throttling is
  /// enabled. This field can be set to either a boolean or a config
  /// object. Setting it to `true` will use default values. You can override
  /// the defaults by setting it to `false` to disable throttling, or by
  /// setting the config values to enable throttling with the provided values.
  ///
  /// @see https://firebase.google.com/docs/firestore/best-practices#ramping_up_traffic
  ///
  /// @param initialOpsPerSecond The initial maximum number of operations per
  /// second allowed by the throttler. If this field is not set, the default
  /// is 500 operations per second.
  /// @param maxOpsPerSecond The maximum number of operations per second
  /// allowed by the throttler. If this field is set, the throttler's allowed
  /// operations per second does not ramp up past the specified operations per
  /// second.
  external JSAny get throttling;

  /// Constructor
  external factory BulkWriterOptions({JSAny throttling});
}

/// The error thrown when a BulkWriter operation fails.
extension type BulkWriterError._(JSObject _) implements Error {
  /// The status code of the error.
  ///
  /// See [GrpcStatus]
  external int code;

  /// The error message of the error.
  external String get message;

  /// The document reference the operation was performed on.
  external DocumentReference get documentRef;

  /// The type of operation performed.
  external String get operationType;

  /// How many times this operation has been attempted unsuccessfully.
  external int get failedAttempts;
}

/// A write batch, used to perform multiple writes as a single atomic unit.
///
/// A `WriteBatch` object can be acquired by calling `Firestore.batch()`. It
/// provides methods for adding writes to the write batch. None of the
/// writes will be committed (or visible locally) until `WriteBatch.commit()`
/// is called.
///
/// Unlike transactions, write batches are persisted offline and therefore are
/// preferable when you don't need to condition your writes on read data.
extension type WriteBatch._(JSObject _) implements JSObject {
  /// Create the document referred to by the provided `DocumentReference`. The
  /// operation will fail the batch if a document exists at the specified
  /// location.
  ///
  /// @param documentRef A reference to the document to be created.
  /// @param data The object data to serialize as the document.
  /// @throws Error If the provided input is not a valid Firestore document.
  /// @return This `WriteBatch` instance. Used for chaining method calls.
  external WriteBatch create(DocumentReference documentRef, JSObject data);

  /// Write to the document referred to by the provided `DocumentReference`.
  /// If the document does not exist yet, it will be created. If you pass
  /// `SetOptions`, the provided data can be merged into the existing document.
  ///
  /// @param documentRef A reference to the document to be set.
  /// @param data An object of the fields and values for the document.
  /// @param options An object to configure the set behavior.
  /// @param  options.merge - If true, set() merges the values specified in its
  /// data argument. Fields omitted from this set() call remain untouched. If
  /// your input sets any field to an empty map, all nested fields are
  /// overwritten.
  /// @param options.mergeFields - If provided, set() only replaces the
  /// specified field paths. Any field path that is not specified is ignored
  /// and remains untouched. If your input sets any field to an empty map, all
  /// nested fields are overwritten.
  /// @throws Error If the provided input is not a valid Firestore document.
  /// @return This `WriteBatch` instance. Used for chaining method calls.
  external WriteBatch set(
    DocumentReference documentRef,
    JSObject data, [
    SetOptions options,
  ]);

  /// Update fields of the document referred to by the provided
  /// `DocumentReference`. If the document doesn't yet exist, the update fails
  /// and the entire batch will be rejected.
  ///
  /// Nested fields can be updated by providing dot-separated field path
  /// strings.
  ///
  /// @param documentRef A reference to the document to be updated.
  /// @param data An object containing the fields and values with which to
  /// update the document.
  /// @param precondition A Precondition to enforce on this update.
  /// @throws Error If the provided input is not valid Firestore data.
  /// @return This `WriteBatch` instance. Used for chaining method calls.
  external WriteBatch update(
    DocumentReference documentRef,
    JSObject data, [
    Precondition precondition,
  ]);

  /// Updates fields in the document referred to by the provided
  /// `DocumentReference`. The update will fail if applied to a document that
  /// does not exist.
  ///
  /// Nested fields can be updated by providing dot-separated field path
  /// strings or by providing FieldPath objects.
  ///
  /// A `Precondition` restricting this update can be specified as the last
  /// argument.
  ///
  /// @param documentRef A reference to the document to be updated.
  /// @param field The first field to update.
  /// @param value The first value
  /// @param fieldsOrPrecondition An alternating list of field paths and values
  /// to update, optionally followed a `Precondition` to enforce on this
  /// update.
  /// @throws Error If the provided input is not valid Firestore data.
  /// @return This `WriteBatch` instance. Used for chaining method calls.
  @JS('update')
  external WriteBatch updateFieldPath(
    DocumentReference documentRef,
    JSAny field,
    JSObject value, [
    JSArray<JSAny> precondition,
  ]);

  /// Deletes the document referred to by the provided `DocumentReference`.
  ///
  /// @param documentRef A reference to the document to be deleted.
  /// @param precondition A Precondition to enforce for this delete.
  /// @return This `WriteBatch` instance. Used for chaining method calls.
  external WriteBatch delete(
    DocumentReference documentRef, [
    Precondition precondition,
  ]);

  /// Commits all of the writes in this write batch as a single atomic unit.
  ///
  /// @return A Promise resolved once all of the writes in the batch have been
  /// successfully written to the backend as an atomic unit.
  external JSPromise<JSArray<WriteResult>> commit();
}

/// An options object that configures conditional behavior of `update()` and
/// `delete()` calls in `DocumentReference`, `WriteBatch`, and `Transaction`.
/// Using Preconditions, these calls can be restricted to only apply to
/// documents that match the specified restrictions.
extension type Precondition._(JSObject _) implements JSObject {
  /// If set, the last update time to enforce.
  external Timestamp? get lastUpdateTime;

  /// If set, enforces that the target document must or must not exist.
  external bool? get exists;
}

/// An options object that configures the behavior of `set()` calls in
/// `DocumentReference`, `WriteBatch` and `Transaction`. These calls can be
/// configured to perform granular merges instead of overwriting the target
/// documents in their entirety.
///
/// @param merge Changes the behavior of a set() call to only replace the
/// values specified in its data argument. Fields omitted from the set() call
/// remain untouched. If your input sets any field to an empty map, all nested
/// fields are overwritten.
///
/// @param mergeFields Changes the behavior of set() calls to only replace
/// the specified field paths. Any field path that is not specified is ignored
/// and remains untouched. If your input sets any field to an empty map, all
/// nested fields are overwritten.
extension type SortOptions._(JSObject _) implements JSObject {
  /// merge
  external bool? get merge;

  /// merge fields
  external JSArray<JSAny>? get mergeFields;

  /// Constructor
  external factory SortOptions({bool? merge, JSArray<JSAny>? mergeFields});
}

/// An options object that configures the behavior of `set()` calls in
/// `DocumentReference`, `WriteBatch` and `Transaction`. These calls can be
/// configured to perform granular merges instead of overwriting the target
/// documents in their entirety.
///
/// @param merge Changes the behavior of a set() call to only replace the
/// values specified in its data argument. Fields omitted from the set() call
/// remain untouched. If your input sets any field to an empty map, all nested
/// fields are overwritten.
///
/// @param mergeFields Changes the behavior of set() calls to only replace
/// the specified field paths. Any field path that is not specified is ignored
/// and remains untouched. If your input sets any field to an empty map, all
/// nested fields are overwritten.
extension type SetOptions._(JSObject _) implements JSObject {
  /// merge
  external bool? get merge;

  /// merge fields
  external JSArray<JSAny>? get mergeFields;

  /// Constructor
  external SetOptions({bool? merge, JSArray<JSAny>? mergeFields});
}

/// An options object that can be used to configure the behavior of `getAll()`
/// calls. By providing a `fieldMask`, these calls can be configured to only
/// return a subset of fields.
extension type ReadOptions._(JSObject _) implements JSObject {
  /// Specifies the set of fields to return and reduces the amount of data
  /// transmitted by the backend.
  ///
  /// Adding a field mask does not filter results. Documents do not need to
  /// contain values for all the fields in the mask to be part of the result
  /// set.
  external JSArray<JSAny>? get fieldMask;

  /// Constructor
  external factory ReadOptions(JSArray<JSAny> fieldMask);
}

/// A WriteResult wraps the write time set by the Firestore servers on `sets()`,
/// `updates()`, and `creates()`.
extension type WriteResult._(JSObject _) implements JSObject {
  /// The write time as set by the Firestore servers.
  external Timestamp get writeTime;

  /// Returns true if this `WriteResult` is equal to the provided one.
  ///
  /// @param other The `WriteResult` to compare against.
  /// @return true if this `WriteResult` is equal to the provided one.
  external bool isEqual(WriteResult other);
}

/// A `DocumentReference` refers to a document location in a Firestore database
/// and can be used to write, read, or listen to the location. The document at
/// the referenced location may or may not exist. A `DocumentReference` can
/// also be used to create a `CollectionReference` to a subcollection.
extension type DocumentReference._(JSObject _) implements JSObject {
  /// The identifier of the document within its collection.
  external String get id;

  /// The `Firestore` for the Firestore database (useful for performing
  /// transactions, etc.).
  external Firestore get firestore;

  /// A reference to the Collection to which this DocumentReference belongs.
  external CollectionReference get parent;

  /// A string representing the path of the referenced document (relative
  /// to the root of the database).
  external String get path;

  /// Gets a `CollectionReference` instance that refers to the collection at
  /// the specified path.
  ///
  /// @param collectionPath A slash-separated path to a collection.
  /// @return The `CollectionReference` instance.
  external CollectionReference collection(String collectionPath);

  /// Fetches the subcollections that are direct children of this document.
  ///
  /// @returns A Promise that resolves with an array of CollectionReferences.
  external JSPromise<JSArray<CollectionReference>> listCollections();

  /// Creates a document referred to by this `DocumentReference` with the
  /// provided object values. The write fails if the document already exists
  ///
  /// @param data The object data to serialize as the document.
  /// @throws {Error} If the provided input is not a valid Firestore document or if the document already exists.
  /// @return A Promise resolved with the write time of this create.
  external JSPromise<WriteResult> create(JSObject data);

  /// Writes to the document referred to by this `DocumentReference`. If the
  /// document does not yet exist, it will be created. If you pass
  /// `SetOptions`, the provided data can be merged into an existing document.
  ///
  /// @param data A map of the fields and values for the document.
  /// @param options An object to configure the set behavior.
  /// @param  options.merge - If true, set() merges the values specified in its
  /// data argument. Fields omitted from this set() call remain untouched. If
  /// your input sets any field to an empty map, all nested fields are
  /// overwritten.
  /// @param options.mergeFields - If provided, set() only replaces the
  /// specified field paths. Any field path that is not specified is ignored
  /// and remains untouched. If your input sets any field to an empty map, all
  /// nested fields are overwritten.
  /// @throws Error If the provided input is not a valid Firestore document.
  /// @return A Promise resolved with the write time of this set.
  external JSPromise<WriteResult> set(
    JSObject data, [
    SetOptions options,
  ]);

  /// Updates fields in the document referred to by this `DocumentReference`.
  /// The update will fail if applied to a document that does not exist.
  ///
  /// Nested fields can be updated by providing dot-separated field path
  /// strings.
  ///
  /// @param data An object containing the fields and values with which to
  /// update the document.
  /// @param precondition A Precondition to enforce on this update.
  /// @throws Error If the provided input is not valid Firestore data.
  /// @return A Promise resolved with the write time of this update.
  external JSPromise<WriteResult> update(
    JSObject data, [
    Precondition precondition,
  ]);

  /// Updates fields in the document referred to by this `DocumentReference`.
  /// The update will fail if applied to a document that does not exist.
  ///
  /// Nested fields can be updated by providing dot-separated field path
  /// strings or by providing FieldPath objects.
  ///
  /// A `Precondition` restricting this update can be specified as the last
  /// argument.
  ///
  /// @param field The first field to update.
  /// @param value The first value.
  /// @param moreFieldsOrPrecondition An alternating list of field paths and
  /// values to update, optionally followed by a `Precondition` to enforce on
  /// this update.
  /// @throws Error If the provided input is not valid Firestore data.
  /// @return A Promise resolved with the write time of this update.
  @JS('update')
  external JSPromise<WriteResult> updateFieldPath(
    JSAny field,
    JSObject value, [
    JSArray<JSAny> precondition,
  ]);

  /// Deletes the document referred to by this `DocumentReference`.
  ///
  /// @param precondition A Precondition to enforce for this delete.
  /// @return A Promise resolved with the write time of this delete.
  external JSPromise<WriteResult> delete([
    Precondition precondition,
  ]);

  /// Reads the document referred to by this `DocumentReference`.
  ///
  /// @return A Promise resolved with a DocumentSnapshot containing the
  /// current document contents.
  external JSPromise<DocumentSnapshot> get();

  /// Attaches a listener for DocumentSnapshot events.
  ///
  /// @param onNext A callback to be called every time a new `DocumentSnapshot`
  /// is available.
  /// @param onError A callback to be called if the listen fails or is
  /// cancelled. No further callbacks will occur.
  /// @return An unsubscribe function that can be called to cancel
  /// the snapshot listener.
  external void onSnapshot(
    JSFunction onNext, [
    JSFunction onError,
  ]);

  /// Returns true if this `DocumentReference` is equal to the provided one.
  ///
  /// @param other The `DocumentReference` to compare against.
  /// @return true if this `DocumentReference` is equal to the provided one.
  external bool isEqual(DocumentReference other);

  /// Applies a custom data converter to this DocumentReference, allowing you
  /// to use your own custom model objects with Firestore. When you call
  /// set(), get(), etc. on the returned DocumentReference instance, the
  /// provided converter will convert between Firestore data of type
  /// `NewDbModelType` and your custom type `NewAppModelType`.
  ///
  /// @param converter Converts objects to and from Firestore. Passing in
  /// `null` removes the current converter.
  /// @return A DocumentReference<U> that uses the provided converter.
  external DocumentReference withConverter(FirestoreDataConverter? converter);
}

/// A `DocumentSnapshot` contains data read from a document in your Firestore
/// database. The data can be extracted with `.data()` or `.get(<field>)` to
/// get a specific field.
///
/// For a `DocumentSnapshot` that points to a non-existing document, any data
/// access will return 'undefined'. You can use the `exists` property to
/// explicitly verify a document's existence.
extension type DocumentSnapshot._(JSObject _) implements JSObject {
  /// True if the document exists.
  external bool get exists;

  /// A `DocumentReference` to the document location.
  external DocumentReference get ref;

  /// The ID of the document for which this `DocumentSnapshot` contains data.
  external String get id;

  /// The time the document was created. Not set for documents that don't
  /// exist.
  external Timestamp? get createTime;

  /// The time the document was last updated (at the time the snapshot was
  /// generated). Not set for documents that don't exist.
  external Timestamp? get updateTime;

  /// The time this snapshot was read.
  external Timestamp get readTime;

  /// Retrieves all fields in the document as an Object. Returns 'undefined' if
  /// the document doesn't exist.
  ///
  /// @return An Object containing all fields in the document.
  external JSObject data();

  /// Retrieves the field specified by `fieldPath`.
  ///
  /// @param fieldPath The path (e.g. 'foo' or 'foo.bar') to a specific field.
  /// @return The data at the specified field location or undefined if no such
  /// field exists in the document.
  external JSObject get(JSAny fieldPath);

  /// Returns true if the document's data and path in this `DocumentSnapshot`
  /// is equal to the provided one.
  ///
  /// @param other The `DocumentSnapshot` to compare against.
  /// @return true if this `DocumentSnapshot` is equal to the provided one.
  external bool isEqual(DocumentSnapshot other);
}

/// A `QueryDocumentSnapshot` contains data read from a document in your
/// Firestore database as part of a query. The document is guaranteed to exist
/// and its data can be extracted with `.data()` or `.get(<field>)` to get a
/// specific field.
///
/// A `QueryDocumentSnapshot` offers the same API surface as a
/// `DocumentSnapshot`. Since query results contain only existing documents, the
/// `exists` property will always be true and `data()` will never return
/// 'undefined'.
extension type QueryDocumentSnapshot._(JSObject _) implements DocumentSnapshot {
  /// The time the document was created.
  external Timestamp get createTime;

  /// The time the document was last updated (at the time the snapshot was
  /// generated).
  external Timestamp get updateTime;

  /// Retrieves all fields in the document as an Object.
  ///
  /// @override
  /// @return An Object containing all fields in the document.
  external JSObject data();
}

/// A `Query` refers to a Query which you can read or listen to. You can also
/// construct refined `Query` objects by adding filters and ordering.
extension type Query._(JSObject _) implements JSObject {
  /// The `Firestore` for the Firestore database (useful for performing
  /// transactions, etc.).
  external Firestore get firestore;

  /// Creates and returns a new Query with the additional filter that documents
  /// must contain the specified field and that its value should satisfy the
  /// relation constraint provided.
  ///
  /// This function returns a new (immutable) instance of the Query (rather
  /// than modify the existing instance) to impose the filter.
  ///
  /// @param fieldPath The path to compare
  /// @param opStr The operation string (e.g "<", "<=", "==", ">", ">=").
  /// @param value The value for comparison
  /// @return The created Query.
  @JS('where')
  external Query whereFieldPath(JSAny fieldPath, String opStr, JSAny value);

  /// Creates and returns a new [Query]{@link Query} with the additional filter
  /// that documents should satisfy the relation constraint provided. Documents
  /// must contain the field specified in the filter.
  ///
  /// This function returns a new (immutable) instance of the Query (rather than
  /// modify the existing instance) to impose the filter.
  ///
  /// @param {Filter} filter A filter to apply to the Query.
  /// @returns {Query} The created Query.
  external Query where(Filter filter);

  /// Creates and returns a new Query that's additionally sorted by the
  /// specified field, optionally in descending order instead of ascending.
  ///
  /// This function returns a new (immutable) instance of the Query (rather
  /// than modify the existing instance) to impose the order.
  ///
  /// @param fieldPath The field to sort by.
  /// @param directionStr Optional direction to sort by ('asc' or 'desc'). If
  /// not specified, order will be ascending.
  /// @return The created Query.
  external Query orderBy(
    JSAny fieldPath, [
    String directionStr,
  ]);

  /// Creates and returns a new Query that only returns the first matching
  /// documents.
  ///
  /// This function returns a new (immutable) instance of the Query (rather
  /// than modify the existing instance) to impose the limit.
  ///
  /// @param limit The maximum number of items to return.
  /// @return The created Query.
  external Query limit(int limit);

  /// Creates and returns a new Query that only returns the last matching
  /// documents.
  ///
  /// You must specify at least one orderBy clause for limitToLast queries,
  /// otherwise an exception will be thrown during execution.
  ///
  /// Results for limitToLast queries cannot be streamed via the `stream()`
  /// API.
  ///
  /// @param limit The maximum number of items to return.
  /// @return The created Query.
  external Query limitToLast(int limit);

  /// Specifies the offset of the returned results.
  ///
  /// This function returns a new (immutable) instance of the Query (rather
  /// than modify the existing instance) to impose the offset.
  ///
  /// @param offset The offset to apply to the Query results.
  /// @return The created Query.
  external Query offset(int offset);

  /// Creates and returns a new Query instance that applies a field mask to
  /// the result and returns only the specified subset of fields. You can
  /// specify a list of field paths to return, or use an empty list to only
  /// return the references of matching documents.
  ///
  /// Queries that contain field masks cannot be listened to via `onSnapshot()`
  /// listeners.
  ///
  /// This function returns a new (immutable) instance of the Query (rather
  /// than modify the existing instance) to impose the field mask.
  ///
  /// @param field The field paths to return.
  /// @return The created Query.

  // TODO: Is this possible in dart?
  // select(...field: (string | FieldPath)[]): Query;

  /// Creates and returns a new Query that starts at the provided document
  /// (inclusive). The starting position is relative to the order of the query.
  /// The document must contain all of the fields provided in the orderBy of
  /// this query.
  ///
  /// @param snapshot The snapshot of the document to start after.
  /// @return The created Query.
  external Query startAt(DocumentSnapshot snapshot);

  /// Creates and returns a new Query that starts at the provided fields
  /// relative to the order of the query. The order of the field values
  /// must match the order of the order by clauses of the query.
  ///
  /// @param fieldValues The field values to start this query at, in order
  /// of the query's order by.
  /// @return The created Query.

  // TODO: Is this possible in dart?
  // startAt(...fieldValues: any[]): Query<AppModelType, DbModelType>;

  /// Creates and returns a new Query that starts after the provided document
  /// (exclusive). The starting position is relative to the order of the query.
  /// The document must contain all of the fields provided in the orderBy of
  /// this query.
  ///
  /// @param snapshot The snapshot of the document to start after.
  /// @return The created Query.
  external Query startAfter(DocumentSnapshot snapshot);

  /// Creates and returns a new Query that starts after the provided fields
  /// relative to the order of the query. The order of the field values
  /// must match the order of the order by clauses of the query.
  ///
  /// @param fieldValues The field values to start this query after, in order
  /// of the query's order by.
  /// @return The created Query.

  // TODO: Is this possible in dart?
  // startAfter(...fieldValues: any[]): Query<AppModelType, DbModelType>;

  /// Creates and returns a new Query that ends before the provided document
  /// (exclusive). The end position is relative to the order of the query. The
  /// document must contain all of the fields provided in the orderBy of this
  /// query.
  ///
  /// @param snapshot The snapshot of the document to end before.
  /// @return The created Query.
  external Query endBefore(DocumentSnapshot snapshot);

  /// Creates and returns a new Query that ends before the provided fields
  /// relative to the order of the query. The order of the field values
  /// must match the order of the order by clauses of the query.
  ///
  /// @param fieldValues The field values to end this query before, in order
  /// of the query's order by.
  /// @return The created Query.

  // TODO: Is this possible in dart?
  // endBefore(...fieldValues: any[]): Query<AppModelType, DbModelType>;

  /// Creates and returns a new Query that ends at the provided document
  /// (inclusive). The end position is relative to the order of the query. The
  /// document must contain all of the fields provided in the orderBy of this
  /// query.
  ///
  /// @param snapshot The snapshot of the document to end at.
  /// @return The created Query.
  external Query endAt(DocumentSnapshot snapshot);

  /// Creates and returns a new Query that ends at the provided fields
  /// relative to the order of the query. The order of the field values
  /// must match the order of the order by clauses of the query.
  ///
  /// @param fieldValues The field values to end this query at, in order
  /// of the query's order by.
  /// @return The created Query.

  // TODO: Is this possible in dart?
  // endAt(...fieldValues: any[]): Query<AppModelType, DbModelType>;

  /// Executes the query and returns the results as a `QuerySnapshot`.
  ///
  /// @return A Promise that will be resolved with the results of the Query.
  external JSPromise<QuerySnapshot> get();

  /// Plans and optionally executes this query. Returns a Promise that will be
  /// resolved with the planner information, statistics from the query execution (if any),
  /// and the query results (if any).
  ///
  /// @return A Promise that will be resolved with the planner information, statistics
  ///  from the query execution (if any), and the query results (if any).
  external JSPromise<ExplainResults<QuerySnapshot>> explain(
    ExplainOptions options,
  );

  /// Executes the query and returns the results as Node Stream.
  ///
  /// @return A stream of QueryDocumentSnapshot.

  // TODO: Is this possible in dart?
  // stream(): NodeJS.ReadableStream;

  /// Plans and optionally executes this query, and streams the results as Node Stream
  /// of `{document?: DocumentSnapshot, metrics?: ExplainMetrics}` objects.
  ///
  /// The stream surfaces documents one at a time as they are received from the
  /// server, and at the end, it will surface the metrics associated with
  /// executing the query (if any).
  ///
  /// @example
  /// ```
  /// let query = firestore.collection('col').where('foo', '==', 'bar');
  /// let count = 0;
  ///
  /// query.explainStream({analyze: true}).on('data', (data) => {
  ///   if (data.document) {
  ///     // Use data.document which is a DocumentSnapshot instance.
  ///     console.log(`Found document with name '${data.document.id}'`);
  ///     ++count;
  ///   }
  ///   if (data.metrics) {
  ///     // Use data.metrics which is an ExplainMetrics instance.
  ///   }
  /// }).on('end', () => {
  ///   console.log(`Received ${count} documents.`);
  /// });
  /// ```
  ///
  /// @return A stream of `{document?: DocumentSnapshot, metrics?: ExplainMetrics}`
  /// objects.

  // TODO: Is this possible in dart?
  // explainStream(options?: ExplainOptions): NodeJS.ReadableStream;

  /// Attaches a listener for `QuerySnapshot `events.
  ///
  /// @param onNext A callback to be called every time a new `QuerySnapshot`
  /// is available.
  /// @param onError A callback to be called if the listen fails or is
  /// cancelled. No further callbacks will occur.
  /// @return An unsubscribe function that can be called to cancel
  /// the snapshot listener.
  external void onSnapshot(
    JSFunction onNext, [
    JSFunction onError,
  ]);

  /// Returns a query that counts the documents in the result set of this
  /// query.
  ///
  /// The returned query, when executed, counts the documents in the result set
  /// of this query without actually downloading the documents.
  ///
  /// Using the returned query to count the documents is efficient because only
  /// the final count, not the documents' data, is downloaded. The returned
  /// query can count the documents in cases where the result set is
  /// prohibitively large to download entirely (thousands of documents).
  ///
  /// @return a query that counts the documents in the result set of this
  /// query. The count can be retrieved from `snapshot.data().count`, where
  /// `snapshot` is the `AggregateQuerySnapshot` resulting from running the
  /// returned query.
  external AggregateQuery count();

  /// Returns a query that can perform the given aggregations.
  ///
  /// The returned query, when executed, calculates the specified aggregations
  /// over the documents in the result set of this query without actually
  /// downloading the documents.
  ///
  /// Using the returned query to perform aggregations is efficient because only
  /// the final aggregation values, not the documents' data, is downloaded. The
  /// returned query can perform aggregations of the documents in cases where
  /// the result set is prohibitively large to download entirely (thousands of
  /// documents).
  ///
  /// @param aggregateSpec An `AggregateSpec` object that specifies the aggregates
  /// to perform over the result set. The AggregateSpec specifies aliases for each
  /// aggregate, which can be used to retrieve the aggregate result.
  /// @example
  /// ```typescript
  /// const aggregateQuery = col.aggregate(query, {
  ///   countOfDocs: count(),
  ///   totalHours: sum('hours'),
  ///   averageScore: average('score')
  /// });
  ///
  /// const aggregateSnapshot = await aggregateQuery.get();
  /// const countOfDocs: number = aggregateSnapshot.data().countOfDocs;
  /// const totalHours: number = aggregateSnapshot.data().totalHours;
  /// const averageScore: number | null = aggregateSnapshot.data().averageScore;
  /// ```
  external AggregateQuery aggregate(JSObject aggregateSpec);

  /// Returns a query that can perform vector distance (similarity) search with given parameters.
  ///
  /// The returned query, when executed, performs a distance (similarity) search on the specified
  /// `vectorField` against the given `queryVector` and returns the top documents that are closest
  /// to the `queryVector`.
  ///
  /// Only documents whose `vectorField` field is a `VectorValue` of the same dimension as `queryVector`
  /// participate in the query, all other documents are ignored.
  ///
  /// @example
  /// ```typescript
  /// // Returns the closest 10 documents whose Euclidean distance from their 'embedding' fields are closed to [41, 42].
  /// const vectorQuery = col.findNearest('embedding', [41, 42], {limit: 10, distanceMeasure: 'EUCLIDEAN'});
  ///
  /// const querySnapshot = await aggregateQuery.get();
  /// querySnapshot.forEach(...);
  /// ```
  ///
  /// @param vectorField The field path this vector query executes on.
  /// @param queryVector The vector value used to measure the distance from `vectorField` values in the documents.
  /// @param options Options control the vector query. `limit` specifies the upper bound of documents to return, must
  /// be a positive integer with a maximum value of 1000. `distanceMeasure` specifies what type of distance is
  /// calculated when performing the query.
  external VectorQuery findNearest(
    JSAny vectorField,
    JSObject queryVector,
    JSObject options,
  );

  /// Returns true if this `Query` is equal to the provided one.
  ///
  /// @param other The `Query` to compare against.
  /// @return true if this `Query` is equal to the provided one.
  external bool isEqual(Query other);

  /// Applies a custom data converter to this Query, allowing you to use your
  /// own custom model objects with Firestore. When you call get() on the
  /// returned Query, the provided converter will convert between Firestore
  /// data of type `NewDbModelType` and your custom type `NewAppModelType`.
  ///
  /// @param converter Converts objects to and from Firestore. Passing in
  /// `null` removes the current converter.
  /// @return A Query that uses the provided converter.
  external Query withConverter(FirestoreDataConverter? converter);
}

/// A `QuerySnapshot` contains zero or more `QueryDocumentSnapshot` objects
/// representing the results of a query. The documents can be accessed as an
/// array via the `docs` property or enumerated using the `forEach` method. The
/// number of documents can be determined via the `empty` and `size`
/// properties.
extension type QuerySnapshot._(JSObject _) implements JSObject {
  /// The query on which you called `get` or `onSnapshot` in order to get this
  /// `QuerySnapshot`.
  external Query query;

  /// An array of all the documents in the QuerySnapshot.
  external JSArray<QueryDocumentSnapshot> docs;

  /// The number of documents in the QuerySnapshot.
  external int size;

  /// True if there are no documents in the QuerySnapshot.
  external bool empty;

  /// The time this query snapshot was obtained.
  external Timestamp get readTime;

  /// Returns an array of the documents changes since the last snapshot. If
  /// this is the first snapshot, all documents will be in the list as added
  /// changes.
  external JSArray<DocumentChange> docChanges();

  /// Enumerates all of the documents in the QuerySnapshot.
  ///
  /// @param callback A callback to be called with a `DocumentSnapshot` for
  /// each document in the snapshot.
  /// @param thisArg The `this` binding for the callback.
  external void forEach(JSFunction callback, [JSAny thisArg]);

  /// Returns true if the document data in this `QuerySnapshot` is equal to the
  /// provided one.
  ///
  /// @param other The `QuerySnapshot` to compare against.
  /// @return true if this `QuerySnapshot` is equal to the provided one.
  external bool isEqual(QuerySnapshot other);
}

/// A `VectorQuerySnapshot` contains zero or more `QueryDocumentSnapshot` objects
/// representing the results of a query. The documents can be accessed as an
/// array via the `docs` property or enumerated using the `forEach` method. The
/// number of documents can be determined via the `empty` and `size`
/// properties.
extension type VectorQuerySnapshot._(JSObject _) implements JSObject {
  /// The query on which you called `get` in order to get this
  /// `VectorQuerySnapshot`.
  external VectorQuery get query;

  /// An array of all the documents in the QuerySnapshot.
  external JSArray<QueryDocumentSnapshot> get docs;

  /// The number of documents in the QuerySnapshot.
  external int get size;

  /// True if there are no documents in the QuerySnapshot.
  external bool get empty;

  /// The time this query snapshot was obtained.
  external Timestamp get readTime;

  /// Returns an array of the documents changes since the last snapshot. If
  /// this is the first snapshot, all documents will be in the list as added
  /// changes.
  external JSArray<DocumentChange> docChanges();

  /// Enumerates all of the documents in the QuerySnapshot.
  ///
  /// @param callback A callback to be called with a `DocumentSnapshot` for
  /// each document in the snapshot.
  /// @param thisArg The `this` binding for the callback.
  external void forEach(JSFunction callback, [JSAny thisArg]);

  /// Returns true if the document data in this `VectorQuerySnapshot` is equal to the
  /// provided one.
  ///
  /// @param other The `VectorQuerySnapshot` to compare against.
  /// @return true if this `VectorQuerySnapshot` is equal to the provided one.
  external bool isEqual(VectorQuerySnapshot other);
}

/// A `DocumentChange` represents a change to the documents matching a query.
/// It contains the document affected and the type of change that occurred.
extension type DocumentChange._(JSObject _) implements JSObject {
  /// The type of change ('added', 'modified', or 'removed').
  external String get type;

  /// The document affected by this change.
  external QueryDocumentSnapshot get doc;

  /// The index of the changed document in the result set immediately prior to
  /// this DocumentChange (i.e. supposing that all prior DocumentChange objects
  /// have been applied). Is -1 for 'added' events.
  external int get oldIndex;

  /// The index of the changed document in the result set immediately after
  /// this DocumentChange (i.e. supposing that all prior DocumentChange
  /// objects and the current DocumentChange object have been applied).
  /// Is -1 for 'removed' events.
  external int get newIndex;

  /// Returns true if the data in this `DocumentChange` is equal to the
  /// provided one.
  ///
  /// @param other The `DocumentChange` to compare against.
  /// @return true if this `DocumentChange` is equal to the provided one.
  external bool isEqual(DocumentChange other);
}

/// A `CollectionReference` object can be used for adding documents, getting
/// document references, and querying for documents (using the methods
/// inherited from `Query`).
extension type CollectionReference._(JSObject _) implements Query {
  /// The identifier of the collection.
  external String get it;

  /// A reference to the containing Document if this is a subcollection, else
  /// null.
  external DocumentReference? get parent;

  /// A string representing the path of the referenced collection (relative
  /// to the root of the database).
  external String get path;

  /// Retrieves the list of documents in this collection.
  ///
  /// The document references returned may include references to "missing
  /// documents", i.e. document locations that have no document present but
  /// which contain subcollections with documents. Attempting to read such a
  /// document reference (e.g. via `.get()` or `.onSnapshot()`) will return a
  /// `DocumentSnapshot` whose `.exists` property is false.
  ///
  /// @return {Promise<DocumentReference[]>} The list of documents in this
  /// collection.
  external JSPromise<JSArray<DocumentReference>> listDocuments();

  /// Get a `DocumentReference` for the document within the collection at the
  /// specified path.
  ///
  /// @param documentPath A slash-separated path to a document.
  /// @return The `DocumentReference` instance.
  external DocumentReference doc([String documentPath]);

  /// Add a new document to this collection with the specified data, assigning
  /// it a document ID automatically.
  ///
  /// @param data An Object containing the data for the new document.
  /// @throws Error If the provided input is not a valid Firestore document.
  /// @return A Promise resolved with a `DocumentReference` pointing to the
  /// newly created document after it has been written to the backend.
  external JSPromise<DocumentReference> add(JSObject data);

  /// Returns true if this `CollectionReference` is equal to the provided one.
  ///
  /// @param other The `CollectionReference` to compare against.
  /// @return true if this `CollectionReference` is equal to the provided one.
  external bool isEqual(CollectionReference other);

  /// Applies a custom data converter to this CollectionReference, allowing you
  /// to use your own custom model objects with Firestore. When you call add()
  /// on the returned CollectionReference instance, the provided converter will
  /// convert between Firestore data of type `NewDbModelType` and your custom
  /// type `NewAppModelType`.
  ///
  /// @param converter Converts objects to and from Firestore. Passing in
  /// `null` removes the current converter.
  /// @return A CollectionReference that uses the provided converter.
  external CollectionReference withConverter(FirestoreDataConverter? converter);
}

/// A `CollectionGroup` refers to all documents that are contained in a
/// collection or subcollection with a specific collection ID.
extension type CollectionGroup._(JSObject _) implements Query {
  /// Partitions a query by returning partition cursors that can be used to run
  /// the query in parallel. The returned cursors are split points that can be
  /// used as starting and end points for individual query invocations.
  ///
  /// @param desiredPartitionCount The desired maximum number of partition
  /// points. The number must be strictly positive. The actual number of
  /// partitions returned may be fewer.
  /// @return An AsyncIterable of `QueryPartition`s.

  // TODO: Is this possible in dart?
  // getPartitions(
  //   desiredPartitionCount: number
  // ): AsyncIterable<QueryPartition<AppModelType, DbModelType>>;

  /// Applies a custom data converter to this `CollectionGroup`, allowing you
  /// to use your own custom model objects with Firestore. When you call get()
  /// on the returned `CollectionGroup`, the provided converter will convert
  /// between Firestore data of type `NewDbModelType` and your custom type
  /// `NewAppModelType`.
  ///
  /// Using the converter allows you to specify generic type arguments when
  /// storing and retrieving objects from Firestore.
  ///
  /// @example
  /// class Post {
  ///   constructor(readonly title: string, readonly author: string) {}
  ///
  ///   toString(): string {
  ///     return this.title + ', by ' + this.author;
  ///   }
  /// }
  ///
  /// const postConverter = {
  ///   toFirestore(post: Post): FirebaseFirestore.DocumentData {
  ///     return {title: post.title, author: post.author};
  ///   },
  ///   fromFirestore(
  ///     snapshot: FirebaseFirestore.QueryDocumentSnapshot
  ///   ): Post {
  ///     const data = snapshot.data();
  ///     return new Post(data.title, data.author);
  ///   }
  /// };
  ///
  /// const querySnapshot = await Firestore()
  ///   .collectionGroup('posts')
  ///   .withConverter(postConverter)
  ///   .get();
  /// for (const doc of querySnapshot.docs) {
  ///   const post = doc.data();
  ///   post.title; // string
  ///   post.toString(); // Should be defined
  ///   post.someNonExistentProperty; // TS error
  /// }
  ///
  /// @param converter Converts objects to and from Firestore. Passing in
  /// `null` removes the current converter.
  /// @return A `CollectionGroup` that uses the provided converter.
  external CollectionGroup withConverter(FirestoreDataConverter? converter);
}

/// A split point that can be used in a query as a starting and/or end point for
/// the query results. The cursors returned by {@link #startAt} and {@link
/// #endBefore} can only be used in a query that matches the constraint of query
/// that produced this partition.
extension type QueryPartition._(JSObject _) implements JSObject {
  /// The cursor that defines the first result for this partition or
  /// `undefined` if this is the first partition.  The cursor value must be
  /// destructured when passed to `startAt()` (for example with
  /// `query.startAt(...queryPartition.startAt)`).
  ///
  /// @return Cursor values that can be used with {@link Query#startAt} or
  /// `undefined` if this is the first partition.
  external JSArray? startAt();

  /// The cursor that defines the first result after this partition or
  /// `undefined` if this is the last partition.  The cursor value must be
  /// destructured when passed to `endBefore()` (for example with
  /// `query.endBefore(...queryPartition.endBefore)`).
  ///
  /// @return Cursor values that can be used with {@link Query#endBefore} or
  /// `undefined` if this is the last partition.
  external JSArray? endBefore();

  /// Returns a query that only returns the documents for this partition.
  ///
  /// @return A query partitioned by a {@link Query#startAt} and {@link
  /// Query#endBefore} cursor.
  external Query toQuery();
}

/// Static members on [AggregateField]
extension type AggregateFieldStatic._(JSObject _) implements JSObject {
  /// Create an AggregateField object that can be used to compute the count of
  /// documents in the result set of a query.
  external AggregateField count();

  /// Create an AggregateField object that can be used to compute the average of
  /// a specified field over a range of documents in the result set of a query.
  /// @param field Specifies the field to average across the result set.
  external AggregateField average(JSAny field);

  /// Create an AggregateField object that can be used to compute the sum of
  /// a specified field over a range of documents in the result set of a query.
  /// @param field Specifies the field to sum across the result set.
  external AggregateField sum(JSAny field);
}

/// Represents an aggregation that can be performed by Firestore.
extension type AggregateField._(JSObject _) implements JSObject {
  /// Access to static members on [AggregateField]
  static AggregateFieldStatic get static =>
      staticAccess('@google-cloud/firestore', 'AggregateField');

  /// A type string to uniquely identify instances of this class.
  external String get type;

  /// The kind of aggregation performed by this AggregateField.
  external String get aggregateType;

  /// Compares this object with the given object for equality.
  ///
  /// This object is considered "equal" to the other object if and only if
  /// `other` performs the same kind of aggregation on the same field (if any).
  ///
  /// @param other The object to compare to this object for equality.
  /// @return `true` if this object is "equal" to the given object, as
  /// defined above, or `false` otherwise.
  external bool isEqual(AggregateField other);
}

/// A query that calculates aggregations over an underlying query.
extension type AggregateQuery._(JSObject _) implements JSObject {
  /// The query whose aggregations will be calculated by this object.
  external Query get query;

  /// Executes this query.
  ///
  /// @return A promise that will be resolved with the results of the query.
  external JSPromise<AggregateQuerySnapshot> get();

  /// Plans and optionally executes this query. Returns a Promise that will be
  /// resolved with the planner information, statistics from the query execution (if any),
  /// and the query results (if any).
  ///
  /// @return A Promise that will be resolved with the planner information, statistics
  ///  from the query execution (if any), and the query results (if any).
  external JSPromise<ExplainResults<AggregateQuerySnapshot>> explain([
    ExplainOptions options,
  ]);

  /// Compares this object with the given object for equality.
  ///
  /// This object is considered "equal" to the other object if and only if
  /// `other` performs the same aggregations as this `AggregateQuery` and
  /// the underlying Query of `other` compares equal to that of this object
  /// using `Query.isEqual()`.
  ///
  /// @param other The object to compare to this object for equality.
  /// @return `true` if this object is "equal" to the given object, as
  /// defined above, or `false` otherwise.
  external bool isEqual(AggregateQuery other);
}

/// The results of executing an aggregation query.
extension type AggregateQuerySnapshot._(JSObject _) implements JSObject {
  /// The query that was executed to produce this result.
  external AggregateQuery get query;

  /// The time this snapshot was read.
  external Timestamp get readTime;

  /// Returns the results of the aggregations performed over the underlying
  /// query.
  ///
  /// The keys of the returned object will be the same as those of the
  /// `AggregateSpec` object specified to the aggregation method, and the
  /// values will be the corresponding aggregation result.
  ///
  /// @returns The results of the aggregations performed over the underlying
  /// query.
  external JSObject data();

  /// Compares this object with the given object for equality.
  ///
  /// Two `AggregateQuerySnapshot` instances are considered "equal" if they
  /// have the same data and their underlying queries compare "equal" using
  /// `AggregateQuery.isEqual()`.
  ///
  /// @param other The object to compare to this object for equality.
  /// @return `true` if this object is "equal" to the given object, as
  /// defined above, or `false` otherwise.
  external bool isEqual(AggregateQuerySnapshot other);
}

/// A query that finds the document whose vector fields are closest to a certain vector.
extension type VectorQuery._(JSObject _) implements JSObject {
  /// The query whose results participants in the distance search.
  external Query get query;

  /// Executes this query.
  ///
  /// @return A promise that will be resolved with the results of the query.
  external JSPromise<VectorQuerySnapshot> get();

  /// Compares this object with the given object for equality.
  ///
  /// This object is considered "equal" to the other object if and only if
  /// `other` performs the same vector distance search as this `VectorQuery` and
  /// the underlying Query of `other` compares equal to that of this object
  /// using `Query.isEqual()`.
  ///
  /// @param other The object to compare to this object for equality.
  /// @return `true` if this object is "equal" to the given object, as
  /// defined above, or `false` otherwise.
  external bool isEqual(VectorQuery other);
}

/// Represent a vector type in Firestore documents.
extension type VectorValue._(JSObject _) implements JSObject {
  /// Returns a copy of the raw number array form of the vector.
  external JSArray<JSNumber> toArray();

  /// Returns true if the two `VectorValue` has the same raw number arrays, returns false otherwise.
  external bool isEqual(VectorValue other);
}

/// Static members on [FieldValue]
extension type FieldValueStatic._(JSObject _) implements JSObject {
  /// Returns a sentinel used with set(), create() or update() to include a
  /// server-generated timestamp in the written data.
  ///
  /// @return The FieldValue sentinel for use in a call to set(), create() or
  /// update().
  external FieldValue serverTimestamp();

  /// Returns a sentinel for use with update() or set() with {merge:true} to
  /// mark a field for deletion.
  ///
  /// @return The FieldValue sentinel for use in a call to set() or update().
  external FieldValue delete();

  /// Returns a special value that can be used with set(), create() or update()
  /// that tells the server to increment the field's current value by the given
  /// value.
  ///
  /// If either current field value or the operand uses floating point
  /// precision, both values will be interpreted as floating point numbers and
  /// all arithmetic will follow IEEE 754 semantics. Otherwise, integer
  /// precision is kept and the result is capped between -2^63 and 2^63-1.
  ///
  /// If the current field value is not of type 'number', or if the field does
  /// not yet exist, the transformation will set the field to the given value.
  ///
  /// @param n The value to increment by.
  /// @return The FieldValue sentinel for use in a call to set(), create() or
  /// update().
  external FieldValue increment(num n);

  /// Returns a special value that can be used with set(), create() or update()
  /// that tells the server to union the given elements with any array value
  /// that already exists on the server. Each specified element that doesn't
  /// already exist in the array will be added to the end. If the field being
  /// modified is not already an array it will be overwritten with an array
  /// containing exactly the specified elements.
  ///
  /// @param elements The elements to union into the array.
  /// @return The FieldValue sentinel for use in a call to set(), create() or
  /// update().
  external FieldValue arrayUnion(JSArray elements);

  /// Returns a special value that can be used with set(), create() or update()
  /// that tells the server to remove the given elements from any array value
  /// that already exists on the server. All instances of each element
  /// specified will be removed from the array. If the field being modified is
  /// not already an array it will be overwritten with an empty array.
  ///
  /// @param elements The elements to remove from the array.
  /// @return The FieldValue sentinel for use in a call to set(), create() or
  /// update().
  external FieldValue arrayRemove(JSArray elements);

  /// @return A new `VectorValue` constructed with a copy of the given array of number.
  external FieldValue vector(JSArray<JSNumber>? values);
}

/// Sentinel values that can be used when writing document fields with set(),
/// create() or update().
extension type FieldValue._(JSObject _) implements JSObject {
  /// Access to static members on [FieldValue]
  static FieldValueStatic get static =>
      staticAccess('@google-cloud/firestore', 'FieldValue');

  /// Returns true if this `FieldValue` is equal to the provided one.
  ///
  /// @param other The `FieldValue` to compare against.
  /// @return true if this `FieldValue` is equal to the provided one.
  external bool isEqual(FieldValue other);
}

/// Static members on [FieldPath]
extension type FieldPathStatic._(JSObject _) implements JSObject {
  /// Returns a special sentinel FieldPath to refer to the ID of a document.
  /// It can be used in queries to sort or filter by the document ID.
  external FieldPath documentId();
}

/// A FieldPath refers to a field in a document. The path may consist of a
/// single field name (referring to a top-level field in the document), or a
/// list of field names (referring to a nested field in the document).
extension type FieldPath._(JSObject _) implements JSObject {
  /// Access to static members on [FieldPath]
  static FieldPathStatic get static =>
      staticAccess('@google-cloud/firestore', 'FieldPath');

  /// Returns true if this `FieldPath` is equal to the provided one.
  ///
  /// @param other The `FieldPath` to compare against.
  /// @return true if this `FieldPath` is equal to the provided one.
  external bool isEqual(FieldPath other);
}

/// Static members on [Timestamp]
extension type TimestampStatic._(JSObject _) implements JSObject {
  /// Creates a new timestamp with the current date, with millisecond precision.
  ///
  /// @return A new `Timestamp` representing the current date.
  external Timestamp now();

  /// Creates a new timestamp from the given date.
  ///
  /// @param date The date to initialize the `Timestamp` from.
  /// @return A new `Timestamp` representing the same point in time as the
  /// given date.
  external Timestamp fromDate(Date date);

  /// Creates a new timestamp from the given number of milliseconds.
  ///
  /// @param milliseconds Number of milliseconds since Unix epoch
  /// 1970-01-01T00:00:00Z.
  /// @return A new `Timestamp` representing the same point in time as the
  /// given number of milliseconds.
  external Timestamp fromMillis(int milliseconds);
}

/// A Timestamp represents a point in time independent of any time zone or
/// calendar, represented as seconds and fractions of seconds at nanosecond
/// resolution in UTC Epoch time. It is encoded using the Proleptic Gregorian
/// Calendar which extends the Gregorian calendar backwards to year one. It is
/// encoded assuming all minutes are 60 seconds long, i.e. leap seconds are
/// "smeared" so that no leap second table is needed for interpretation. Range
/// is from 0001-01-01T00:00:00Z to 9999-12-31T23:59:59.999999999Z.
///
/// @see https://github.com/google/protobuf/blob/master/src/google/protobuf/timestamp.proto
extension type Timestamp._(JSObject _) implements JSObject {
  /// Access to static members on [Timestamp]
  static TimestampStatic get static =>
      staticAccess('@google-cloud/firestore', 'Timestamp');

  /// Creates a new timestamp.
  ///
  /// @param seconds The number of seconds of UTC time since Unix epoch
  /// 1970-01-01T00:00:00Z. Must be from 0001-01-01T00:00:00Z to
  /// 9999-12-31T23:59:59Z inclusive.
  /// @param nanoseconds The non-negative fractions of a second at nanosecond
  /// resolution. Negative second values with fractions must still have
  /// non-negative nanoseconds values that count forward in time. Must be from
  /// 0 to 999,999,999 inclusive.
  external Timestamp(int seconds, int nanoseconds);

  /// The number of seconds of UTC time since Unix epoch 1970-01-01T00:00:00Z.
  external int get seconds;

  /// The non-negative fractions of a second at nanosecond resolution.
  external int get nanoseconds;

  /// Returns a new `Date` corresponding to this timestamp. This may lose
  /// precision.
  ///
  /// @return JavaScript `Date` object representing the same point in time as
  /// this `Timestamp`, with millisecond precision.
  external Date toDate();

  /// Returns the number of milliseconds since Unix epoch 1970-01-01T00:00:00Z.
  ///
  /// @return The point in time corresponding to this timestamp, represented as
  /// the number of milliseconds since Unix epoch 1970-01-01T00:00:00Z.
  external int toMillis();

  /// Returns true if this `Timestamp` is equal to the provided one.
  ///
  /// @param other The `Timestamp` to compare against.
  /// @return 'true' if this `Timestamp` is equal to the provided one.
  external bool isEqual(Timestamp other);

  /// Converts this object to a primitive `string`, which allows `Timestamp` objects to be compared
  /// using the `>`, `<=`, `>=` and `>` operators.
  ///
  /// @return a string encoding of this object.
  external String valueOf();
}

/// Builds a Firestore data bundle with results from the given document and query snapshots.
extension type BundleBuilder._(JSObject _) implements JSObject {
  /// The ID of this bundle.
  external String get bundleId;

  /// Adds a Firestore `DocumentSnapshot` to the bundle. Both the documents data and the document
  /// read time will be included in the bundle.
  ///
  /// @param documentSnapshot A `DocumentSnapshot` to add.
  /// @returns This instance.
  external BundleBuilder add(DocumentSnapshot documentSnapshot);

  /// Adds a Firestore `QuerySnapshot` to the bundle. Both the documents in the query results and
  /// the query read time will be included in the bundle.
  ///
  /// @param queryName The name of the query to add.
  /// @param querySnapshot A `QuerySnapshot` to add to the bundle.
  /// @returns This instance.
  @JS('add')
  external BundleBuilder addNamed(
    String queryName,
    QuerySnapshot querySnapshot,
  );

  /// Builds the bundle and returns the result as a `Buffer` instance.
  external JSArrayBuffer build();
}

/// Status codes returned by Firestore's gRPC calls.
abstract final class GrpcStatus {
  /// ok
  static const OK = 0;

  /// cancelled
  static const CANCELLED = 1;

  /// unknown
  static const UNKNOWN = 2;

  /// invalid argument
  static const INVALID_ARGUMENT = 3;

  /// deadline exceeded
  static const DEADLINE_EXCEEDED = 4;

  /// not found
  static const NOT_FOUND = 5;

  /// already exists
  static const ALREADY_EXISTS = 6;

  /// permission denied
  static const PERMISSION_DENIED = 7;

  /// resource exhausted
  static const RESOURCE_EXHAUSTED = 8;

  /// failed precondition
  static const FAILED_PRECONDITION = 9;

  /// aborted
  static const ABORTED = 10;

  /// out of range
  static const OUT_OF_RANGE = 11;

  /// unimplemented
  static const UNIMPLEMENTED = 12;

  /// internal
  static const INTERNAL = 13;

  /// unavailable
  static const UNAVAILABLE = 14;

  /// data loss
  static const DATA_LOSS = 15;

  /// unauthenticated
  static const UNAUTHENTICATED = 16;
}

/// Static members on [Filter]
extension type FilterStatic._(JSObject _) implements JSObject {
  /// Creates and returns a new [Filter]{@link Filter}, which can be
  /// applied to [Query.where()]{@link Query#where}, [Filter.or()]{@link Filter#or},
  /// or [Filter.and()]{@link Filter#and}. When applied to a [Query]{@link Query}
  /// it requires that documents must contain the specified field and that its value should
  /// satisfy the relation constraint provided.
  ///
  /// Returns a new Filter that can be used to constrain the value of a Document property.
  ///
  /// @param {string|FieldPath} fieldPath The name of a property value to compare.
  /// @param {string} opStr A comparison operation in the form of a string
  /// (e.g., "<").
  /// @param {*} value The value to which to compare the field for inclusion in
  /// a query.
  /// @returns {Filter} The created Filter.
  ///
  /// @example
  /// ```
  /// let collectionRef = firestore.collection('col');
  ///
  /// collectionRef.where(Filter.where('foo', '==', 'bar')).get().then(querySnapshot => {
  ///   querySnapshot.forEach(documentSnapshot => {
  ///     console.log(`Found document at ${documentSnapshot.ref.path}`);
  ///   });
  /// });
  /// ```
  external Filter where(JSAny fieldPath, String opStr, JSAny value);

  /// Creates and returns a new [Filter]{@link Filter} that is a
  /// disjunction of the given {@link Filter}s. A disjunction filter includes
  /// a document if it satisfies any of the given {@link Filter}s.
  ///
  /// The returned Filter can be applied to [Query.where()]{@link Query#where},
  /// [Filter.or()]{@link Filter#or}, or [Filter.and()]{@link Filter#and}. When
  /// applied to a [Query]{@link Query} it requires that documents must satisfy
  /// one of the provided {@link Filter}s.
  ///
  /// @param {...Filter} filters  Optional. The {@link Filter}s
  /// for OR operation. These must be created with calls to {@link Filter#where},
  /// {@link Filter#or}, or {@link Filter#and}.
  /// @returns {Filter} The created {@link Filter}.
  ///
  /// @example
  /// ```
  /// let collectionRef = firestore.collection('col');
  ///
  /// // doc.foo == 'bar' || doc.baz > 0
  /// let orFilter = Filter.or(Filter.where('foo', '==', 'bar'), Filter.where('baz', '>', 0));
  ///
  /// collectionRef.where(orFilter).get().then(querySnapshot => {
  ///   querySnapshot.forEach(documentSnapshot => {
  ///     console.log(`Found document at ${documentSnapshot.ref.path}`);
  ///   });
  /// });
  /// ```
  external Filter or(JSArray<Filter> filters);

  /// Creates and returns a new [Filter]{@link Filter} that is a
  /// conjunction of the given {@link Filter}s. A conjunction filter includes
  /// a document if it satisfies all of the given {@link Filter}s.
  ///
  /// The returned Filter can be applied to [Query.where()]{@link Query#where},
  /// [Filter.or()]{@link Filter#or}, or [Filter.and()]{@link Filter#and}. When
  /// applied to a [Query]{@link Query} it requires that documents must satisfy
  /// one of the provided {@link Filter}s.
  ///
  /// @param {...Filter} filters  Optional. The {@link Filter}s
  /// for OR operation. These must be created with calls to {@link Filter#where},
  /// {@link Filter#or}, or {@link Filter#and}.
  /// @returns {Filter} The created {@link Filter}.
  ///
  /// @example
  /// ```
  /// let collectionRef = firestore.collection('col');
  ///
  /// // doc.foo == 'bar' && doc.baz > 0
  /// let orFilter = Filter.and(Filter.where('foo', '==', 'bar'), Filter.where('baz', '>', 0));
  ///
  /// collectionRef.where(orFilter).get().then(querySnapshot => {
  ///   querySnapshot.forEach(documentSnapshot => {
  ///     console.log(`Found document at ${documentSnapshot.ref.path}`);
  ///   });
  /// });
  /// ```
  external Filter and(JSArray<Filter> filters);
}

/// A `Filter` represents a restriction on one or more field values and can
/// be used to refine the results of a {@link Query}.
/// `Filters`s are created by invoking {@link Filter#where}, {@link Filter#or},
/// or {@link Filter#and} and can then be passed to {@link Query#where}
/// to create a new {@link Query} instance that also contains this `Filter`.
extension type Filter._(JSObject _) implements JSObject {
  /// Access to static members on [Filter]
  static FilterStatic get static =>
      staticAccess('@google-cloud/firestore', 'Filter');
}

/// A duration
extension type Duration._(JSObject _) implements JSObject {
  /// Signed seconds of the span of time.
  external int get seconds;

  /// Signed fractions of a second at nanosecond resolution of the span
  /// of time. Durations less than one second are represented with a 0
  /// `seconds` field and a positive or negative `nanos` field. For durations
  /// of one second or more, a non-zero value for the `nanos` field must be
  /// of the same sign as the `seconds` field. Must be from -999,999,999
  /// to +999,999,999 inclusive.
  external int get nanoseconds;
}

/// Options used to configure explain queries.
extension type ExplainOptions._(JSObject _) implements JSObject {
  /// Whether analyzing the query is enabled. If true, the query will be
  /// executed and execution statistics will be returned as part of the
  /// [ExplainResults]{@link ExplainResults}.
  external bool get analyze;
}

/// PlanSummary contains information about the planning stage of a query.
extension type PlanSummary._(JSObject _) implements JSObject {
  /// Information about the indexes that were used to serve the query.
  /// This should be inspected or logged, because the contents are intended to be
  /// human-readable. Contents are subject to change, and it is advised to not
  /// program against this object.
  external JSArray<JSObject> get indexesUsed;
}

/// ExecutionStats contains information about the execution of a query.
extension type ExecutionStats._(JSObject _) implements JSObject {
  /// The number of query results.
  external int get resultsReturned;

  /// The total execution time of the query.
  external Duration get executionDuration;

  /// The number of read operations that occurred when executing the query.
  external int get readOperations;

  /// Contains additional statistics related to the query execution.
  /// This should be inspected or logged, because the contents are intended to be
  /// human-readable. Contents are subject to change, and it is advised to not
  /// program against this object.
  external JSObject get debugStats;
}

/// ExplainMetrics contains information about planning and execution of a query.
extension type ExplainMetrics._(JSObject _) implements JSObject {
  /// Information about the query plan.
  external PlanSummary get planSummary;

  /// Information about the execution of the query, or null if the query was
  /// not executed.
  external ExecutionStats? get executionStats;
}

/// ExplainResults contains information about planning, execution, and results
/// of a query.
extension type ExplainResults<T extends JSObject>._(JSObject _)
    implements JSObject {
  /// Information about planning and execution of the query.
  external ExplainMetrics get metrics;

  /// The snapshot that contains the results of executing the query, or null
  /// if the query was not executed.
  external T? get snapshot;
}
