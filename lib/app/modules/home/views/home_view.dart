import 'package:crm/app/wigets/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../wigets/appbar.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
          body: Column(
            children: [
              SizedBox(height:  30),
              CustomAppBar(title: "Dr.Mrkhan",image: "image")
            ],
          ),
        );
  }
}
