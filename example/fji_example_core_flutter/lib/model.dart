import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:fji_example_core/model.dart' as core;
import 'package:json_annotation/json_annotation.dart';

part 'model.g.dart';

const firestoreSerializable = JsonSerializable(
  converters: firestoreJsonConverters,
  createFieldMap: true,
  createPerFieldToJson: true,
);

@firestoreSerializable
class FjiUser extends core.FjiUser {
  FjiUser({
    super.displayName,
    super.profileImage,
    super.fcmTokens,
  });
}

@firestoreSerializable
class FjiChat extends core.FjiChat {
  @Id()
  final String id;

  FjiChat({
    required this.id,
    required super.participants,
    super.lastMessage,
    super.lastMessageTime,
  });
}

@firestoreSerializable
class FjiMessage extends core.FjiMessage {
  FjiMessage({
    required super.timestamp,
    required super.author,
    required super.text,
  });
}

@Collection<FjiUser>('users', prefix: 'User')
final usersRef = UserCollectionReference();

@Collection<FjiChat>('chats', prefix: 'Chat')
@Collection<FjiMessage>('chats/*/messages')
final chatsRef = ChatCollectionReference();
