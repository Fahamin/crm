import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdfx/pdfx.dart';
import 'package:permission_handler/permission_handler.dart';

class PdfdownloadController extends GetxController {

 // static const pdfUrl = "https://firebasestorage.googleapis.com/v0/b/flutter-tv-ec77e.appspot.com/o/CommunityMedicinePark.pdf?alt=media&token=7f1348fc-2743-4ebb-a604-b1fdb2785893";
  static const pdfUrl = "http://www.elife.navanapharma.com/profile_image/CRMPhysiologyGyton.pdf";

  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;
  RxString localFilePath = ''.obs;
  RxDouble downloadProgress = 0.0.obs;
  late PdfControllerPinch pdfController;

  @override
  void onInit() {
    super.onInit();
    initializePdf();
  }

  Future<void> initializePdf() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

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

      localFilePath.value = path!;
      isLoading.value = false;

      pdfController = PdfControllerPinch(
        document: PdfDocument.openFile(localFilePath.value!),
      );

    } catch (e) {
      errorMessage.value = "Error: ${e.toString()}";
      isLoading.value = false;
    }
  }

  Future<bool> requestStoragePermission() async {
    if (!Platform.isAndroid) return true;

    final androidInfo = await DeviceInfoPlugin().androidInfo;
    if (androidInfo.version.sdkInt <= 32) {
      final status = await Permission.storage.request();
      return status.isGranted;
    } else {
      if (await Permission.manageExternalStorage.isGranted) {
        return true;
      }

      final mediaStatus = await Permission.photos.request();
      if (mediaStatus.isGranted) return true;

      final status = await Permission.manageExternalStorage.request();
      return status.isGranted;
    }
  }

  Future<String?> downloadPdf() async {
    try {
      final dio = Dio();
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/downloaded_pdf.pdf';

      await dio.download(
        pdfUrl,
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

  void retry() {
    initializePdf();
  }
}