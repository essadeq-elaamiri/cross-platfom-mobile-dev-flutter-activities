import 'dart:convert';

import 'package:enset_chat_app/models/message_model.dart';

class MessageRepository {
  // getAll messages
  Future<List<Message>> getAllMessages() async {
    return await loadData(messagesData);
  }

  // getMessages send by a contact
  Future<List<Message>> getMessagesBySender(int senderId) async {
    return (await loadData(messagesData))
        .where((message) => message.sourceContactId == senderId)
        .toList();
  }

  // get Messages recieved by a contact
  Future<List<Message>> getMessagesByReciever(int recieverId) async {
    return (await loadData(messagesData))
        .where((message) => message.destinationContactId == recieverId)
        .toList();
  }

  // get Message send
  Future<List<Message>> getMessage(int senderId, int recieverId) async {
    if (senderId == recieverId)
      throw Exception("Sender and Reciever can not be the same!");

    return (await loadData(messagesData))
        .where((message) =>
            message.sourceContactId == senderId &&
            message.destinationContactId == recieverId)
        .toList();
  }

  // load data
  Future<List<Message>> loadData(String jsonString) async {
    List<Message> messagesList = [];
    var jsonData = json.decode(jsonString);
    jsonData.forEach((contactString) {
      messagesList.add(Message.fromJson(contactString));
    });

    return messagesList;
  }

  String messagesData = '''
[{
  "id": 1,
  "content": "libero ut massa volutpat convallis morbi odio odio elementum",
  "dateTime": 163000300950919,
  "sourceContactId": 3,
  "destinationContactId": 11
}, {
  "id": 2,
  "content": "faucibus orci luctus et ultrices posuere cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat dui nec",
  "dateTime": 158929593886156,
  "sourceContactId": 9,
  "destinationContactId": 11
}, {
  "id": 3,
  "content": "nulla facilisi cras non velit nec nisi vulputate",
  "dateTime": 138702817250993,
  "sourceContactId": 8,
  "destinationContactId": 10
}, {
  "id": 4,
  "content": "quis augue luctus tincidunt nulla mollis molestie lorem quisque ut",
  "dateTime": 152018307658374,
  "sourceContactId": 7,
  "destinationContactId": 12
}, {
  "id": 5,
  "content": "pede malesuada in imperdiet",
  "dateTime": 122236443708730,
  "sourceContactId": 13,
  "destinationContactId": 11
}, {
  "id": 6,
  "content": "erat eros viverra eget congue eget semper rutrum nulla nunc purus phasellus in felis donec semper sapien a libero nam",
  "dateTime": 15524055706183,
  "sourceContactId": 7,
  "destinationContactId": 10
}, {
  "id": 7,
  "content": "iaculis justo in hac habitasse platea dictumst etiam faucibus cursus urna ut tellus nulla ut",
  "dateTime": 10314574822701,
  "sourceContactId": 12,
  "destinationContactId": 8
}, {
  "id": 8,
  "content": "mattis pulvinar nulla pede ullamcorper augue",
  "dateTime": 75203287958809,
  "sourceContactId": 6,
  "destinationContactId": 3
}, {
  "id": 9,
  "content": "non sodales sed tincidunt eu felis fusce posuere felis sed lacus morbi sem mauris laoreet ut rhoncus aliquet pulvinar sed",
  "dateTime": 151558883546454,
  "sourceContactId": 6,
  "destinationContactId": 11
}, {
  "id": 10,
  "content": "ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec",
  "dateTime": 63352348461882,
  "sourceContactId": 8,
  "destinationContactId": 2
}, {
  "id": 11,
  "content": "pede lobortis ligula sit amet eleifend pede libero quis orci nullam",
  "dateTime": 153005695775381,
  "sourceContactId": 2,
  "destinationContactId": 5
}, {
  "id": 12,
  "content": "proin risus praesent lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis",
  "dateTime": 8049649602438,
  "sourceContactId": 6,
  "destinationContactId": 4
}, {
  "id": 13,
  "content": "cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est",
  "dateTime": 147301212768426,
  "sourceContactId": 9,
  "destinationContactId": 7
}, {
  "id": 14,
  "content": "fusce lacus purus aliquet at feugiat non pretium quis lectus suspendisse potenti in eleifend quam a odio in hac",
  "dateTime": 40509123980709,
  "sourceContactId": 8,
  "destinationContactId": 13
}, {
  "id": 15,
  "content": "a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel",
  "dateTime": 115819880499425,
  "sourceContactId": 3,
  "destinationContactId": 10
}, {
  "id": 16,
  "content": "ullamcorper augue a suscipit",
  "dateTime": 116629304655926,
  "sourceContactId": 9,
  "destinationContactId": 9
}, {
  "id": 17,
  "content": "in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed",
  "dateTime": 92777711490709,
  "sourceContactId": 13,
  "destinationContactId": 5
}, {
  "id": 18,
  "content": "condimentum id",
  "dateTime": 34424416008061,
  "sourceContactId": 13,
  "destinationContactId": 13
}, {
  "id": 19,
  "content": "non lectus aliquam sit amet",
  "dateTime": 37217259299321,
  "sourceContactId": 12,
  "destinationContactId": 10
}, {
  "id": 20,
  "content": "ullamcorper augue a suscipit nulla elit ac nulla sed vel enim sit amet",
  "dateTime": 153932038371069,
  "sourceContactId": 1,
  "destinationContactId": 13
}, {
  "id": 21,
  "content": "sagittis nam congue risus semper porta volutpat quam pede lobortis ligula sit amet",
  "dateTime": 145067216963993,
  "sourceContactId": 1,
  "destinationContactId": 12
}, {
  "id": 22,
  "content": "parturient montes nascetur ridiculus mus etiam vel augue vestibulum rutrum rutrum neque aenean auctor gravida sem",
  "dateTime": 114990488729056,
  "sourceContactId": 2,
  "destinationContactId": 11
}, {
  "id": 23,
  "content": "justo morbi ut",
  "dateTime": 81614302011625,
  "sourceContactId": 5,
  "destinationContactId": 11
}, {
  "id": 24,
  "content": "lectus in quam fringilla rhoncus mauris enim leo rhoncus sed vestibulum",
  "dateTime": 13776983603669,
  "sourceContactId": 3,
  "destinationContactId": 6
}]
''';
}
