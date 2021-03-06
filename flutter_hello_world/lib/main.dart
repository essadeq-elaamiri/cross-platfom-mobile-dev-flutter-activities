import 'package:flutter/material.dart';
import 'string.dart';
import 'dart:convert';
//import 'package:http/http.dart' as http;
void main() {
  runApp(const FirstApp());
}
class FirstApp extends StatelessWidget{
  const FirstApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: Strings.appTitle,
      home: ProductManager(),
    );
  }

}

class ProductManager extends StatefulWidget {
  const ProductManager({Key? key}) : super(key: key);

  @override
  State<ProductManager> createState() => _ProductManagerState();
}

class _ProductManagerState extends State<ProductManager> {
  //  is the name of the state class. The underscore in front of _ProductManagerState
  //  means that this class is file-private. It can’t be imported into other files.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.barTitle),
      ),
      body: const Center(
        child: Text("Hello Center"),
      ),
    );
  }
}
