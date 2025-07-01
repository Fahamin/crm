import 'package:crm/core/image_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/colors.dart';
import '../../../../core/text_utils.dart';
import '../../../../wigets/image_slider.dart';
import '../../../../wigets/profile_appbar.dart';
import '../../../../wigets/profile_image.dart';
import '../../../routes/app_pages.dart';
import '../controllers/journal_controller.dart';

class JournalView extends GetView<JournalController> {
  JournalView({super.key});

  final ImageController cc = Get.put(ImageController());
  final List<Map<String, String>> departments = [
    {'name': 'Dermatology', 'image': 'assets/images/dermatology.png'},
    {'name': 'Cardiology', 'image': 'assets/images/cardiology.png'},
    {'name': 'Ophthalmology', 'image': 'assets/images/ophthalmology.png'},
    {'name': 'ENT', 'image': 'assets/images/ent.png'},
    {'name': 'Orthopedic', 'image': 'assets/images/orthopedic.png'},
    {'name': 'Oncology', 'image': 'assets/images/oncology.png'},
    {'name': 'Gynecology', 'image': 'assets/images/gynecology.png'},
    {'name': 'Paediatrics', 'image': 'assets/images/paediatrics.png'},
    {'name': 'Surgery', 'image': 'assets/images/surgery.png'},
    {'name': 'Nephrology', 'image': 'assets/images/nephrology.png'},
    {'name': 'Diabetology', 'image': 'assets/images/diabetology.png'},
    {'name': 'Neurology', 'image': 'assets/images/neurology.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            spaceHeight(10.0),

            // Solution 1: Use Expanded with ListView instead of SingleChildScrollView
            Expanded(
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      // Crucial for nested scrolling
                      physics: NeverScrollableScrollPhysics(),
                      // Disable GridView's own scroll
                      itemCount: departments.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        childAspectRatio: 0.9, // Adjust item aspect ratio
                      ),
                      itemBuilder: (context, index) {
                        final item = departments[index];
                        return InkWell(
                          onTap: () {
                            Get.toNamed(Routes.PUBMED, arguments: item['name']);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xFF1E2746),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  item['image']!,
                                  height: 50,
                                  width: 50,
                                  fit: BoxFit.contain,
                                ),
                                SizedBox(height: 12),
                                textNormal(item['name']!, Colors.white, 12.0)
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset("assets/images/np.png", width: 130),
                SizedBox(height: 8),
                BannerSlider(),
                SizedBox(height: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
