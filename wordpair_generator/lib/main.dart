import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello Title",
      home: Scaffold(
        appBar: AppBar(
          title: const Text("App bar"),
        ),
        body: Column(
          children: const [
            Text(
              "Hello column",
              style: TextStyle(
                  color: Colors.blue,
                  backgroundColor: Colors.black12,
                  fontSize: 22),
            ),
          ],
        ),
      ),
    );
  }
}
