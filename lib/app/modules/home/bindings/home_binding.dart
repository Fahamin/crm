import 'package:get/get.dart';

import '../../../../core/local_stroage_service.dart';
import '../../anatomy/controllers/anatomy_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<LocalStorageService>(
      () => LocalStorageService(),
    );
    Get.lazyPut<AnatomyController>(
      () => AnatomyController(),
    );
  }
}
