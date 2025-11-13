import 'package:get/get.dart';

import '../controllers/pdfdownload_controller.dart';

class PdfdownloadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PdfDownloadController>(
      () => PdfDownloadController(),
    );
  }
}
