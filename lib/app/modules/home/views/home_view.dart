import 'package:crm/app/wigets/colors.dart';
import 'package:crm/app/wigets/fedback.dart';
import 'package:crm/app/wigets/image_slider.dart';
import 'package:crm/app/wigets/information.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../wigets/appbar.dart';
import '../../../wigets/custom_appbar.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            DrAppbar(
                title: "Dr. Albert Stevano", image: "imagelink"),
            InkWell(onTap: () {}, child: FeedBack("assets/images/mes.png","FeedBack",""
                "Share your thoughts, report issues, or suggest improvements to help us make the app better for you.")),
            InkWell(onTap: () {}, child: FeedBack("assets/images/infoi.png","Information Bank",""
                "Find all the details you need in one convenient place, organized, easy to access, and always available when you need them..")),
            InkWell(onTap: () {}, child: FeedBack("assets/images/flag.png","Red Flag",""
                "Notice an issue or unusual activity? Use the red flag feature to report it instantly so we can respond promptly..")),

            Spacer(),
            Center(
              child: Image.asset(
                "assets/images/np.png", // Path to the image
                width: 130,
                fit: BoxFit.cover, // Adjusts how the image fits
              ),
            ),
            BannerSlider(),
          ],
        ),
      ),
    );
  }
}
