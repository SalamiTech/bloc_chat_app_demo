import 'package:bloc_chat_app_demo/bloc/chat_event.dart';
import 'package:bloc_chat_app_demo/bloc/chat_state.dart';
import 'package:bloc_chat_app_demo/models/chat_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/chat_bloc.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Chat App"),
        titleTextStyle: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                return ListView.builder(
                  itemCount: state.messages.length,
                  itemBuilder: (_, index) => ListTile(
                    title: Text(state.messages[index].message),
                    subtitle: Text(state.messages[index].timestamp.toString()),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    autofocus: true,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(15),
                      hintText: 'Send a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(14),
                        ),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(14),
                        ),
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    final message = ChatMessage(
                      id: UniqueKey().toString(),
                      message: textController.text,
                      timestamp: DateTime.now(),
                    );
                    context.read<ChatBloc>().add(SendMessage(message));
                    textController.clear();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
