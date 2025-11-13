import 'package:get/get.dart';

import '../../pdfdownload/controllers/pdfdownload_controller.dart';
import '../controllers/books_controller.dart';

class BooksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BooksController>(
      () => BooksController(),
    );
    Get.lazyPut<PdfDownloadController>(
          () => PdfDownloadController(),fenix: true
    );
  }
}
