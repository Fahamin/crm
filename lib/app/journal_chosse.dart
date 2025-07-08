import 'dart:convert';

import 'package:crm/app/routes/app_pages.dart';
import 'package:crm/wigets/option_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../core/colors.dart';
import '../../../../wigets/home_appbar.dart';
import '../../../../wigets/fedback.dart';
import '../../../../wigets/image_slider.dart';
import '../../../../wigets/red_dialog.dart';
import '../wigets/appbar_title.dart';

class JournalChosse extends StatelessWidget {
  JournalChosse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppbarTitle(Get.arguments),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              // <-- Takes remaining space
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InkWell(
                        onTap: () {
                          Get.toNamed(Routes.EUROPMC, arguments: Get.arguments);
                        },
                        child: FeedBack(
                            "assets/images/journal.png",
                            "Journal", "Organize thoughts, track progress, and document daily reflections or research insights in one place.")),
                    InkWell(
                        onTap: () async {
                          Get.toNamed(Routes.BOOKS, arguments: Get.arguments);

                        },
                        child: FeedBack(
                            "assets/images/book.png",
                            "Book ", "Browse, read, or manage a collection of books—track reading progress, take notes, and explore summaries.")),
                    InkWell(
                        onTap: () {

                        },
                        child: FeedBack(
                            "assets/images/vid.png",
                            "Video", "Access, watch, and manage video content—save favorites, track viewing history, and explore new topics.")),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Center(child: Image.asset("assets/images/np.png", width: 130)),
            BannerSlider(), // <-- Stays fixed at the bottom
            SizedBox(height: 10), // Extra bottom spacing
          ],
        ),
      ),
    );
  }
}
