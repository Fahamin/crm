import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class PdfReadController extends GetxController {
  var pdfUrl = ''.obs;
  var isLoading = true.obs;
  late String iaId;

  @override
  void onInit() {
    super.onInit();
    iaId = Get.arguments;
    fetchPdfUrl();
  }

  Future<void> fetchPdfUrl() async {
    final metaUrl = 'https://archive.org/metadata/$iaId';
    final response = await http.get(Uri.parse(metaUrl));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final files = jsonData['files'] as List;

      final pdfFile = files.firstWhere(
            (file) => file['name'].toString().endsWith('.pdf'),
        orElse: () => null,
      );

      if (pdfFile != null) {
        pdfUrl.value = 'https://archive.org/download/$iaId/${pdfFile['name']}';
      } else {
        Get.snackbar("Not found", "No PDF file available.");
      }
    } else {
      Get.snackbar("Error", "Failed to fetch metadata");
    }
    isLoading.value = false;
  }
}