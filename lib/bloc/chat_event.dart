import 'package:bloc_chat_app_demo/models/chat_message.dart';

abstract class ChatEvent {}

class SendMessage extends ChatEvent {
  final ChatMessage message;

  SendMessage(this.message);
}
