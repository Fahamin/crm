import 'package:get/get.dart';

import '../../anatomy/controllers/anatomy_controller.dart';
import '../controllers/tabpage_controller.dart';

class TabpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabpageController>(
      () => TabpageController(),
    );
    Get.lazyPut<AnatomyController>(
          () => AnatomyController(),
    );
  }
}
