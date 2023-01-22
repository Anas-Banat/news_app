import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class WebViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: 'https://flutter.io'),
    );
  }
}
