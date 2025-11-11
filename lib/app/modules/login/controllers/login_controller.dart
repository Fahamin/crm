import 'dart:convert';
import 'package:crm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../core/local_stroage_service.dart';
import '../../../../data/model/login_response.dart';
import '../../../../data/remote/auth_service.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController =
      TextEditingController(text: "khossen20@gmail.com");
  final TextEditingController passwordController =
      TextEditingController(text: "123");
  var isLoading = false.obs;
  var localStorageService = Get.find<LocalStorageService>();
  var authService = Get.find<AuthService>();

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    localStorageService = await LocalStorageService.getInstance();
  }

  var allGranted = false.obs;

  Future<void> requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.camera,
      Permission.storage,
      Permission.location,
      // আরও permission যোগ করো
    ].request();

    allGranted.value = statuses.values.every((status) => status.isGranted);

    if (allGranted.value) {}
  }

  Future<void> login() async {
    isLoading.value = true;

    try {
      final response = await authService.login(
        email: emailController.text,
        password: passwordController.text,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        var model = LoginResponseModel.fromJson(data);
        debugPrint(response.body);

        localStorageService.setUserType(model.user!.uSERTYPE.toString());
        localStorageService.setUserName(model.user!.nAME .toString());

        Get.offAllNamed(Routes.HOME);
      } else {
        debugPrint(response.body);
        Get.snackbar("Error", "Invalid credentials");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
