import 'dart:ui';

import 'package:crm/app/wigets/colors.dart';
import 'package:crm/app/wigets/custom_text_filed.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';


import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // Blur effect
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  // Transparent with opacity
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                ),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Welcome back!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                        ),
                      ),
                      SizedBox(height: 25),

                      // Email Input
                      CustomTextField(
                          controller: controller.emailController,
                          hintText: "Email"),
                      SizedBox(height: 15),

                      CustomTextField(
                          controller: controller.passwordController,
                          hintText: "Password",
                          obscureText: true),
                      // Password Input + Forgot Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text("Forgot Password?",
                                style: TextStyle(color: Colors.white70)),
                          ),
                        ],
                      ),

                      SizedBox(height: 15),

                      // Sign In Button
                      Obx(() {
                        return controller.isLoading.value
                            ? CircularProgressIndicator()
                            : ElevatedButton(
                                onPressed: controller.login,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 50, vertical: 14),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text("SIGN IN",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                    SizedBox(width: 8),
                                    Icon(Icons.arrow_right_alt,
                                        color: Colors.black),
                                  ],
                                ),
                              );
                      }),

                      SizedBox(height: 15),

                      // Sign Up Option
                      TextButton(
                        onPressed: () {},
                        child: Text("I don’t have an account? Sign up",
                            style: TextStyle(color: Colors.white70)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
