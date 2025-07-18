import 'package:get/get.dart';

import '../../anatomy/controllers/anatomy_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );

    Get.lazyPut<AnatomyController>(
          () => AnatomyController(),
    );
  }
}
