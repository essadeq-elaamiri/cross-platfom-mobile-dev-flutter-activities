import 'package:enset_chat_app/main.dart';
import 'package:enset_chat_app/models/contacr_model.dart';
import 'package:enset_chat_app/models/message_model.dart';
import 'package:flutter/material.dart';

class MessageItem extends StatelessWidget {
  Message message;
  Contact currentContact;
  MessageItem({required this.message, required this.currentContact});

  @override
  Widget build(BuildContext context) {
    var messageBackgroundColor = message.sourceContactId == MyApp.userContact.id
        ? Color.fromARGB(255, 187, 255, 227)
        : Color.fromARGB(255, 196, 217, 255);
    var margin = message.sourceContactId == MyApp.userContact.id
        ? EdgeInsets.only(left: 5.0, right: 40.0, bottom: 10.0, top: 10.0)
        : EdgeInsets.only(left: 40.0, right: 5.0, bottom: 10.0, top: 10.0);
    return Card(
      color: messageBackgroundColor,
      margin: margin,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Align(
              child: Text(
                currentContact.name!,
                style: TextStyle(
                    color: Colors.orange, fontWeight: FontWeight.bold),
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
                style: TextStyle(
                    color: Color.fromARGB(176, 19, 17, 17), fontSize: 14),
              ),
              alignment: Alignment.bottomRight,
            ),
          ],
        ),
      ),
    );
  }
}
