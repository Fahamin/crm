import 'package:get/get.dart';

import '../controllers/studenbook_controller.dart';

class StudenbookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StudenbookController>(
      () => StudenbookController(),
    );
  }
}
