import 'package:crm/app/wigets/colors.dart';
import 'package:crm/app/wigets/fedback.dart';
import 'package:crm/app/wigets/image_slider.dart';
import 'package:crm/app/wigets/information.dart';
import 'package:crm/app/wigets/redflag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../wigets/appbar.dart';
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
            CustomAppBar(
                title: "Dr.Mrkhddddddddddddddddddddan", image: "imagelink"),
            InkWell(onTap: () {}, child: FeedBack()),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Infobank(), Redflag()],
            ),
            Spacer(),
            BannerSlider(),
          ],
        ),
      ),
    );
  }
}
