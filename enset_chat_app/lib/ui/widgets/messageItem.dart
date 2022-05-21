import 'package:enset_chat_app/models/contacr_model.dart';
import 'package:enset_chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  Message message;
  Contact currentContact;
  MessageItem({required this.message, required this.currentContact});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(
            "You",
            style:
                TextStyle(color: Colors.black12, fontWeight: FontWeight.bold),
          ),
          Text(message.content ?? "No content"),
          SizedBox(
            height: 10,
          ),
          Text(message.dateTime!.toIso8601String().toString()),
        ],
      ),
    );
  }
}
