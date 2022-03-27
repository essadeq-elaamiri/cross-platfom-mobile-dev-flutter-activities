import 'package:flutter/material.dart';
import 'widgets/random_word_pairs_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // create a const variable.
    return MaterialApp(
      title: "Hello Title",
      theme: ThemeData(
        primaryColor: Colors.purple[900],
      ),
      home: RandomWordsList(),
    );
  }
}
