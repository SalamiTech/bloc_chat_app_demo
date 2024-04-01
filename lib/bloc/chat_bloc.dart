import 'package:bloc_chat_app_demo/models/chat_message.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final _messagesSubject = BehaviorSubject<List<ChatMessage>>.seeded([]);

  ChatBloc() : super(ChatState()) {
    on<SendMessage>(_onSendMessage);

    // Listen to the messages subject to emit new states
    _messagesSubject.listen((messages) {
      emit(ChatState(messages: messages));
    });
  }

  void _onSendMessage(SendMessage event, Emitter<ChatState> emit) {
    final newMessages = List<ChatMessage>.from(state.messages)
      ..add(event.message);
    _messagesSubject.add(newMessages);
  }

  @override
  Future<void> close() {
    _messagesSubject.close();
    return super.close();
  }
}
