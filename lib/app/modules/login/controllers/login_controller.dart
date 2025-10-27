import 'dart:convert';
import 'package:crm/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../data/remote/auth_service.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;

  var authService = Get.find<AuthService>();

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    try {
      final response = await authService.login(
        email: emailController.text,
        password: passwordController.text,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        //Get.snackbar("Success", "Login Successful");
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
