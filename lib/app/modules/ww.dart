import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ModelViewerScreen extends StatelessWidget {
  final String modelUid;

  const ModelViewerScreen({super.key, required this.modelUid});

  @override
  Widget build(BuildContext context) {
    final String viewerUrl = "https://sketchfab.com/models/$modelUid/embed";

    return Scaffold(
      appBar: AppBar(title: Text('3D Model Viewer')),
      body:  WebViewWidget(
        controller: WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..enableZoom(true)
          ..getScrollPosition()
          ..loadRequest(Uri.parse(viewerUrl)),
      ),
    );
  }
}

