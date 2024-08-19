import 'package:flutter/material.dart'
    show ChangeNotifier, ScrollController, Curves;
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart' show Message, FromWho;

class ChatProvider extends ChangeNotifier {
  // Vinculado a ListView a travez del context (chatProvider.chatScrollController)
  final ScrollController chatScrollController = new ScrollController();

  final getYesOrNoAnswer = GetYesNoAnswer();

  List<Message> messagesList = [
    Message(text: 'Hola amor!', fromWho: FromWho.me),
    Message(text: 'Te extrañé mucho', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);

    messagesList.add(newMessage);

    // Avisa a los que escuchan el provider para el rerender
    notifyListeners();

    if (text.endsWith("?")) {
      herReplyMessage();
    }
    moveScrollToBottom();
  }

  Future<void> herReplyMessage() async {
    final herMeesage = await getYesOrNoAnswer.getAnswer();

    messagesList.add(herMeesage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(microseconds: 100));
    chatScrollController.animateTo(
        chatScrollController
            .initialScrollOffset, // que vaya al maximo que el scroll pueda llegar (abajo de todo). Esta al revez por el hack de hacer el scroll cuando aparece el keyboard
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
