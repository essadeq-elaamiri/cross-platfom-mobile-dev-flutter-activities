import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:enset_chat_app/models/contacr_model.dart';
import 'package:flutter/services.dart';

class ContactRepository {
  // getting data
  final String dataSourcePath = "/lib/database/contacts.json";
  Future<List<Contact>> getAllContatcts() async {
    // simulating a delay (waiting) just to see the progress bar hh
    //var delayFuture = Future.delayed(const Duration(seconds: 30));

    return await loadData();
  }

  Future<List<Contact>> getContatctsByGroup({required GroupType group}) async {
    //print(group);
    //var delayFuture = Future.delayed(const Duration(seconds: 6));
    List<Contact> loadedData = await loadData();
    //print("Filtered data: ${loadedData}");
    List<Contact> filteredByGroup = loadedData.where((contact) {
      //print("List groupes${contact.group}");
      return contact.group == group;
    }).toList();
    //print("Filtered data: ${filteredByGroup}");
    if (Random().nextDouble() < (40 / 100)) {
      throw Exception("Loading problem !");
    }
    return Future.delayed(const Duration(seconds: 1)) // just to simulate delay
        .then((value) => filteredByGroup);
  }

  Future<List<Contact>> loadData() async {
    // read file and return a list of Contacts
    //File file = File(dataSourcePath);
    //Future<String> futureFileContent = file.readAsString();
    //final String response = await rootBundle.loadString(dataSourcePath);

    List<Contact> contactsList = [];

    /*
    futureFileContent.then((value) {
      var jsonData = json.decode(value);
      jsonData.forEach((contactString) {
        contactsList.add(Contact.fromJson(contactString));
      });
    });
    */
    String jsonString = '''[
   
    {
        "id": 2,
        "name": "Colin Hutable",
        "group": "professional",
        "profile": "http://dummyimage.com/147x100.png/ff4444/ffffff"
    },
    {
        "id": 3,
        "name": "Myra Trowl",
        "group": "personal",
        "profile": "http://dummyimage.com/183x100.png/5fa2dd/ffffff"
    },
    {
        "id": 4,
        "name": "Maxim Orhrt",
        "group": "personal",
        "profile": "http://dummyimage.com/248x100.png/cc0000/ffffff"
    },
    {
        "id": 5,
        "name": "Donnamarie Masser",
        "group": "professional",
        "profile": "http://dummyimage.com/105x100.png/5fa2dd/ffffff"
    },
    {
        "id": 6,
        "name": "Ally Capner",
        "group": "personal",
        "profile": "http://dummyimage.com/173x100.png/cc0000/ffffff"
    },
    {
        "id": 7,
        "name": "Aeriell Uzzell",
        "group": "professional",
        "profile": "http://dummyimage.com/232x100.png/cc0000/ffffff"
    },
    {
        "id": 8,
        "name": "Francisco Kulicke",
        "group": "professional",
        "profile": "http://dummyimage.com/169x100.png/cc0000/ffffff"
    },
    {
        "id": 9,
        "name": "Philis Vina",
        "group": "personal",
        "profile": "http://dummyimage.com/222x100.png/5fa2dd/ffffff"
    },
    {
        "id": 10,
        "name": "Gertrude O'Lagen",
        "group": "other",
        "profile": "http://dummyimage.com/191x100.png/dddddd/000000"
    },
    {
        "id": 11,
        "name": "Ali Preddy",
        "group": "professional",
        "profile": "http://dummyimage.com/194x100.png/dddddd/000000"
    },
    {
        "id": 12,
        "name": "Roseanna Shayler",
        "group": "other",
        "profile": "http://dummyimage.com/155x100.png/cc0000/ffffff"
    },
    {
        "id": 13,
        "name": "Griffy McCorrie",
        "group": "professional",
        "profile": "http://dummyimage.com/129x100.png/5fa2dd/ffffff"
    },
    {
        "id": 14,
        "name": "Dalis Uridge",
        "group": "personal",
        "profile": "http://dummyimage.com/214x100.png/dddddd/000000"
    },
    {
        "id": 15,
        "name": "Brigitta Dat",
        "group": "professional",
        "profile": "http://dummyimage.com/190x100.png/ff4444/ffffff"
    }
]''';
    var jsonData = json.decode(jsonString);
    jsonData.forEach((contactString) {
      contactsList.add(Contact.fromJson(contactString));
    });

    return contactsList;
  }
}
