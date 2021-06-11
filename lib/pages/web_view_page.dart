import 'package:flutter/material.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';
import '../constants.dart';

class WebViewPageWidget extends StatefulWidget {
  @override
  _WebViewPageWidgetState createState() => _WebViewPageWidgetState();
}

class _WebViewPageWidgetState extends State<WebViewPageWidget> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        initialUrl: Constants.url1,
      ),
    );
  }
}
