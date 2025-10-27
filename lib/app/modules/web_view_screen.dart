import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../wigets/appbar_title.dart';

class WebViewPage extends StatefulWidget {
  final String url;

  const WebViewPage({super.key, required this.url});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  var isLoading = true.obs;
  late final WebViewController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (String url) {
          isLoading.value = true;
        },
        onPageFinished: (String url) {
          isLoading.value = false;
        },
      ))
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarTitle("Details"),
        body: Stack(
            children: [
              WebViewWidget(controller: _controller),
              Obx(() => isLoading.value
                  ? Center(child: CircularProgressIndicator())
                  : SizedBox.shrink())
            ],
          ),
        );
  }
}
