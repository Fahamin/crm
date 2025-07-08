import 'package:get/get.dart';

import '../controllers/pdf_read_controller.dart';

class PdfReadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PdfReadController>(
      () => PdfReadController(),
    );
  }
}
