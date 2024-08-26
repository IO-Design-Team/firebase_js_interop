// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters, duplicate_ignore
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_internal_member

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class UserCollectionReference
    implements
        UserQuery,
        FirestoreCollectionReference<FjiUser, UserQuerySnapshot> {
  factory UserCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$UserCollectionReference;

  static FjiUser fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$FjiUserFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    FjiUser value,
    SetOptions? options,
  ) {
    return _$FjiUserToJson(value);
  }

  @override
  CollectionReference<FjiUser> get reference;

  @override
  UserDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<UserDocumentReference> add(FjiUser value);
}

class _$UserCollectionReference extends _$UserQuery
    implements UserCollectionReference {
  factory _$UserCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$UserCollectionReference._(
      firestore.collection('users').withConverter(
            fromFirestore: UserCollectionReference.fromFirestore,
            toFirestore: UserCollectionReference.toFirestore,
          ),
    );
  }

  _$UserCollectionReference._(
    CollectionReference<FjiUser> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<FjiUser> get reference =>
      super.reference as CollectionReference<FjiUser>;

  @override
  UserDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return UserDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<UserDocumentReference> add(FjiUser value) {
    return reference.add(value).then((ref) => UserDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class UserDocumentReference
    extends FirestoreDocumentReference<FjiUser, UserDocumentSnapshot> {
  factory UserDocumentReference(DocumentReference<FjiUser> reference) =
      _$UserDocumentReference;

  DocumentReference<FjiUser> get reference;

  /// A reference to the [UserCollectionReference] containing this document.
  UserCollectionReference get parent {
    return _$UserCollectionReference(reference.firestore);
  }

  @override
  Stream<UserDocumentSnapshot> snapshots();

  @override
  Future<UserDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    String? displayName,
    FieldValue displayNameFieldValue,
    String? profileImage,
    FieldValue profileImageFieldValue,
    Set<String> fcmTokens,
    FieldValue fcmTokensFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    String? displayName,
    FieldValue displayNameFieldValue,
    String? profileImage,
    FieldValue profileImageFieldValue,
    Set<String> fcmTokens,
    FieldValue fcmTokensFieldValue,
  });

  /// Updates fields in the current document using the batch API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void batchUpdate(
    WriteBatch batch, {
    String? displayName,
    FieldValue displayNameFieldValue,
    String? profileImage,
    FieldValue profileImageFieldValue,
    Set<String> fcmTokens,
    FieldValue fcmTokensFieldValue,
  });
}

class _$UserDocumentReference
    extends FirestoreDocumentReference<FjiUser, UserDocumentSnapshot>
    implements UserDocumentReference {
  _$UserDocumentReference(this.reference);

  @override
  final DocumentReference<FjiUser> reference;

  /// A reference to the [UserCollectionReference] containing this document.
  UserCollectionReference get parent {
    return _$UserCollectionReference(reference.firestore);
  }

  @override
  Stream<UserDocumentSnapshot> snapshots() {
    return reference.snapshots().map(UserDocumentSnapshot._);
  }

  @override
  Future<UserDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(UserDocumentSnapshot._);
  }

  @override
  Future<UserDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(UserDocumentSnapshot._);
  }

  Future<void> update({
    Object? displayName = _sentinel,
    FieldValue? displayNameFieldValue,
    Object? profileImage = _sentinel,
    FieldValue? profileImageFieldValue,
    Object? fcmTokens = _sentinel,
    FieldValue? fcmTokensFieldValue,
  }) async {
    assert(
      displayName == _sentinel || displayNameFieldValue == null,
      "Cannot specify both displayName and displayNameFieldValue",
    );
    assert(
      profileImage == _sentinel || profileImageFieldValue == null,
      "Cannot specify both profileImage and profileImageFieldValue",
    );
    assert(
      fcmTokens == _sentinel || fcmTokensFieldValue == null,
      "Cannot specify both fcmTokens and fcmTokensFieldValue",
    );
    final json = {
      if (displayName != _sentinel)
        _$FjiUserFieldMap['displayName']!:
            _$FjiUserPerFieldToJson.displayName(displayName as String?),
      if (displayNameFieldValue != null)
        _$FjiUserFieldMap['displayName']!: displayNameFieldValue,
      if (profileImage != _sentinel)
        _$FjiUserFieldMap['profileImage']!:
            _$FjiUserPerFieldToJson.profileImage(profileImage as String?),
      if (profileImageFieldValue != null)
        _$FjiUserFieldMap['profileImage']!: profileImageFieldValue,
      if (fcmTokens != _sentinel)
        _$FjiUserFieldMap['fcmTokens']!:
            _$FjiUserPerFieldToJson.fcmTokens(fcmTokens as Set<String>),
      if (fcmTokensFieldValue != null)
        _$FjiUserFieldMap['fcmTokens']!: fcmTokensFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? displayName = _sentinel,
    FieldValue? displayNameFieldValue,
    Object? profileImage = _sentinel,
    FieldValue? profileImageFieldValue,
    Object? fcmTokens = _sentinel,
    FieldValue? fcmTokensFieldValue,
  }) {
    assert(
      displayName == _sentinel || displayNameFieldValue == null,
      "Cannot specify both displayName and displayNameFieldValue",
    );
    assert(
      profileImage == _sentinel || profileImageFieldValue == null,
      "Cannot specify both profileImage and profileImageFieldValue",
    );
    assert(
      fcmTokens == _sentinel || fcmTokensFieldValue == null,
      "Cannot specify both fcmTokens and fcmTokensFieldValue",
    );
    final json = {
      if (displayName != _sentinel)
        _$FjiUserFieldMap['displayName']!:
            _$FjiUserPerFieldToJson.displayName(displayName as String?),
      if (displayNameFieldValue != null)
        _$FjiUserFieldMap['displayName']!: displayNameFieldValue,
      if (profileImage != _sentinel)
        _$FjiUserFieldMap['profileImage']!:
            _$FjiUserPerFieldToJson.profileImage(profileImage as String?),
      if (profileImageFieldValue != null)
        _$FjiUserFieldMap['profileImage']!: profileImageFieldValue,
      if (fcmTokens != _sentinel)
        _$FjiUserFieldMap['fcmTokens']!:
            _$FjiUserPerFieldToJson.fcmTokens(fcmTokens as Set<String>),
      if (fcmTokensFieldValue != null)
        _$FjiUserFieldMap['fcmTokens']!: fcmTokensFieldValue,
    };

    transaction.update(reference, json);
  }

  void batchUpdate(
    WriteBatch batch, {
    Object? displayName = _sentinel,
    FieldValue? displayNameFieldValue,
    Object? profileImage = _sentinel,
    FieldValue? profileImageFieldValue,
    Object? fcmTokens = _sentinel,
    FieldValue? fcmTokensFieldValue,
  }) {
    assert(
      displayName == _sentinel || displayNameFieldValue == null,
      "Cannot specify both displayName and displayNameFieldValue",
    );
    assert(
      profileImage == _sentinel || profileImageFieldValue == null,
      "Cannot specify both profileImage and profileImageFieldValue",
    );
    assert(
      fcmTokens == _sentinel || fcmTokensFieldValue == null,
      "Cannot specify both fcmTokens and fcmTokensFieldValue",
    );
    final json = {
      if (displayName != _sentinel)
        _$FjiUserFieldMap['displayName']!:
            _$FjiUserPerFieldToJson.displayName(displayName as String?),
      if (displayNameFieldValue != null)
        _$FjiUserFieldMap['displayName']!: displayNameFieldValue,
      if (profileImage != _sentinel)
        _$FjiUserFieldMap['profileImage']!:
            _$FjiUserPerFieldToJson.profileImage(profileImage as String?),
      if (profileImageFieldValue != null)
        _$FjiUserFieldMap['profileImage']!: profileImageFieldValue,
      if (fcmTokens != _sentinel)
        _$FjiUserFieldMap['fcmTokens']!:
            _$FjiUserPerFieldToJson.fcmTokens(fcmTokens as Set<String>),
      if (fcmTokensFieldValue != null)
        _$FjiUserFieldMap['fcmTokens']!: fcmTokensFieldValue,
    };

    batch.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is UserDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class UserQuery implements QueryReference<FjiUser, UserQuerySnapshot> {
  @override
  UserQuery limit(int limit);

  @override
  UserQuery limitToLast(int limit);

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  UserQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  UserQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  UserQuery whereDisplayName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
    bool? isNull,
  });

  UserQuery whereProfileImage({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
    bool? isNull,
  });

  UserQuery whereFcmTokens({
    Set<String>? isEqualTo,
    Set<String>? isNotEqualTo,
    Set<String>? isLessThan,
    Set<String>? isLessThanOrEqualTo,
    Set<String>? isGreaterThan,
    Set<String>? isGreaterThanOrEqualTo,
    String? arrayContains,
    Set<String>? arrayContainsAny,
    bool? isNull,
  });

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  UserQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  });

  UserQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  });

  UserQuery orderByDisplayName({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  });

  UserQuery orderByProfileImage({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  });

  UserQuery orderByFcmTokens({
    bool descending = false,
    Set<String> startAt,
    Set<String> startAfter,
    Set<String> endAt,
    Set<String> endBefore,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  });
}

