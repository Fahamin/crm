import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';

import '../controllers/pdfdownload_controller.dart';

class PdfdownloadView extends GetView<PdfdownloadController> {
  const PdfdownloadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF Viewer'),
        actions: [
          Obx(
                () => controller.errorMessage.isNotEmpty
                ? IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: controller.retry,
            )
                : Container(),
          ),
        ],
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

    if (controller.errorMessage.isNotEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                controller.errorMessage.value,
                style: Get.textTheme.bodyLarge?.copyWith(color: Colors.red),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: controller.retry,
                child: const Text('Try Again'),
              ),
            ],
          ),
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
