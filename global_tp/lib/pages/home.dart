import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:global_tp/widgets/app_drawer.dart';
import 'package:global_tp/widgets/drawer_item.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //drawerScrimColor: Colors.blueAccent,
        drawer: AppDrawer(),
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, "/contacts");
            },
            child: Text("Contacts"),
          ),
        ));
  }
}
