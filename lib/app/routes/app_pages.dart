import 'package:get/get.dart';

import '../modules/doctor_profile/bindings/doctor_profile_binding.dart';
import '../modules/doctor_profile/views/doctor_profile_view.dart';
import '../modules/feedback/bindings/feedback_binding.dart';
import '../modules/feedback/views/feedback_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/myhuman/bindings/myhuman_binding.dart';
import '../modules/myhuman/views/myhuman_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static String INITIAL = Routes.LOGIN;

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
      page: () => DoctorProfileView(),
      binding: DoctorProfileBinding(),
    ),
    GetPage(
      name: _Paths.FEEDBACK,
      page: () => FeedbackView(),
      binding: FeedbackBinding(),
    ),
    GetPage(
      name: _Paths.MYHUMAN,
      page: () =>  MyhumanCollectionView(),
      binding: MyhumanBinding(),
    ),
  ];
}
