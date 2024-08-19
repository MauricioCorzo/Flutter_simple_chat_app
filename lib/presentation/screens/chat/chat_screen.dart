import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pupi 😍'),
        titleSpacing: 0,
        // centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://mir-s3-cdn-cf.behance.net/user/276/9d1c49953374559.632b8cb497f13.jpg"),
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      body: const ChatView(),
    );
  }
}

//no hace falta el super.key porque es un Widget privado
class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    // Evita las barras del dispositivo y que no se extienda mas alla de estos
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                reverse:
                    true, // hack para que los elementos suban cuando aprece el keyboard
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.messagesList.length,
                itemBuilder: (context, index) {
                  index = (index + 1 - chatProvider.messagesList.length)
                      .abs(); // hack para que los elementos suban cuando aprece el keyboard
                  final message = chatProvider.messagesList[index];

                  return (message.fromWho == FromWho.her)
                      ? HerMessageBubble(
                          message: message,
                        )
                      : MyMessageBubble(message: message);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
              child: new MessageFieldBox(
                onValue: (value) => chatProvider.sendMessage(value),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
