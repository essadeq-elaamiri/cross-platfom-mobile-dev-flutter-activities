import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CovidStatistics extends StatefulWidget {
  @override
  State<CovidStatistics> createState() => _CovidStatisticsState();
}

class _CovidStatisticsState extends State<CovidStatistics> {
  var users = null;
  final String OPEN_GRARH_IMAGE_URL = "https://covid19.mathdro.id/api/og";
  TextEditingController textEditingController = new TextEditingController();

  void searchGithubUser(userKey) {
    String url =
        "https://api.github.com/search/users?q=${userKey}&per_page=10&page=0";
    http.get(Uri.parse(url)).then((response) {
      setState(() {
        users = json.decode(response.body);
      });
    }).catchError((onError) {
      print(onError);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Covid Statistics"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Image.network(
              OPEN_GRARH_IMAGE_URL,
              fit: BoxFit.cover,
            ),
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                )),
                IconButton(
                  onPressed: () {
                    setState(() {
                      searchGithubUser(textEditingController.text);
                    });
                  },
                  icon: Icon(Icons.search),
                )
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: users == null || users["items"] == null
                    ? 0
                    : users["items"].length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(users["items"][index]["avatar_url"]),
                    ),
                    title: Text(users["items"][index]["login"]),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
