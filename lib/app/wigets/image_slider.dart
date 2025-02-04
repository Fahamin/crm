import 'package:crm/app/modules/utils/image_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BannerSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ImageController controller = Get.put(ImageController());

    return Stack(
      children: [
        // Background Image
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/slide/sb.png"), // Set your background image
              ),
            ),
          ),
        ),

        // Marquee Image Banner
        Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: 50, // Adjust banner height
            child: ListView.builder(
              controller: controller.scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: controller.imagePaths.length * 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding:  EdgeInsets.symmetric(vertical: 12.0),
                  child: Image.asset(
                    controller.imagePaths[index % controller.imagePaths.length],
                    width: 150,
                    height: 50,
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}