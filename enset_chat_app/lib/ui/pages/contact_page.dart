import 'package:enset_chat_app/models/contacr_model.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);
  GroupType selectedGroupType = GroupType.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contacts"),
      ),
      body: Container(
          child: Column(
        children: [
          Row(),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: this.selectedGroupType.index,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.group)),
          BottomNavigationBarItem(icon: Icon(Icons.home_filled)),
          BottomNavigationBarItem(icon: Icon(Icons.work)),
          BottomNavigationBarItem(icon: Icon(Icons.outdoor_grill_sharp)),
        ],
        onTap: (int index) {
          print(index);
        },
      ),
    );
  }
}
