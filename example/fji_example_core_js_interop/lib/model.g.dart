// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: document_ignores, require_trailing_commas

part of 'model.dart';

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

Map<String, dynamic> _$FjiUserToJson(FjiUser instance) => <String, dynamic>{
      'displayName': instance.displayName,
      'profileImage': instance.profileImage,
      'fcmTokens': instance.fcmTokens.toList(),
    };

FjiChat _$FjiChatFromJson(Map<String, dynamic> json) => FjiChat(
      participants: (json['participants'] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
      lastMessage: json['lastMessage'] as String?,
      lastMessageTime: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['lastMessageTime'], const FirestoreDateTimeConverter().fromJson),
    );

Map<String, dynamic> _$FjiChatToJson(FjiChat instance) => <String, dynamic>{
      'participants': instance.participants.toList(),
      'lastMessage': instance.lastMessage,
      'lastMessageTime': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.lastMessageTime, const FirestoreDateTimeConverter().toJson),
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

Map<String, dynamic> _$FjiMessageToJson(FjiMessage instance) =>
    <String, dynamic>{
      'timestamp':
          const FirestoreDateTimeConverter().toJson(instance.timestamp),
      'author': instance.author,
      'text': instance.text,
    };
