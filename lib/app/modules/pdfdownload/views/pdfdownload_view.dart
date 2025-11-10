import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';

import '../controllers/pdfdownload_controller.dart';

class PdfDownloadView extends GetView<PdfdownloadController> {
  const PdfDownloadView({super.key});

  @override
  Widget build(BuildContext context) {
    Future.microtask(() => controller.initializePdf(Get.arguments));
    return Scaffold(
      appBar: AppBar(
        title: const Text('Books Viewer'),
      ),
      body: Obx(() => _buildBody()),
    );
  }

  Widget _buildBody() {
    if (controller.isLoading.value) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(value: controller.downloadProgress.value),
            const SizedBox(height: 20),
            Text(
              'Preparing PDF... ${(controller.downloadProgress.value * 100).toStringAsFixed(1)}%',
              style: Get.textTheme.bodyMedium,
            ),
          ],
        ),
      );
    }

    return PdfViewPinch(
      controller: controller.pdfController,
      scrollDirection: Axis.vertical,
      builders: PdfViewPinchBuilders<DefaultBuilderOptions>(
        options: const DefaultBuilderOptions(),
        documentLoaderBuilder: (_) =>
            const Center(child: CircularProgressIndicator()),
        pageLoaderBuilder: (_) =>
            const Center(child: CircularProgressIndicator()),
        errorBuilder: (_, error) =>
            Center(child: Text('PDF Error: ${error.toString()}')),
      ),
    );
  }
}
