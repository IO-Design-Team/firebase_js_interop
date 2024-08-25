import 'package:json_annotation/json_annotation.dart';
import 'package:firebase_js_interop/admin.dart';
import 'package:firebase_js_interop/js.dart';

/// A [JsonSerializable] annotation that adds support for Firestore types
/// in a JS interop context
const firestoreJsInteropSerializable =
    JsonSerializable(converters: firestoreJsInteropJsonConverters);

/// The list of [JsonConverter]s that adds support for Firestore types
///
/// Exposed for creating custom [JsonSerializable] annotations
const List<JsonConverter<Object?, Object?>> firestoreJsInteropJsonConverters = [
  FirestoreDateTimeConverter(),
];

/// A [JsonConverter] that adds support for [DateTime] objects within ODM models.
class FirestoreDateTimeConverter extends JsonConverter<DateTime, Timestamp> {
  /// Constructor
  const FirestoreDateTimeConverter();

  @override
  DateTime fromJson(Timestamp json) => json.toDate().toDateTime();

  @override
  Timestamp toJson(DateTime object) =>
      Timestamp.fromDate(Date.fromDateTime(object));
}

// TODO: Converters for GeoPoint and Blob
