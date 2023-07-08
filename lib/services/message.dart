import 'package:v_app/models/model.dart';
import '../configs/config.dart';

class MessageService {
  List<Message> messages = [
    Message(
      id: "2u8239f432cfuyfi238sdfsd4249",
      message:
          "They may add new features to the ref object or change slightly how the provider is consumed. Modifiers can be used on all providers, with a syntax similar to named constructor",
      messageType: 'text',
      sender: receiverId,
      receiver: senderId,
    ),
    Message(
      id: "2u8239f432cfuyfi238sdfsd4249",
      message: 'I am good nad you',
      messageType: 'text',
      sender: receiverId,
      receiver: senderId,
    ),
    Message(
      id: "2u8239f432cfuyfi238sdfsd4249",
      message: 'Hehehe',
      messageType: 'text',
      sender: senderId,
      receiver: receiverId,
    ),
    Message(
      id: "2u8239f432cfuyfi238sdfsd4249",
      message: 'How are you today?',
      messageType: 'text',
      sender: senderId,
      receiver: receiverId,
    ),
    Message(
      id: "2u8239f432cfuyfi238sdfsd4249",
      message: 'Hello',
      messageType: 'text',
      sender: senderId,
      receiver: receiverId,
    ),
  ];
  List<Message> getMessages() {
    return messages;
  }

  bool sendMessage(String message) {
    List<Message> newMessages = [
      Message(
        id: "2u823sdfsdf9432cfuyfi2384249",
        message: message,
        messageType: 'text',
        sender: senderId,
        receiver: receiverId,
      ),
      Message(
        id: "2u823sdfsdf9432cfuyfi2384249ff",
        message: message,
        messageType: 'text',
        sender: receiverId,
        receiver: senderId,
      ),
    ];
    messages.addAll(newMessages);
    return true;
  }
}
