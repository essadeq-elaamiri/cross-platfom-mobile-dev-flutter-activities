import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    //if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Flutter",
              style:
              TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
            )
          ],
        ),
        actions: <Widget>[
        Opacity(
        opacity:0,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Icon(Icons.share,))
        )],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          initialUrl:  "https://github.com/essadeq-elaamiri",
          onWebViewCreated: (WebViewController webViewController){
            _controller.complete(webViewController);
          },
        ),
      ),
    );

  }
}
