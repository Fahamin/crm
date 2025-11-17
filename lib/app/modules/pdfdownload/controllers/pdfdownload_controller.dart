import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';
import 'package:permission_handler/permission_handler.dart';

class PdfDownloadController extends GetxController {
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;
  RxString localFilePath = ''.obs;
  RxDouble downloadProgress = 0.0.obs;

  final Rxn<PdfController> pdfController = Rxn<PdfController>();

  @override
  void onInit() {
    super.onInit();
    initializePdf(Get.arguments);
  }

  Future<void> initializePdf(var pdfUrl) async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      pdfController.value = null;

      final hasPermission = await requestStoragePermission();
      if (!hasPermission) {
        errorMessage.value = "Storage permission required to download PDF";
        isLoading.value = false;
        return;
      }

      final path = await downloadPdf();
      if (path == null) {
        errorMessage.value = "Failed to download PDF";
        isLoading.value = false;
        return;
      }

      localFilePath.value = path;

      pdfController.value = PdfController(
        document: PdfDocument.openFile(localFilePath.value),
      );

      isLoading.value = false;
    } catch (e) {
      errorMessage.value = "Error: ${e.toString()}";
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    pdfController.value?.dispose();
    super.onClose();
  }

  Future<bool> requestStoragePermission() async {
    if (!Platform.isAndroid) return true;

    final androidInfo = await DeviceInfoPlugin().androidInfo;
    if (androidInfo.version.sdkInt <= 32) {
      return (await Permission.storage.request()).isGranted;
    } else {
      if (await Permission.manageExternalStorage.isGranted) return true;

      if ((await Permission.photos.request()).isGranted) return true;

      return (await Permission.manageExternalStorage.request()).isGranted;
    }
  }

  Future<String?> downloadPdf() async {
    try {
      final dio = Dio();
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/downloaded_pdf.pdf';

      await dio.download(
        Get.arguments,
        filePath,
        onReceiveProgress: (received, total) {
          if (total != -1) {
            downloadProgress.value = received / total;
          }
        },
      );

      return filePath;
    } catch (e) {
      Get.log('Download error: $e');
      return null;
    }
  }
}
