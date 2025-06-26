import 'package:crm/core/text_utils.dart';
import 'package:crm/core/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../wigets/custom_button.dart';
import '../../../../wigets/image_slider.dart';
import '../../../../wigets/profile_appbar.dart';
import '../../../../wigets/profile_image.dart';
import '../../../../wigets/text_with_border.dart';
import '../controllers/doctor_profile_controller.dart';

class DoctorProfileView extends GetView<DoctorProfileController> {
  const DoctorProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              spaceHeight(10.0),

              ProfileAppBar(
                title: 'Profile',
                image:
                    'https://55.unsplash.com/premium_photo-1750681051145-45991d0693ee?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxfHx8ZW58MHx8fHx8',
              ),

              ProfileImage(
                  "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"),
              textNormal("Dr Nme", Colors.white, 25.0),
              textNormal("Emt Specilist", Colors.white, 15.0),
              spaceHeight(8.0),

              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textNormalStart("Full Name", Colors.white, 14.0),
                    spaceHeight(4.0),
                    TextWithBorder(hintText: "Dr. Hlim"),
                    spaceHeight(6.0),
                    textNormalStart("Degree", Colors.white, 14.0),
                    spaceHeight(4.0),
                    TextWithBorder(hintText: "Dr. Hlim"),
                    spaceHeight(6.0),
                    textNormalStart("Speciality", Colors.white, 14.0),
                    spaceHeight(4.0),
                    TextWithBorder(hintText: "Dr. Hlim"),
                    spaceHeight(6.0),
                    textNormalStart("Registration Number", Colors.white, 14.0),
                    spaceHeight(4.0),
                    TextWithBorder(hintText: "Dr. Hlim"),
                    spaceHeight(6.0),
                    textNormalStart("Email", Colors.white, 14.0),
                    spaceHeight(4.0),
                    TextWithBorder(hintText: "Dr. Hlim"),
                    spaceHeight(6.0),
                    textNormalStart("Doctor Npl Code", Colors.white, 14.0),
                    spaceHeight(4.0),
                    TextWithBorder(hintText: "Dr. Hlim"),
                    spaceHeight(6.0),
                    textNormalStart("Chamber Address", Colors.white, 14.0),
                    spaceHeight(4.0),
                    TextWithBorder(hintText: "Dr. Hlim"),
                    spaceHeight(6.0),
                    textNormalStart("Region", Colors.white, 14.0),
                    spaceHeight(4.0),
                    TextWithBorder(hintText: "Dr. Hlim"),
                    spaceHeight(6.0),
                    textNormalStart("Area", Colors.white, 14.0),
                    spaceHeight(4.0),
                    TextWithBorder(hintText: "Dr. Hlim"),
                    spaceHeight(6.0),
                    textNormalStart("Territory", Colors.white, 14.0),
                    spaceHeight(4.0),

                  ],
                ),
              )),
              CustomButton(
                "Edit Profile",
                onPressed: () {},
              ),
              Center(child: Image.asset("assets/images/np.png", width: 130)),
              BannerSlider(), //
            ],
          ),
        ));
  }
}
