import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/remote/auth_service.dart';
import '../../../routes/app_pages.dart';

class RegistrationController extends GetxController {
  var isLoading = false.obs;
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var authService = Get.find<AuthService>();
  var nameController = TextEditingController();

  var selectedValue = RxnString(); // RxnString = nullable reactive string
  var userType = 1;

  // Options for dropdown
  final List<String> options = ["Yes", "No"];

  void setSelected(String value) {
    selectedValue.value = value;
  }

  Future<void> registration() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;
    if (selectedValue.value == "Yes") {
      userType = 1;
    } else {
      userType = 0;
    }
    try {
      final response = await authService.register(
        email: emailController.text,
        password: passwordController.text,
        name: nameController.text,
        userType: userType,
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        Get.snackbar("Success", "Registration Successful");
        Get.offAllNamed(Routes.LOGIN);
      } else {
        debugPrint(response.body);
        Get.snackbar("Error", "Invalid credentials");
      }
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Error", "Something went wrong: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
