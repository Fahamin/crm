import 'package:crm/data/remote/auth_service.dart';
import 'package:get/get.dart';

import '../../../../core/local_stroage_service.dart';
import '../../pdfdownload/controllers/pdfdownload_controller.dart';
import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthService>(
      () => AuthService(),
    );

    Get.lazyPut<LocalStorageService>(
          () => LocalStorageService(),
    );
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );

  }
}
