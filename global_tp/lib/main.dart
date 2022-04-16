import 'dart:io';

import 'package:flutter/material.dart';
import 'package:global_tp/pages/contacts.dart';
import 'package:global_tp/pages/covid.dart';
import 'package:global_tp/pages/github_users.dart';
import 'package:global_tp/pages/home.dart';
import 'package:global_tp/pages/news.dart';
import 'package:global_tp/pages/news_home.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      routes: {
        "/": (context) => Home(),
        "/contacts": (context) => Contacts(),
        "/github_users": (context) => GitHubUsers(),
        "/news": (context) => NewsHome(), //News(),
        "/covid": (context) => CovidStatistics(),
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
