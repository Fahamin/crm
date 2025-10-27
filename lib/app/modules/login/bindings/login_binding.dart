import 'package:crm/data/remote/auth_service.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut<AuthService>(
          () => AuthService(),
    );

    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
  }
}
