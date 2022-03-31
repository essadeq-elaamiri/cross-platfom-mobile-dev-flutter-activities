import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> contacts = [];

  TextEditingController controller = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();

  void deleteItem(int index) {
    contacts.removeAt(index);
  }

  void addItem() {
    contacts.add(controller.text + "  " + controller2.text + "£");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Cates lister")),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: controller,
                  maxLength: 20,
                  decoration: InputDecoration(
                    icon: Icon(Icons.home),
                    labelText: 'Cat Name',
                    labelStyle: TextStyle(
                      color: Color(0xFF6200EE),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF6200EE)),
                    ),
                  ),
                ),
                TextFormField(
                  controller: controller2,
                  cursorColor: Theme.of(context).cursorColor,
                  decoration: InputDecoration(
                    icon: Icon(Icons.currency_pound_outlined),
                    labelText: 'Cat price',
                    labelStyle: TextStyle(
                      color: Color(0xFF6200EE),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF6200EE)),
                    ),
                  ),
                ),
                MaterialButton(
                    textColor: Colors.white,
                    color: Color(0xFF6200EE),
                    child: Icon(
                      Icons.add,
                      size: 26,
                    ),
                    onPressed: () {
                      setState(() {
                        addItem();
                      });
                    }),
                Expanded(
                    child: ListView.builder(
                        itemCount: contacts.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://loremflickr.com/60/60"),
                                  child: Text(contacts[index].substring(0, 1))),
                              trailing: IconButton(
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      deleteItem(index);
                                    });
                                  }),
                              title: Text("${contacts[index]}"),
                            ),
                          );
                        }))
              ]),
        ),
      ),
    );
  }
}
