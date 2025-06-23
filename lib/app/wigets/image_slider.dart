import 'package:crm/app/modules/utils/image_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class BannerSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ImageController controller = Get.put(ImageController());

    return SizedBox(
      height: 40, // Ensure Stack has a defined height
      child: Stack(
        children: [
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
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: Image.asset(
                      controller.imagePaths[index % controller.imagePaths.length],
                      width: 70,
                      height: 40,
                      fit: BoxFit.contain,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
