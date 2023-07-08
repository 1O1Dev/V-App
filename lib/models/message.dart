class Message {
  String id;
  String message;
  String messageType;
  // final User sender;
  // final User receiver;
  String sender;
  String receiver;
  Message({
    required this.id,
    required this.message,
    required this.messageType,
    required this.sender,
    required this.receiver,
  });
}
