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
    contacts.add(controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Laptops lister")),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: controller,
                  maxLength: 20,
                  decoration: InputDecoration(
                    icon: Icon(Icons.laptop_chromebook),
                    labelText: 'Laptop price',
                    labelStyle: TextStyle(
                      color: Color(0xFF6200EE),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF6200EE)),
                    ),
                  ),
                ),
                TextFormField(
                  controller: controller,
                  cursorColor: Theme.of(context).cursorColor,
                  decoration: InputDecoration(
                    icon: Icon(Icons.laptop_chromebook),
                    labelText: 'Laptop reference',
                    labelStyle: TextStyle(
                      color: Color(0xFF6200EE),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF6200EE)),
                    ),
                  ),
                ),
                MaterialButton(
                    color: Colors.blueAccent,
                    child: Icon(Icons.add),
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
