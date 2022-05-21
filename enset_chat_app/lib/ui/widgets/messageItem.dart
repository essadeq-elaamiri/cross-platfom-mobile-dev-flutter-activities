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
      margin: EdgeInsets.all(15.0),
      child: Column(
        children: [
          Align(
            child: Text(
              currentContact.name!,
              style:
                  TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
            ),
            alignment: Alignment.centerLeft,
          ),
          SizedBox(height: 12),
          Text(message.content ?? "No content"),
          SizedBox(
            height: 10,
          ),
          Align(x),
        ],
      ),
    );
  }
}
