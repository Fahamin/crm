import 'package:crm/core/text_utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';

import '../../../../core/colors.dart';
import '../../../../wigets/appbar_title.dart';
import '../controllers/pdfdownload_controller.dart';

class PdfDownloadView extends GetView<PdfDownloadController> {
  const PdfDownloadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppbarTitle("Books View"),
      body: Obx(() {
        if (controller.isLoading.value) {
          return _buildLoadingState();
        }

        if (controller.errorMessage.value.isNotEmpty) {
          return _buildErrorState();
        }

        return Obx(() => controller.pdfController.value != null
            ? _buildPdfView(controller.pdfController.value!)
            : _buildLoadingState());
      }),
    );
  }

  Widget _buildLoadingState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(value: controller.downloadProgress.value),
          const SizedBox(height: 20),
          textNormal(
              'Preparing PDF... ${(controller.downloadProgress.value * 100).toStringAsFixed(1)}%',
              Colors.white,
              14.0)
        ],
      ),
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text(
            controller.errorMessage.value,
            style: Get.textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => controller.initializePdf(Get.arguments),
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  Widget _buildPdfView(PdfControllerPinch pdfController) {
    return PdfViewPinch(
      controller: pdfController,
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
