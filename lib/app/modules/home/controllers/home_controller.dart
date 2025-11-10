import 'package:get/get.dart';

import '../../../../core/local_stroage_service.dart';

class HomeController extends GetxController {
  var localStorageService = Get.find<LocalStorageService>();

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    localStorageService = await LocalStorageService.getInstance();
    localStorageService.setUserType("1");
  }

  String? get userType => localStorageService.userType;


}