class _$UserQuery extends QueryReference<FjiUser, UserQuerySnapshot>
    implements UserQuery {
  _$UserQuery(
    this._collection, {
    required Query<FjiUser> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<UserQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(UserQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<UserQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(UserQuerySnapshot._fromQuerySnapshot);
  }

  @override
  UserQuery limit(int limit) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserQuery limitToLast(int limit) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserQuery whereDocumentId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserQuery whereDisplayName({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$FjiUserFieldMap['displayName']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$FjiUserPerFieldToJson.displayName(isEqualTo as String?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$FjiUserPerFieldToJson.displayName(isNotEqualTo as String?)
            : null,
        isLessThan: isLessThan != null
            ? _$FjiUserPerFieldToJson.displayName(isLessThan as String?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$FjiUserPerFieldToJson
                .displayName(isLessThanOrEqualTo as String?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$FjiUserPerFieldToJson.displayName(isGreaterThan as String?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$FjiUserPerFieldToJson
                .displayName(isGreaterThanOrEqualTo as String?)
            : null,
        whereIn: whereIn?.map((e) => _$FjiUserPerFieldToJson.displayName(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$FjiUserPerFieldToJson.displayName(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserQuery whereProfileImage({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
    bool? isNull,
  }) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$FjiUserFieldMap['profileImage']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$FjiUserPerFieldToJson.profileImage(isEqualTo as String?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$FjiUserPerFieldToJson.profileImage(isNotEqualTo as String?)
            : null,
        isLessThan: isLessThan != null
            ? _$FjiUserPerFieldToJson.profileImage(isLessThan as String?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$FjiUserPerFieldToJson
                .profileImage(isLessThanOrEqualTo as String?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$FjiUserPerFieldToJson.profileImage(isGreaterThan as String?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$FjiUserPerFieldToJson
                .profileImage(isGreaterThanOrEqualTo as String?)
            : null,
        whereIn: whereIn?.map((e) => _$FjiUserPerFieldToJson.profileImage(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$FjiUserPerFieldToJson.profileImage(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserQuery whereFcmTokens({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    Set<String>? arrayContainsAny,
    bool? isNull,
  }) {
    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$FjiUserFieldMap['fcmTokens']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$FjiUserPerFieldToJson.fcmTokens(isEqualTo as Set<String>)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$FjiUserPerFieldToJson.fcmTokens(isNotEqualTo as Set<String>)
            : null,
        isLessThan: isLessThan != null
            ? _$FjiUserPerFieldToJson.fcmTokens(isLessThan as Set<String>)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$FjiUserPerFieldToJson
                .fcmTokens(isLessThanOrEqualTo as Set<String>)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$FjiUserPerFieldToJson.fcmTokens(isGreaterThan as Set<String>)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$FjiUserPerFieldToJson
                .fcmTokens(isGreaterThanOrEqualTo as Set<String>)
            : null,
        arrayContains: arrayContains != null
            ? (_$FjiUserPerFieldToJson.fcmTokens({arrayContains as String})
                    as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$FjiUserPerFieldToJson.fcmTokens(arrayContainsAny)
                as Iterable<Object>?
            : null,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  UserQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserQuery orderByDisplayName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$FjiUserFieldMap['displayName']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserQuery orderByProfileImage({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$FjiUserFieldMap['profileImage']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  UserQuery orderByFcmTokens({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    UserDocumentSnapshot? startAtDocument,
    UserDocumentSnapshot? endAtDocument,
    UserDocumentSnapshot? endBeforeDocument,
    UserDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$FjiUserFieldMap['fcmTokens']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$UserQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$UserQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class UserDocumentSnapshot extends FirestoreDocumentSnapshot<FjiUser> {
  UserDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<FjiUser> snapshot;

  @override
  UserDocumentReference get reference {
    return UserDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final FjiUser? data;
}

class UserQuerySnapshot
    extends FirestoreQuerySnapshot<FjiUser, UserQueryDocumentSnapshot> {
  UserQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory UserQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<FjiUser> snapshot,
  ) {
    final docs = snapshot.docs.map(UserQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        UserDocumentSnapshot._,
      );
    }).toList();

    return UserQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<UserDocumentSnapshot> _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    UserDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<UserDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<FjiUser> snapshot;

  @override
  final List<UserQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<UserDocumentSnapshot>> docChanges;
}

class UserQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot<FjiUser>
    implements UserDocumentSnapshot {
  UserQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<FjiUser> snapshot;

  @override
  final FjiUser data;

  @override
  UserDocumentReference get reference {
    return UserDocumentReference(snapshot.reference);
  }
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class ChatCollectionReference
    implements
        ChatQuery,
        FirestoreCollectionReference<FjiChat, ChatQuerySnapshot> {
  factory ChatCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$ChatCollectionReference;

  static FjiChat fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$FjiChatFromJson({'id': snapshot.id, ...?snapshot.data()});
  }

  static Map<String, Object?> toFirestore(
    FjiChat value,
    SetOptions? options,
  ) {
    return {..._$FjiChatToJson(value)}..remove('id');
  }

  @override
  CollectionReference<FjiChat> get reference;

  @override
  ChatDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<ChatDocumentReference> add(FjiChat value);
}

class _$ChatCollectionReference extends _$ChatQuery
    implements ChatCollectionReference {
  factory _$ChatCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$ChatCollectionReference._(
      firestore.collection('chats').withConverter(
            fromFirestore: ChatCollectionReference.fromFirestore,
            toFirestore: ChatCollectionReference.toFirestore,
          ),
    );
  }

  _$ChatCollectionReference._(
    CollectionReference<FjiChat> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  String get path => reference.path;

  @override
  CollectionReference<FjiChat> get reference =>
      super.reference as CollectionReference<FjiChat>;

  @override
  ChatDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return ChatDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<ChatDocumentReference> add(FjiChat value) {
    return reference.add(value).then((ref) => ChatDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$ChatCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class ChatDocumentReference
    extends FirestoreDocumentReference<FjiChat, ChatDocumentSnapshot> {
  factory ChatDocumentReference(DocumentReference<FjiChat> reference) =
      _$ChatDocumentReference;

  DocumentReference<FjiChat> get reference;

  /// A reference to the [ChatCollectionReference] containing this document.
  ChatCollectionReference get parent {
    return _$ChatCollectionReference(reference.firestore);
  }

  late final FjiMessageCollectionReference messages =
      _$FjiMessageCollectionReference(
    reference,
  );

  @override
  Stream<ChatDocumentSnapshot> snapshots();

  @override
  Future<ChatDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    Set<String> participants,
    FieldValue participantsFieldValue,
    String? lastMessage,
    FieldValue lastMessageFieldValue,
    DateTime? lastMessageTime,
    FieldValue lastMessageTimeFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    Set<String> participants,
    FieldValue participantsFieldValue,
    String? lastMessage,
    FieldValue lastMessageFieldValue,
    DateTime? lastMessageTime,
    FieldValue lastMessageTimeFieldValue,
  });

  /// Updates fields in the current document using the batch API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void batchUpdate(
    WriteBatch batch, {
    Set<String> participants,
    FieldValue participantsFieldValue,
    String? lastMessage,
    FieldValue lastMessageFieldValue,
    DateTime? lastMessageTime,
    FieldValue lastMessageTimeFieldValue,
  });
}

class _$ChatDocumentReference
    extends FirestoreDocumentReference<FjiChat, ChatDocumentSnapshot>
    implements ChatDocumentReference {
  _$ChatDocumentReference(this.reference);

  @override
  final DocumentReference<FjiChat> reference;

  /// A reference to the [ChatCollectionReference] containing this document.
  ChatCollectionReference get parent {
    return _$ChatCollectionReference(reference.firestore);
  }

  late final FjiMessageCollectionReference messages =
      _$FjiMessageCollectionReference(
    reference,
  );

  @override
  Stream<ChatDocumentSnapshot> snapshots() {
    return reference.snapshots().map(ChatDocumentSnapshot._);
  }

  @override
  Future<ChatDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(ChatDocumentSnapshot._);
  }

  @override
  Future<ChatDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(ChatDocumentSnapshot._);
  }

  Future<void> update({
    Object? participants = _sentinel,
    FieldValue? participantsFieldValue,
    Object? lastMessage = _sentinel,
    FieldValue? lastMessageFieldValue,
    Object? lastMessageTime = _sentinel,
    FieldValue? lastMessageTimeFieldValue,
  }) async {
    assert(
      participants == _sentinel || participantsFieldValue == null,
      "Cannot specify both participants and participantsFieldValue",
    );
    assert(
      lastMessage == _sentinel || lastMessageFieldValue == null,
      "Cannot specify both lastMessage and lastMessageFieldValue",
    );
    assert(
      lastMessageTime == _sentinel || lastMessageTimeFieldValue == null,
      "Cannot specify both lastMessageTime and lastMessageTimeFieldValue",
    );
    final json = {
      if (participants != _sentinel)
        _$FjiChatFieldMap['participants']!:
            _$FjiChatPerFieldToJson.participants(participants as Set<String>),
      if (participantsFieldValue != null)
        _$FjiChatFieldMap['participants']!: participantsFieldValue,
      if (lastMessage != _sentinel)
        _$FjiChatFieldMap['lastMessage']!:
            _$FjiChatPerFieldToJson.lastMessage(lastMessage as String?),
      if (lastMessageFieldValue != null)
        _$FjiChatFieldMap['lastMessage']!: lastMessageFieldValue,
      if (lastMessageTime != _sentinel)
        _$FjiChatFieldMap['lastMessageTime']!: _$FjiChatPerFieldToJson
            .lastMessageTime(lastMessageTime as DateTime?),
      if (lastMessageTimeFieldValue != null)
        _$FjiChatFieldMap['lastMessageTime']!: lastMessageTimeFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? participants = _sentinel,
    FieldValue? participantsFieldValue,
    Object? lastMessage = _sentinel,
    FieldValue? lastMessageFieldValue,
    Object? lastMessageTime = _sentinel,
    FieldValue? lastMessageTimeFieldValue,
  }) {
    assert(
      participants == _sentinel || participantsFieldValue == null,
      "Cannot specify both participants and participantsFieldValue",
    );
    assert(
      lastMessage == _sentinel || lastMessageFieldValue == null,
      "Cannot specify both lastMessage and lastMessageFieldValue",
    );
    assert(
      lastMessageTime == _sentinel || lastMessageTimeFieldValue == null,
      "Cannot specify both lastMessageTime and lastMessageTimeFieldValue",
    );
    final json = {
      if (participants != _sentinel)
        _$FjiChatFieldMap['participants']!:
            _$FjiChatPerFieldToJson.participants(participants as Set<String>),
      if (participantsFieldValue != null)
        _$FjiChatFieldMap['participants']!: participantsFieldValue,
      if (lastMessage != _sentinel)
        _$FjiChatFieldMap['lastMessage']!:
            _$FjiChatPerFieldToJson.lastMessage(lastMessage as String?),
      if (lastMessageFieldValue != null)
        _$FjiChatFieldMap['lastMessage']!: lastMessageFieldValue,
      if (lastMessageTime != _sentinel)
        _$FjiChatFieldMap['lastMessageTime']!: _$FjiChatPerFieldToJson
            .lastMessageTime(lastMessageTime as DateTime?),
      if (lastMessageTimeFieldValue != null)
        _$FjiChatFieldMap['lastMessageTime']!: lastMessageTimeFieldValue,
    };

    transaction.update(reference, json);
  }

  void batchUpdate(
    WriteBatch batch, {
    Object? participants = _sentinel,
    FieldValue? participantsFieldValue,
    Object? lastMessage = _sentinel,
    FieldValue? lastMessageFieldValue,
    Object? lastMessageTime = _sentinel,
    FieldValue? lastMessageTimeFieldValue,
  }) {
    assert(
      participants == _sentinel || participantsFieldValue == null,
      "Cannot specify both participants and participantsFieldValue",
    );
    assert(
      lastMessage == _sentinel || lastMessageFieldValue == null,
      "Cannot specify both lastMessage and lastMessageFieldValue",
    );
    assert(
      lastMessageTime == _sentinel || lastMessageTimeFieldValue == null,
      "Cannot specify both lastMessageTime and lastMessageTimeFieldValue",
    );
    final json = {
      if (participants != _sentinel)
        _$FjiChatFieldMap['participants']!:
            _$FjiChatPerFieldToJson.participants(participants as Set<String>),
      if (participantsFieldValue != null)
        _$FjiChatFieldMap['participants']!: participantsFieldValue,
      if (lastMessage != _sentinel)
        _$FjiChatFieldMap['lastMessage']!:
            _$FjiChatPerFieldToJson.lastMessage(lastMessage as String?),
      if (lastMessageFieldValue != null)
        _$FjiChatFieldMap['lastMessage']!: lastMessageFieldValue,
      if (lastMessageTime != _sentinel)
        _$FjiChatFieldMap['lastMessageTime']!: _$FjiChatPerFieldToJson
            .lastMessageTime(lastMessageTime as DateTime?),
      if (lastMessageTimeFieldValue != null)
        _$FjiChatFieldMap['lastMessageTime']!: lastMessageTimeFieldValue,
    };

    batch.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class ChatQuery implements QueryReference<FjiChat, ChatQuerySnapshot> {
  @override
  ChatQuery limit(int limit);

  @override
  ChatQuery limitToLast(int limit);

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  ChatQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  ChatQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  ChatQuery whereParticipants({
    Set<String>? isEqualTo,
    Set<String>? isNotEqualTo,
    Set<String>? isLessThan,
    Set<String>? isLessThanOrEqualTo,
    Set<String>? isGreaterThan,
    Set<String>? isGreaterThanOrEqualTo,
    String? arrayContains,
    Set<String>? arrayContainsAny,
    bool? isNull,
  });

  ChatQuery whereLastMessage({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
    bool? isNull,
  });

  ChatQuery whereLastMessageTime({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
    bool? isNull,
  });

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  ChatQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    ChatDocumentSnapshot? startAtDocument,
    ChatDocumentSnapshot? endAtDocument,
    ChatDocumentSnapshot? endBeforeDocument,
    ChatDocumentSnapshot? startAfterDocument,
  });

  ChatQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ChatDocumentSnapshot? startAtDocument,
    ChatDocumentSnapshot? endAtDocument,
    ChatDocumentSnapshot? endBeforeDocument,
    ChatDocumentSnapshot? startAfterDocument,
  });

  ChatQuery orderByParticipants({
    bool descending = false,
    Set<String> startAt,
    Set<String> startAfter,
    Set<String> endAt,
    Set<String> endBefore,
    ChatDocumentSnapshot? startAtDocument,
    ChatDocumentSnapshot? endAtDocument,
    ChatDocumentSnapshot? endBeforeDocument,
    ChatDocumentSnapshot? startAfterDocument,
  });

  ChatQuery orderByLastMessage({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    ChatDocumentSnapshot? startAtDocument,
    ChatDocumentSnapshot? endAtDocument,
    ChatDocumentSnapshot? endBeforeDocument,
    ChatDocumentSnapshot? startAfterDocument,
  });

  ChatQuery orderByLastMessageTime({
    bool descending = false,
    DateTime? startAt,
    DateTime? startAfter,
    DateTime? endAt,
    DateTime? endBefore,
    ChatDocumentSnapshot? startAtDocument,
    ChatDocumentSnapshot? endAtDocument,
    ChatDocumentSnapshot? endBeforeDocument,
    ChatDocumentSnapshot? startAfterDocument,
  });
}

class _$ChatQuery extends QueryReference<FjiChat, ChatQuerySnapshot>
    implements ChatQuery {
  _$ChatQuery(
    this._collection, {
    required Query<FjiChat> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<ChatQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(ChatQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<ChatQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(ChatQuerySnapshot._fromQuerySnapshot);
  }

  @override
  ChatQuery limit(int limit) {
    return _$ChatQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ChatQuery limitToLast(int limit) {
    return _$ChatQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ChatQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$ChatQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ChatQuery whereDocumentId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$ChatQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ChatQuery whereParticipants({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    Set<String>? arrayContainsAny,
    bool? isNull,
  }) {
    return _$ChatQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$FjiChatFieldMap['participants']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$FjiChatPerFieldToJson.participants(isEqualTo as Set<String>)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$FjiChatPerFieldToJson.participants(isNotEqualTo as Set<String>)
            : null,
        isLessThan: isLessThan != null
            ? _$FjiChatPerFieldToJson.participants(isLessThan as Set<String>)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$FjiChatPerFieldToJson
                .participants(isLessThanOrEqualTo as Set<String>)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$FjiChatPerFieldToJson.participants(isGreaterThan as Set<String>)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$FjiChatPerFieldToJson
                .participants(isGreaterThanOrEqualTo as Set<String>)
            : null,
        arrayContains: arrayContains != null
            ? (_$FjiChatPerFieldToJson.participants({arrayContains as String})
                    as List?)!
                .single
            : null,
        arrayContainsAny: arrayContainsAny != null
            ? _$FjiChatPerFieldToJson.participants(arrayContainsAny)
                as Iterable<Object>?
            : null,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ChatQuery whereLastMessage({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
    bool? isNull,
  }) {
    return _$ChatQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$FjiChatFieldMap['lastMessage']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$FjiChatPerFieldToJson.lastMessage(isEqualTo as String?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$FjiChatPerFieldToJson.lastMessage(isNotEqualTo as String?)
            : null,
        isLessThan: isLessThan != null
            ? _$FjiChatPerFieldToJson.lastMessage(isLessThan as String?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$FjiChatPerFieldToJson
                .lastMessage(isLessThanOrEqualTo as String?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$FjiChatPerFieldToJson.lastMessage(isGreaterThan as String?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$FjiChatPerFieldToJson
                .lastMessage(isGreaterThanOrEqualTo as String?)
            : null,
        whereIn: whereIn?.map((e) => _$FjiChatPerFieldToJson.lastMessage(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$FjiChatPerFieldToJson.lastMessage(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ChatQuery whereLastMessageTime({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
    bool? isNull,
  }) {
    return _$ChatQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$FjiChatFieldMap['lastMessageTime']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$FjiChatPerFieldToJson.lastMessageTime(isEqualTo as DateTime?)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$FjiChatPerFieldToJson.lastMessageTime(isNotEqualTo as DateTime?)
            : null,
        isLessThan: isLessThan != null
            ? _$FjiChatPerFieldToJson.lastMessageTime(isLessThan as DateTime?)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$FjiChatPerFieldToJson
                .lastMessageTime(isLessThanOrEqualTo as DateTime?)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$FjiChatPerFieldToJson
                .lastMessageTime(isGreaterThan as DateTime?)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$FjiChatPerFieldToJson
                .lastMessageTime(isGreaterThanOrEqualTo as DateTime?)
            : null,
        whereIn:
            whereIn?.map((e) => _$FjiChatPerFieldToJson.lastMessageTime(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$FjiChatPerFieldToJson.lastMessageTime(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  ChatQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ChatDocumentSnapshot? startAtDocument,
    ChatDocumentSnapshot? endAtDocument,
    ChatDocumentSnapshot? endBeforeDocument,
    ChatDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ChatQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  ChatQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ChatDocumentSnapshot? startAtDocument,
    ChatDocumentSnapshot? endAtDocument,
    ChatDocumentSnapshot? endBeforeDocument,
    ChatDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ChatQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  ChatQuery orderByParticipants({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ChatDocumentSnapshot? startAtDocument,
    ChatDocumentSnapshot? endAtDocument,
    ChatDocumentSnapshot? endBeforeDocument,
    ChatDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$FjiChatFieldMap['participants']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ChatQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  ChatQuery orderByLastMessage({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ChatDocumentSnapshot? startAtDocument,
    ChatDocumentSnapshot? endAtDocument,
    ChatDocumentSnapshot? endBeforeDocument,
    ChatDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$FjiChatFieldMap['lastMessage']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ChatQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  ChatQuery orderByLastMessageTime({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ChatDocumentSnapshot? startAtDocument,
    ChatDocumentSnapshot? endAtDocument,
    ChatDocumentSnapshot? endBeforeDocument,
    ChatDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$FjiChatFieldMap['lastMessageTime']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$ChatQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$ChatQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class ChatDocumentSnapshot extends FirestoreDocumentSnapshot<FjiChat> {
  ChatDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<FjiChat> snapshot;

  @override
  ChatDocumentReference get reference {
    return ChatDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final FjiChat? data;
}

class ChatQuerySnapshot
    extends FirestoreQuerySnapshot<FjiChat, ChatQueryDocumentSnapshot> {
  ChatQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory ChatQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<FjiChat> snapshot,
  ) {
    final docs = snapshot.docs.map(ChatQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        ChatDocumentSnapshot._,
      );
    }).toList();

    return ChatQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<ChatDocumentSnapshot> _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    ChatDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<ChatDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<FjiChat> snapshot;

  @override
  final List<ChatQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<ChatDocumentSnapshot>> docChanges;
}

class ChatQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot<FjiChat>
    implements ChatDocumentSnapshot {
  ChatQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<FjiChat> snapshot;

  @override
  final FjiChat data;

  @override
  ChatDocumentReference get reference {
    return ChatDocumentReference(snapshot.reference);
  }
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class FjiMessageCollectionReference
    implements
        FjiMessageQuery,
        FirestoreCollectionReference<FjiMessage, FjiMessageQuerySnapshot> {
  factory FjiMessageCollectionReference(
    DocumentReference<FjiChat> parent,
  ) = _$FjiMessageCollectionReference;

  static FjiMessage fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$FjiMessageFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    FjiMessage value,
    SetOptions? options,
  ) {
    return _$FjiMessageToJson(value);
  }

  @override
  CollectionReference<FjiMessage> get reference;

  /// A reference to the containing [ChatDocumentReference] if this is a subcollection.
  ChatDocumentReference get parent;

  @override
  FjiMessageDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<FjiMessageDocumentReference> add(FjiMessage value);
}

class _$FjiMessageCollectionReference extends _$FjiMessageQuery
    implements FjiMessageCollectionReference {
  factory _$FjiMessageCollectionReference(
    DocumentReference<FjiChat> parent,
  ) {
    return _$FjiMessageCollectionReference._(
      ChatDocumentReference(parent),
      parent.collection('messages').withConverter(
            fromFirestore: FjiMessageCollectionReference.fromFirestore,
            toFirestore: FjiMessageCollectionReference.toFirestore,
          ),
    );
  }

  _$FjiMessageCollectionReference._(
    this.parent,
    CollectionReference<FjiMessage> reference,
  ) : super(reference, $referenceWithoutCursor: reference);

  @override
  final ChatDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<FjiMessage> get reference =>
      super.reference as CollectionReference<FjiMessage>;

  @override
  FjiMessageDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return FjiMessageDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<FjiMessageDocumentReference> add(FjiMessage value) {
    return reference.add(value).then((ref) => FjiMessageDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$FjiMessageCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class FjiMessageDocumentReference
    extends FirestoreDocumentReference<FjiMessage, FjiMessageDocumentSnapshot> {
  factory FjiMessageDocumentReference(DocumentReference<FjiMessage> reference) =
      _$FjiMessageDocumentReference;

  DocumentReference<FjiMessage> get reference;

  /// A reference to the [FjiMessageCollectionReference] containing this document.
  FjiMessageCollectionReference get parent {
    return _$FjiMessageCollectionReference(
      reference.parent.parent!.withConverter<FjiChat>(
        fromFirestore: ChatCollectionReference.fromFirestore,
        toFirestore: ChatCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<FjiMessageDocumentSnapshot> snapshots();

  @override
  Future<FjiMessageDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    DateTime timestamp,
    FieldValue timestampFieldValue,
    String author,
    FieldValue authorFieldValue,
    String text,
    FieldValue textFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    DateTime timestamp,
    FieldValue timestampFieldValue,
    String author,
    FieldValue authorFieldValue,
    String text,
    FieldValue textFieldValue,
  });

  /// Updates fields in the current document using the batch API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void batchUpdate(
    WriteBatch batch, {
    DateTime timestamp,
    FieldValue timestampFieldValue,
    String author,
    FieldValue authorFieldValue,
    String text,
    FieldValue textFieldValue,
  });
}

class _$FjiMessageDocumentReference
    extends FirestoreDocumentReference<FjiMessage, FjiMessageDocumentSnapshot>
    implements FjiMessageDocumentReference {
  _$FjiMessageDocumentReference(this.reference);

  @override
  final DocumentReference<FjiMessage> reference;

  /// A reference to the [FjiMessageCollectionReference] containing this document.
  FjiMessageCollectionReference get parent {
    return _$FjiMessageCollectionReference(
      reference.parent.parent!.withConverter<FjiChat>(
        fromFirestore: ChatCollectionReference.fromFirestore,
        toFirestore: ChatCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<FjiMessageDocumentSnapshot> snapshots() {
    return reference.snapshots().map(FjiMessageDocumentSnapshot._);
  }

  @override
  Future<FjiMessageDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(FjiMessageDocumentSnapshot._);
  }

  @override
  Future<FjiMessageDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(FjiMessageDocumentSnapshot._);
  }

  Future<void> update({
    Object? timestamp = _sentinel,
    FieldValue? timestampFieldValue,
    Object? author = _sentinel,
    FieldValue? authorFieldValue,
    Object? text = _sentinel,
    FieldValue? textFieldValue,
  }) async {
    assert(
      timestamp == _sentinel || timestampFieldValue == null,
      "Cannot specify both timestamp and timestampFieldValue",
    );
    assert(
      author == _sentinel || authorFieldValue == null,
      "Cannot specify both author and authorFieldValue",
    );
    assert(
      text == _sentinel || textFieldValue == null,
      "Cannot specify both text and textFieldValue",
    );
    final json = {
      if (timestamp != _sentinel)
        _$FjiMessageFieldMap['timestamp']!:
            _$FjiMessagePerFieldToJson.timestamp(timestamp as DateTime),
      if (timestampFieldValue != null)
        _$FjiMessageFieldMap['timestamp']!: timestampFieldValue,
      if (author != _sentinel)
        _$FjiMessageFieldMap['author']!:
            _$FjiMessagePerFieldToJson.author(author as String),
      if (authorFieldValue != null)
        _$FjiMessageFieldMap['author']!: authorFieldValue,
      if (text != _sentinel)
        _$FjiMessageFieldMap['text']!:
            _$FjiMessagePerFieldToJson.text(text as String),
      if (textFieldValue != null) _$FjiMessageFieldMap['text']!: textFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? timestamp = _sentinel,
    FieldValue? timestampFieldValue,
    Object? author = _sentinel,
    FieldValue? authorFieldValue,
    Object? text = _sentinel,
    FieldValue? textFieldValue,
  }) {
    assert(
      timestamp == _sentinel || timestampFieldValue == null,
      "Cannot specify both timestamp and timestampFieldValue",
    );
    assert(
      author == _sentinel || authorFieldValue == null,
      "Cannot specify both author and authorFieldValue",
    );
    assert(
      text == _sentinel || textFieldValue == null,
      "Cannot specify both text and textFieldValue",
    );
    final json = {
      if (timestamp != _sentinel)
        _$FjiMessageFieldMap['timestamp']!:
            _$FjiMessagePerFieldToJson.timestamp(timestamp as DateTime),
      if (timestampFieldValue != null)
        _$FjiMessageFieldMap['timestamp']!: timestampFieldValue,
      if (author != _sentinel)
        _$FjiMessageFieldMap['author']!:
            _$FjiMessagePerFieldToJson.author(author as String),
      if (authorFieldValue != null)
        _$FjiMessageFieldMap['author']!: authorFieldValue,
      if (text != _sentinel)
        _$FjiMessageFieldMap['text']!:
            _$FjiMessagePerFieldToJson.text(text as String),
      if (textFieldValue != null) _$FjiMessageFieldMap['text']!: textFieldValue,
    };

    transaction.update(reference, json);
  }

  void batchUpdate(
    WriteBatch batch, {
    Object? timestamp = _sentinel,
    FieldValue? timestampFieldValue,
    Object? author = _sentinel,
    FieldValue? authorFieldValue,
    Object? text = _sentinel,
    FieldValue? textFieldValue,
  }) {
    assert(
      timestamp == _sentinel || timestampFieldValue == null,
      "Cannot specify both timestamp and timestampFieldValue",
    );
    assert(
      author == _sentinel || authorFieldValue == null,
      "Cannot specify both author and authorFieldValue",
    );
    assert(
      text == _sentinel || textFieldValue == null,
      "Cannot specify both text and textFieldValue",
    );
    final json = {
      if (timestamp != _sentinel)
        _$FjiMessageFieldMap['timestamp']!:
            _$FjiMessagePerFieldToJson.timestamp(timestamp as DateTime),
      if (timestampFieldValue != null)
        _$FjiMessageFieldMap['timestamp']!: timestampFieldValue,
      if (author != _sentinel)
        _$FjiMessageFieldMap['author']!:
            _$FjiMessagePerFieldToJson.author(author as String),
      if (authorFieldValue != null)
        _$FjiMessageFieldMap['author']!: authorFieldValue,
      if (text != _sentinel)
        _$FjiMessageFieldMap['text']!:
            _$FjiMessagePerFieldToJson.text(text as String),
      if (textFieldValue != null) _$FjiMessageFieldMap['text']!: textFieldValue,
    };

    batch.update(reference, json);
  }

  @override
  bool operator ==(Object other) {
    return other is FjiMessageDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

abstract class FjiMessageQuery
    implements QueryReference<FjiMessage, FjiMessageQuerySnapshot> {
  @override
  FjiMessageQuery limit(int limit);

  @override
  FjiMessageQuery limitToLast(int limit);

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  FjiMessageQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  FjiMessageQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  FjiMessageQuery whereTimestamp({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
    bool? isNull,
  });

  FjiMessageQuery whereAuthor({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  FjiMessageQuery whereText({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  });

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  FjiMessageQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object startAt,
    Object startAfter,
    Object endAt,
    Object endBefore,
    FjiMessageDocumentSnapshot? startAtDocument,
    FjiMessageDocumentSnapshot? endAtDocument,
    FjiMessageDocumentSnapshot? endBeforeDocument,
    FjiMessageDocumentSnapshot? startAfterDocument,
  });

  FjiMessageQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    FjiMessageDocumentSnapshot? startAtDocument,
    FjiMessageDocumentSnapshot? endAtDocument,
    FjiMessageDocumentSnapshot? endBeforeDocument,
    FjiMessageDocumentSnapshot? startAfterDocument,
  });

  FjiMessageQuery orderByTimestamp({
    bool descending = false,
    DateTime startAt,
    DateTime startAfter,
    DateTime endAt,
    DateTime endBefore,
    FjiMessageDocumentSnapshot? startAtDocument,
    FjiMessageDocumentSnapshot? endAtDocument,
    FjiMessageDocumentSnapshot? endBeforeDocument,
    FjiMessageDocumentSnapshot? startAfterDocument,
  });

  FjiMessageQuery orderByAuthor({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    FjiMessageDocumentSnapshot? startAtDocument,
    FjiMessageDocumentSnapshot? endAtDocument,
    FjiMessageDocumentSnapshot? endBeforeDocument,
    FjiMessageDocumentSnapshot? startAfterDocument,
  });

  FjiMessageQuery orderByText({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    FjiMessageDocumentSnapshot? startAtDocument,
    FjiMessageDocumentSnapshot? endAtDocument,
    FjiMessageDocumentSnapshot? endBeforeDocument,
    FjiMessageDocumentSnapshot? startAfterDocument,
  });
}

class _$FjiMessageQuery
    extends QueryReference<FjiMessage, FjiMessageQuerySnapshot>
    implements FjiMessageQuery {
  _$FjiMessageQuery(
    this._collection, {
    required Query<FjiMessage> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<FjiMessageQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(FjiMessageQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<FjiMessageQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(FjiMessageQuerySnapshot._fromQuerySnapshot);
  }

  @override
  FjiMessageQuery limit(int limit) {
    return _$FjiMessageQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  FjiMessageQuery limitToLast(int limit) {
    return _$FjiMessageQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  FjiMessageQuery whereFieldPath(
    Object fieldPath, {
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$FjiMessageQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        fieldPath,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  FjiMessageQuery whereDocumentId({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$FjiMessageQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo != _sentinel ? isEqualTo : null,
        isNotEqualTo: isNotEqualTo != _sentinel ? isNotEqualTo : null,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  FjiMessageQuery whereTimestamp({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<DateTime>? whereIn,
    List<DateTime>? whereNotIn,
    bool? isNull,
  }) {
    return _$FjiMessageQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$FjiMessageFieldMap['timestamp']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$FjiMessagePerFieldToJson.timestamp(isEqualTo as DateTime)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$FjiMessagePerFieldToJson.timestamp(isNotEqualTo as DateTime)
            : null,
        isLessThan: isLessThan != null
            ? _$FjiMessagePerFieldToJson.timestamp(isLessThan as DateTime)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$FjiMessagePerFieldToJson
                .timestamp(isLessThanOrEqualTo as DateTime)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$FjiMessagePerFieldToJson.timestamp(isGreaterThan as DateTime)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$FjiMessagePerFieldToJson
                .timestamp(isGreaterThanOrEqualTo as DateTime)
            : null,
        whereIn: whereIn?.map((e) => _$FjiMessagePerFieldToJson.timestamp(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$FjiMessagePerFieldToJson.timestamp(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  FjiMessageQuery whereAuthor({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$FjiMessageQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$FjiMessageFieldMap['author']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$FjiMessagePerFieldToJson.author(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$FjiMessagePerFieldToJson.author(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$FjiMessagePerFieldToJson.author(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$FjiMessagePerFieldToJson.author(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$FjiMessagePerFieldToJson.author(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$FjiMessagePerFieldToJson
                .author(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$FjiMessagePerFieldToJson.author(e)),
        whereNotIn:
            whereNotIn?.map((e) => _$FjiMessagePerFieldToJson.author(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  FjiMessageQuery whereText({
    Object? isEqualTo = _sentinel,
    Object? isNotEqualTo = _sentinel,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    List<String>? whereIn,
    List<String>? whereNotIn,
    bool? isNull,
  }) {
    return _$FjiMessageQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$FjiMessageFieldMap['text']!,
        isEqualTo: isEqualTo != _sentinel
            ? _$FjiMessagePerFieldToJson.text(isEqualTo as String)
            : null,
        isNotEqualTo: isNotEqualTo != _sentinel
            ? _$FjiMessagePerFieldToJson.text(isNotEqualTo as String)
            : null,
        isLessThan: isLessThan != null
            ? _$FjiMessagePerFieldToJson.text(isLessThan as String)
            : null,
        isLessThanOrEqualTo: isLessThanOrEqualTo != null
            ? _$FjiMessagePerFieldToJson.text(isLessThanOrEqualTo as String)
            : null,
        isGreaterThan: isGreaterThan != null
            ? _$FjiMessagePerFieldToJson.text(isGreaterThan as String)
            : null,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo != null
            ? _$FjiMessagePerFieldToJson.text(isGreaterThanOrEqualTo as String)
            : null,
        whereIn: whereIn?.map((e) => _$FjiMessagePerFieldToJson.text(e)),
        whereNotIn: whereNotIn?.map((e) => _$FjiMessagePerFieldToJson.text(e)),
        isNull: isNull ??
            (isEqualTo == null ? false : null) ??
            (isNotEqualTo == null ? true : null),
      ),
      $queryCursor: $queryCursor,
    );
  }

  @override
  FjiMessageQuery orderByFieldPath(
    Object fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FjiMessageDocumentSnapshot? startAtDocument,
    FjiMessageDocumentSnapshot? endAtDocument,
    FjiMessageDocumentSnapshot? endBeforeDocument,
    FjiMessageDocumentSnapshot? startAfterDocument,
  }) {
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$FjiMessageQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  FjiMessageQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FjiMessageDocumentSnapshot? startAtDocument,
    FjiMessageDocumentSnapshot? endAtDocument,
    FjiMessageDocumentSnapshot? endBeforeDocument,
    FjiMessageDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$FjiMessageQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  FjiMessageQuery orderByTimestamp({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FjiMessageDocumentSnapshot? startAtDocument,
    FjiMessageDocumentSnapshot? endAtDocument,
    FjiMessageDocumentSnapshot? endBeforeDocument,
    FjiMessageDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$FjiMessageFieldMap['timestamp']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$FjiMessageQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  FjiMessageQuery orderByAuthor({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FjiMessageDocumentSnapshot? startAtDocument,
    FjiMessageDocumentSnapshot? endAtDocument,
    FjiMessageDocumentSnapshot? endBeforeDocument,
    FjiMessageDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor
        .orderBy(_$FjiMessageFieldMap['author']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$FjiMessageQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  FjiMessageQuery orderByText({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    FjiMessageDocumentSnapshot? startAtDocument,
    FjiMessageDocumentSnapshot? endAtDocument,
    FjiMessageDocumentSnapshot? endBeforeDocument,
    FjiMessageDocumentSnapshot? startAfterDocument,
  }) {
    final query = $referenceWithoutCursor.orderBy(_$FjiMessageFieldMap['text']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$FjiMessageQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
  }

  @override
  bool operator ==(Object other) {
    return other is _$FjiMessageQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class FjiMessageDocumentSnapshot extends FirestoreDocumentSnapshot<FjiMessage> {
  FjiMessageDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final DocumentSnapshot<FjiMessage> snapshot;

  @override
  FjiMessageDocumentReference get reference {
    return FjiMessageDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final FjiMessage? data;
}

class FjiMessageQuerySnapshot extends FirestoreQuerySnapshot<FjiMessage,
    FjiMessageQueryDocumentSnapshot> {
  FjiMessageQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory FjiMessageQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<FjiMessage> snapshot,
  ) {
    final docs = snapshot.docs.map(FjiMessageQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        FjiMessageDocumentSnapshot._,
      );
    }).toList();

    return FjiMessageQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<FjiMessageDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    FjiMessageDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<FjiMessageDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<FjiMessage> snapshot;

  @override
  final List<FjiMessageQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<FjiMessageDocumentSnapshot>> docChanges;
}

class FjiMessageQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<FjiMessage>
    implements FjiMessageDocumentSnapshot {
  FjiMessageQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<FjiMessage> snapshot;

  @override
  final FjiMessage data;

  @override
  FjiMessageDocumentReference get reference {
    return FjiMessageDocumentReference(snapshot.reference);
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FjiUser _$FjiUserFromJson(Map<String, dynamic> json) => FjiUser(
      displayName: json['displayName'] as String?,
      profileImage: json['profileImage'] as String?,
      fcmTokens: (json['fcmTokens'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toSet() ??
          const {},
    );

const _$FjiUserFieldMap = <String, String>{
  'displayName': 'displayName',
  'profileImage': 'profileImage',
  'fcmTokens': 'fcmTokens',
};

// ignore: unused_element
abstract class _$FjiUserPerFieldToJson {
  // ignore: unused_element
  static Object? displayName(String? instance) => instance;
  // ignore: unused_element
  static Object? profileImage(String? instance) => instance;
  // ignore: unused_element
  static Object? fcmTokens(Set<String> instance) => instance.toList();
}

Map<String, dynamic> _$FjiUserToJson(FjiUser instance) => <String, dynamic>{
      'displayName': instance.displayName,
      'profileImage': instance.profileImage,
      'fcmTokens': instance.fcmTokens.toList(),
    };

FjiChat _$FjiChatFromJson(Map<String, dynamic> json) => FjiChat(
      id: json['id'] as String,
      participants: (json['participants'] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
      lastMessage: json['lastMessage'] as String?,
      lastMessageTime: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['lastMessageTime'], const FirestoreDateTimeConverter().fromJson),
    );

const _$FjiChatFieldMap = <String, String>{
  'participants': 'participants',
  'lastMessage': 'lastMessage',
  'lastMessageTime': 'lastMessageTime',
  'id': 'id',
};

// ignore: unused_element
abstract class _$FjiChatPerFieldToJson {
  // ignore: unused_element
  static Object? participants(Set<String> instance) => instance.toList();
  // ignore: unused_element
  static Object? lastMessage(String? instance) => instance;
  // ignore: unused_element
  static Object? lastMessageTime(DateTime? instance) =>
      _$JsonConverterToJson<Timestamp, DateTime>(
          instance, const FirestoreDateTimeConverter().toJson);
  // ignore: unused_element
  static Object? id(String instance) => instance;
}

Map<String, dynamic> _$FjiChatToJson(FjiChat instance) => <String, dynamic>{
      'participants': instance.participants.toList(),
      'lastMessage': instance.lastMessage,
      'lastMessageTime': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.lastMessageTime, const FirestoreDateTimeConverter().toJson),
      'id': instance.id,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

FjiMessage _$FjiMessageFromJson(Map<String, dynamic> json) => FjiMessage(
      timestamp: const FirestoreDateTimeConverter()
          .fromJson(json['timestamp'] as Timestamp),
      author: json['author'] as String,
      text: json['text'] as String,
    );

const _$FjiMessageFieldMap = <String, String>{
  'timestamp': 'timestamp',
  'author': 'author',
  'text': 'text',
};

// ignore: unused_element
abstract class _$FjiMessagePerFieldToJson {
  // ignore: unused_element
  static Object? timestamp(DateTime instance) =>
      const FirestoreDateTimeConverter().toJson(instance);
  // ignore: unused_element
  static Object? author(String instance) => instance;
  // ignore: unused_element
  static Object? text(String instance) => instance;
}

Map<String, dynamic> _$FjiMessageToJson(FjiMessage instance) =>
    <String, dynamic>{
      'timestamp':
          const FirestoreDateTimeConverter().toJson(instance.timestamp),
      'author': instance.author,
      'text': instance.text,
    };
