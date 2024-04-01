import 'package:bloc_chat_app_demo/models/chat_message.dart';

class ChatState {
  final List<ChatMessage> messages;

  ChatState({this.messages = const []});
}
