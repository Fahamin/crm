import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import '../controllers/pdf_read_controller.dart';

class PdfReadView extends GetView<PdfReadController> {
  const PdfReadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PDF Viewer")),
      body: SfPdfViewer.network(Get.arguments),
    );
  }
}
