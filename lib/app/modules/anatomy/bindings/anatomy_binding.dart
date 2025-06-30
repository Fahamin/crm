import 'package:get/get.dart';

import '../controllers/anatomy_controller.dart';

class AnatomyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AnatomyController>(
      () => AnatomyController(),
    );
  }
}
