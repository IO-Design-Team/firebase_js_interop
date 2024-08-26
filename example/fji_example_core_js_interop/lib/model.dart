import 'package:firebase_js_interop/converters.dart';
import 'package:fji_example_core/model.dart' as core;
import 'package:firebase_js_interop/admin.dart';

part 'model.g.dart';

@firestoreJsInteropSerializable
class FjiUser extends core.FjiUser {
  FjiUser({
    super.displayName,
    super.profileImage,
    super.fcmTokens,
  });

  Map<String, dynamic> toJson() => _$FjiUserToJson(this);
  factory FjiUser.fromJson(Map<String, dynamic> json) =>
      _$FjiUserFromJson(json);
}

@firestoreJsInteropSerializable
class FjiChat extends core.FjiChat {
  FjiChat({
    required super.participants,
    super.lastMessage,
    super.lastMessageTime,
  });

  Map<String, dynamic> toJson() => _$FjiChatToJson(this);
  factory FjiChat.fromJson(Map<String, dynamic> json) =>
      _$FjiChatFromJson(json);
}

@firestoreJsInteropSerializable
class FjiMessage extends core.FjiMessage {
  FjiMessage({
    required super.timestamp,
    required super.author,
    required super.text,
  });

  Map<String, dynamic> toJson() => _$FjiMessageToJson(this);
  factory FjiMessage.fromJson(Map<String, dynamic> json) =>
      _$FjiMessageFromJson(json);
}
