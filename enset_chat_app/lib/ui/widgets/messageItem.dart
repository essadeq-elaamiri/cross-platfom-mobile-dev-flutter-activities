import 'package:enset_chat_app/models/contacr_model.dart';
import 'package:enset_chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  Message message;
  Contact currentContact;
  MessageItem({required this.message, required this.currentContact});

  @override
  Widget build(BuildContext context) {
    var messageBackgroundColor = message.sourceContactId == currentContact
        ? Color.fromARGB(255, 187, 255, 227)
        : Color.fromARGB(255, 196, 217, 255);
    var margin = message.sourceContactId == currentContact
        ? EdgeInsets.only(left: 15.0, right: 40.0, bottom: 50.0, top: 20.0)
        : EdgeInsets.only(left: 40.0, right: 15.0, bottom: 50.0, top: 20.0);
    return Card(
      color: messageBackgroundColor,
      margin: margin,
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
          Align(
            child: Text(message.content ?? "No content"),
            alignment: Alignment.centerLeft,
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            child: Text(
              message.dateTime.toString(),
              style: TextStyle(color: Colors.black12, fontSize: 14),
            ),
            alignment: Alignment.bottomRight,
          ),
        ],
      ),
    );
  }
}
