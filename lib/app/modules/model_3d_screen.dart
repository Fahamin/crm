import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../wigets/appbar_title.dart';

class MyhumanDetailView extends StatelessWidget {
  final String contentUrl = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppbarTitle("3D View"),
      body: WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..enableZoom(true)
          ..getScrollPosition()
          ..loadRequest(Uri.parse(contentUrl)),
      ),
    );
  }
}
