import 'package:flutter/material.dart';


import '../../config/helpers/get_yes_no_answer.dart';
import '../../domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messagesList = [];

  Future<void> sendMessage(String text) async {
    //valida mensaje vacio
    if (text.isEmpty) return;
    final newMessage = Message(text: text.trim(), fromWho: FromWho.me);
    messagesList.add(newMessage);

    if (text.endsWith('?')) {
      herReply();
    }
    //actualiza las notifiaciones donde se implementa el chatProvider
    notifyListeners();
    //actualiza los mensajes dejandolos en el ultimo mensaje
    moveScrollToBottom();
  }

  void moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 300));

    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    messagesList.add(herMessage);

    notifyListeners();
    moveScrollToBottom();
  }
}
