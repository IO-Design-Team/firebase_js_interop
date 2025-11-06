import 'package:meta/meta.dart';

@immutable
class FjiUser {
  final String? displayName;
  final String? profileImage;
  final Set<String> fcmTokens;

  const FjiUser({
    this.displayName,
    this.profileImage,
    this.fcmTokens = const {},
  });
}

@immutable
class FjiChat {
  final Set<String> participants;
  final String? lastMessage;
  final DateTime? lastMessageTime;

  const FjiChat({
    required this.participants,
    this.lastMessage,
    this.lastMessageTime,
  });
}

@immutable
class FjiMessage {
  final DateTime timestamp;
  final String author;
  final String text;

  FjiMessage({
    DateTime? timestamp,
    required this.author,
    required this.text,
  }) : timestamp = timestamp ?? DateTime.timestamp();
}
