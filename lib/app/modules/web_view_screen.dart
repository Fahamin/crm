import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../wigets/appbar_title.dart';

class WebViewPage extends StatelessWidget {
  final String url;
  const WebViewPage({required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppbarTitle("Article Details"),
      body: WebViewWidget(
        controller: WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..enableZoom(true)
      ..getScrollPosition()
      ..loadRequest(Uri.parse(url)),
    ),
    );
  }
}
