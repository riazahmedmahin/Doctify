// lib/features/inbox/presentation/pages/inbox_page.dart

import 'package:flutter/material.dart';

import 'controller.dart';
import 'messageitem.dart';
import 'model.dart';

class InboxPage extends StatelessWidget {
  final InboxController controller = InboxController();

  @override
  Widget build(BuildContext context) {
    final List<MessageModel> messages = controller.getMessages();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 224, 235, 251),
      appBar: AppBar(
        title: Text("Messsage"),
        backgroundColor: Color.fromARGB(255, 224, 235, 251),
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 8, bottom: 5, right: 8),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.menu_open,
              size: 20,
            ),
          ),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(8.0),
        itemCount: messages.length,
        separatorBuilder: (context, index) => Divider(height: 1),
        itemBuilder: (context, index) {
          return MessageItem(message: messages[index]);
        },
      ),
    );
  }
}
