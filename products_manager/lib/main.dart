import 'package:flutter/material.dart';
import 'strings.dart';
import 'colors.dart';
//import 'dart:convert';
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
      body:  Padding(
        padding: const EdgeInsets.all(20),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Text(Strings.addNewProductText, style: TextStyle(
                color: Colors.black38
                ),
              ),
            Row(
              children: const [
                Text(
                    Strings.productRefLabel
                ),
              ],
            ),
            Row(
              children: const [
                Text(
                    Strings.productDescLabel
                ),
              ],
            ),
            Row(
              children: const [
                Text(
                    Strings.productPriceLabel
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
