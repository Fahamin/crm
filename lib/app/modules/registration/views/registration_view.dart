import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/colors.dart';
import '../../../../core/text_utils.dart';
import '../../../../wigets/custom_button.dart';
import '../../../../wigets/custom_text_filed.dart';
import '../../../routes/app_pages.dart';
import '../controllers/registration_controller.dart';

class RegistrationView extends GetView<RegistrationController> {
  const RegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height - 32,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: controller.formKey,
                    child: Column(
                      children: [
                        spaceHeight(35.0),
                        Text(
                          "Register here",
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
                          controller: controller.nameController,
                          hintText: "Name",
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Name is required";
                            }
                            return null;
                          },

                        ),
                        const SizedBox(height: 15),
                        CustomTextField(
                          controller: controller.emailController,
                          hintText: "Email",
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Email is required";
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15),
                        CustomTextField(
                          controller: controller.passwordController,
                          hintText: "Password",
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Password is required";
                            }
                            return null;
                          },
                          obscureText: true,
                        ),
                        const SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              textNormal("Are You Student", blue, 15.0),
                              const SizedBox(width: 10),
                              Expanded(
                                child:
                                    Obx(() => DropdownButtonFormField<String>(
                                          decoration: const InputDecoration(
                                            labelText: "Select one",
                                            border: OutlineInputBorder(),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    horizontal: 10),
                                          ),
                                          value: controller.selectedValue.value,
                                          items: controller.options
                                              .map((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child:
                                                  textNormal(value, red, 15.0),
                                            );
                                          }).toList(),
                                          onChanged: (value) {
                                            if (value != null)
                                              controller.setSelected(value);
                                          },
                                        )),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Obx(() {
                          return controller.isLoading.value
                              ? const CircularProgressIndicator()
                              : CustomButton(
                                  "Register",
                                  onPressed: () {
                                    controller.registration();
                                  },
                                );
                        }),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Center(
                  child: Image.asset(
                    "assets/images/np.png",
                    width: 130,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
