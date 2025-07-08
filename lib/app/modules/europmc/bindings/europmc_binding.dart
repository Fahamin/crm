import 'package:get/get.dart';

import '../controllers/europmc_controller.dart';

class EuropmcBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EuropmcController>(
      () => EuropmcController(),
    );
  }
}
