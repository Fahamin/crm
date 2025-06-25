import 'package:get/get.dart';

import '../modules/doctor_profile/bindings/doctor_profile_binding.dart';
import '../modules/doctor_profile/views/doctor_profile_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.DOCTOR_PROFILE;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.DOCTOR_PROFILE,
      page: () => const DoctorProfileView(),
      binding: DoctorProfileBinding(),
    ),
  ];
}
