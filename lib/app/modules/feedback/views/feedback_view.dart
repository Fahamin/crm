import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:radio_group_v2/utils/radio_group_decoration.dart';
import 'package:radio_group_v2/widgets/views/radio_group.dart';

import '../../../../core/text_utils.dart';
import '../../../../core/colors.dart';
import '../../../../wigets/custom_button.dart';
import '../../../../wigets/custom_text_filed.dart';
import '../../../../wigets/doctor_info.dart';
import '../../../../wigets/image_slider.dart';
import '../../../../wigets/profile_appbar.dart';
import '../../../../wigets/profile_image.dart';
import '../../../../wigets/text_with_border.dart';
import '../controllers/feedback_controller.dart';

class FeedbackView extends GetView<FeedbackController> {
  FeedbackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        body: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(children: [
              spaceHeight(10.0),
              ProfileAppBar(
                title: 'Feedback',
                image:
                    'https://55.unsplash.com/premium_photo-1750681051145-45991d0693ee?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxfHx8ZW58MHx8fHx8',
              ),
              ProfileImage(
                  "https://plus.unsplash.com/premium_photo-1689568126014-06fea9d5d341?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D"),
              textNormal("Dr Nme", Colors.white, 25.0),
              textNormal("Emt Specilist", Colors.white, 15.0),
              spaceHeight(8.0),
              DoctorInfo("Dr Hadis", "ent", "4521", "Dhaka"),
              spaceHeight(16.0),
              Expanded(
                  child: SingleChildScrollView(
                      child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textNormalStart(
                      "1.Are you Satisfied with our Profit sharing policy system?",
                      Colors.white,
                      15.0),
                  Obx(() => Column(
                        children: controller.q1
                            .map((option) => RadioListTile<String>(
                                  title: textNormalStart(
                                      option, Colors.white, 15.0),
                                  value: option,
                                  groupValue: controller.selectedQ1.value,
                                  onChanged: (value) {
                                    controller.selectedQ1(value!);
                                  },
                                ))
                            .toList(),
                      )),
                  spaceHeight(5.0),
                  textNormalStart(
                      "2.Are you getting timely payment?", Colors.white, 15.0),
                  Obx(() => Column(
                        children: controller.q2
                            .map((option) => RadioListTile<String>(
                                  title: textNormalStart(
                                      option, Colors.white, 15.0),
                                  value: option,
                                  groupValue: controller.selectedQ2.value,
                                  onChanged: (value) {
                                    controller.selectedQ2(value!);
                                  },
                                ))
                            .toList(),
                      )),
                  spaceHeight(5.0),
                  textNormalStart(
                      "3.How Satisfied are you with the  amount that you’re receiving?",
                      Colors.white,
                      15.0),
                  Obx(() => Column(
                        children: controller.q3
                            .map((option) => RadioListTile<String>(
                                  title: textNormalStart(
                                      option, Colors.white, 15.0),
                                  value: option,
                                  groupValue: controller.selectedQ3.value,
                                  onChanged: (value) {
                                    controller.selectedQ3(value!);
                                  },
                                ))
                            .toList(),
                      )),
                  spaceHeight(5.0),
                  textNormalStart(
                      "4.Were you sufficiently informed about our policy by our sales personnel?",
                      Colors.white,
                      15.0),
                  Obx(() => Column(
                        children: controller.q4
                            .map((option) => RadioListTile<String>(
                                  title: textNormalStart(
                                      option, Colors.white, 15.0),
                                  value: option,
                                  groupValue: controller.selectedQ4.value,
                                  onChanged: (value) {
                                    controller.selectedQ4(value!);
                                  },
                                ))
                            .toList(),
                      )),
                  spaceHeight(5.0),
                  textNormalStart(
                      "5.Do you face any technical problem while using our pen? Please tick the boxes that apply.?",
                      Colors.white,
                      15.0),
                  Obx(() => Column(
                        children: ['Item A', 'Item B', 'Item C'].map((item) {
                          return CheckboxListTile(
                            title: textNormal(item, Colors.white, 15.0),
                            value: controller.selectedCheckbox.contains(item),
                            onChanged: (value) =>
                                controller.toggleSelection(item),
                          );
                        }).toList(),
                      )),
                  spaceHeight(5.0),
                  textNormalStart(
                      "6.Are you happy with the prescription pads we have provided?",
                      Colors.white,
                      15.0),
                  CustomTextField(
                    controller: controller.selectedQ6,
                    hintText: "",
                  ),
                  spaceHeight(5.0),
                  textNormalStart(
                      "7.If you have any suggestion’s, Please Comment.?",
                      Colors.white,
                      15.0),
                  CustomTextField(
                    controller: controller.selectedQ7,
                    hintText: "",
                  ),
                  spaceHeight(5.0),
                  Obx(() {
                    return controller.isLoading.value
                        ? CircularProgressIndicator()
                        : CustomButton(
                            "Submit Feedback",
                            onPressed: () {},
                          );
                  }),
                  spaceHeight(15.0),
                ],
              ))),
              Center(child: Image.asset("assets/images/np.png", width: 130)),
              BannerSlider(),
            ])));
  }
}
