
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../wigets/colors.dart';
import '../../../../wigets/custom_appbar.dart';
import '../../../../wigets/fedback.dart';
import '../../../../wigets/image_slider.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
   HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Padding(
        padding:  EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: 30),
            DrAppbar(
                title: "Dr. Albert Stevano", image: "imagelink"),
            Expanded( // <-- Takes remaining space
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InkWell(onTap: () {}, child: FeedBack("assets/images/mes.png","FeedBack",""
                        "Share your thoughts, report issues, or suggest improvements to help us make the app better for you.")),
                    InkWell(onTap: () {}, child: FeedBack("assets/images/infoi.png","Information Bank",""
                        "Find all the details you need in one convenient place, organized, easy to access, and always available when you need them..")),
                    InkWell(onTap: () {}, child: FeedBack("assets/images/flag.png","Red Flag",""
                        "Notice an issue or unusual activity? Use the red flag feature to report it instantly so we can respond promptly..")),

                    SizedBox(height: 20),
                    Center(child: Image.asset("assets/images/np.png", width: 130)),
                  ],
                ),
              ),
            ),
            BannerSlider(), // <-- Stays fixed at the bottom
            SizedBox(height: 10), // Extra bottom spacing
          ],

        ),
      ),
    );
  }
}
