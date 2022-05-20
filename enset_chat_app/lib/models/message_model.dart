import 'package:enset_chat_app/models/contacr_model.dart';

class Message {
  int? id;
  String? content;
  DateTime? dateTime;
  int? sourceContactId;
  int? destinationContactId;

  Message(
      {required this.id,
      required this.content,
      required this.dateTime,
      required this.sourceContactId,
      required this.destinationContactId});

  Message.fromJson(Map<String, dynamic?> json) {
    this.id = json['id'];
    this.content = json['content'];
    this.dateTime = DateTime.fromMillisecondsSinceEpoch(json['dateTime']);
    this.sourceContactId = json['sourceContactId'];
    this.destinationContactId = json['destinationContactId'];
  }
}
