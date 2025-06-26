import 'dart:ui';

import 'package:crm/core/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../core/colors.dart';
import '../../../../wigets/custom_button.dart';
import '../../../../wigets/custom_text_filed.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: background,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight:
                MediaQuery.of(context).size.height - 32, // 32 = 16*2 padding
          ),
          child: Center(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        spaceHeight(35.0),
                        Text(
                          "Login here",
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Poppins",
                          ),
                        ),
                        spaceHeight(35.0),
                        SizedBox(
                          width: 250,
                          child: Center(
                            child: textNormal(
                              "Welcome back you've been missed!",
                              Colors.white,
                              20.0,
                            ),
                          ),
                        ),
                        spaceHeight(35.0),
                        CustomTextField(
                          controller: controller.emailController,
                          hintText: "Email",
                        ),
                        SizedBox(height: 15),
                        CustomTextField(
                          controller: controller.passwordController,
                          hintText: "Password",
                          obscureText: true,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Poppins",
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Obx(() {
                          return controller.isLoading.value
                              ? CircularProgressIndicator()
                              : CustomButton(
                                  "Login",
                                  onPressed: () {
                                    //  controller.login();
                                    Get.toNamed(Routes.HOME);
                                  },
                                );
                        }),
                      ],
                    ),
                  ),
                ),
                // Use Expanded or flexible space instead of Spacer
                spaceHeight(40.0),
                Center(
                  child: Image.asset(
                    "assets/images/np.png",
                    width: 130,
                  ),
                ),
                // Add some bottom padding
              ],
            ),
          ),
        ),
      ),
    );
  }
}
