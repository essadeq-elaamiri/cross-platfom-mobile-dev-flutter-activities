import 'dart:convert';
import 'dart:io';

import 'package:enset_chat_app/models/contacr_model.dart';

class ContactRepository {
  // getting data

  Future<List<Contact>> getAllContatcts() async {
    // simulating a delay (waiting) just to see the progress bar hh
    var delayFuture = Future.delayed(const Duration(seconds: 6));
    return await loadData();
  }

  Future<List<Contact>> getContatctsByGroup({required GroupType group}) async {
    var delayFuture = Future.delayed(const Duration(seconds: 6));
    return (await loadData())
        .where((contact) => contact.group == group)
        .toList();
  }

  Future<List<Contact>> loadData() async {
    // read file and return a list of Contacts
    File file = File('../database/contacts.json');
    Future<String> futureFileContent = file.readAsString();

    List<Contact> contactsList = [];

    futureFileContent.then((value) {
      var jsonData = json.decode(value);
      jsonData.forEach((contactString) {
        contactsList.add(Contact.fromJson(contactString));
      });
    });

    return contactsList;
  }
}
