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
      body:SfPdfViewer.network(
        "https://firebasestorage.googleapis.com/v0/b/flutter-tv-ec77e.appspot.com/o/CommunityMedicinePark.pdf?alt=media&token=7f1348fc-2743-4ebb-a604-b1fdb2785893",
        canShowScrollHead: true,
        canShowPaginationDialog: true,
      ),
    );
  }
}
