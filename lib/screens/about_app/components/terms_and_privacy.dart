import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TermsAndPrivacy extends StatefulWidget {
  TermsAndPrivacy({this.headerText, this.htmlPath});
  final String headerText;
  final String htmlPath;
  @override
  _TermsAndPrivacyState createState() => _TermsAndPrivacyState();
}

class _TermsAndPrivacyState extends State<TermsAndPrivacy> {
  WebViewController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
          initialUrl: 'about:blank',
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
            _loadHtmlFromAssets();
          }),
    );
  }

  _loadHtmlFromAssets() async {
    String fileText = await rootBundle.loadString(widget.htmlPath);
    _controller.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
