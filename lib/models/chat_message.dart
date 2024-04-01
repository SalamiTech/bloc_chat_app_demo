class ChatMessage {
  final String id;
  final String message;
  final DateTime timestamp;

  ChatMessage(
      {required this.id, required this.message, required this.timestamp});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'message': message,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  static ChatMessage fromMap(Map<String, dynamic> map) {
    return ChatMessage(
      id: map['id'],
      message: map['message'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }
}
