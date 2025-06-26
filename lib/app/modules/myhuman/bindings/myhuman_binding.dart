import 'package:get/get.dart';

import '../controllers/myhuman_controller.dart';

class MyhumanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyhumanController>(
      () => MyhumanController(),
    );
  }
}
