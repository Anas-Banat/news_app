import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class WebViewScreen extends StatelessWidget {
  final String url;
  WebViewScreen(this.url);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      appBar: AppBar(),
      body: Container(
          //WebView(initialUrl: 'https://flutter.io'),
          ),
=======
      appBar: AppBar(), body: Container(),
      // WebView(initialUrl: 'https://flutter.io'),
>>>>>>> f0da7ddd458aa114e81e8c1664ec2443ca1a98be
    );
  }
}
