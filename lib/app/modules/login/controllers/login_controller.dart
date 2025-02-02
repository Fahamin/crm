import 'dart:convert';

import 'package:crm/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var isLoading = false.obs;

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;

    try {
      var response = await http.post(
        Uri.parse("https://yourapi.com/login"),
        body: {
          "email": emailController.text,
          "password": passwordController.text,
        },
      );

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        Get.snackbar("Success", "Login Successful");

        Get.toNamed(Routes.HOME);
      } else {
        Get.snackbar("Error", "Invalid credentials");
      }
    } catch (e) {
      Get.snackbar("Error", "Something went wrong");
    } finally {
      isLoading.value = false;
    }
  }
}
