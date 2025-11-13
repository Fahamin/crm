import 'package:get/get.dart';

import '../../pdfdownload/controllers/pdfdownload_controller.dart';
import '../controllers/information_controller.dart';

class InformationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InformationController>(
      () => InformationController(),
    );
    Get.lazyPut<PdfDownloadController>(
          () => PdfDownloadController(),
    );
  }
}
