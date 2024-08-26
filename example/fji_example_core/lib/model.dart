class FjiUser {
  final String? displayName;
  final String? profileImage;
  final Set<String> fcmTokens;

  FjiUser({
    this.displayName,
    this.profileImage,
    this.fcmTokens = const {},
  });
}

class FjiChat {
  final Set<String> participants;
  final String? lastMessage;
  final DateTime? lastMessageTime;

  FjiChat({
    required this.participants,
    this.lastMessage,
    this.lastMessageTime,
  });
}

class FjiMessage {
  final DateTime timestamp;
  final String author;
  final String text;

  FjiMessage({
    required this.timestamp,
    required this.author,
    required this.text,
  });
}
