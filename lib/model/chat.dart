/// Chat data model class
class Chat {
  /// The date the chat message is created at / posted at
  final DateTime createdAt;

  /// The actual chat text message
  final String text;

  /// The sender of the chat message
  final String sender;

  /// Constructor
  Chat({
    required this.createdAt,
    required this.text,
    required this.sender,
  });
}
