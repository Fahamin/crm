import 'package:get/get.dart';

import '../controllers/pubmed_controller.dart';

class PubmedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PubmedController>(
      () => PubmedController(),
    );
  }
}
