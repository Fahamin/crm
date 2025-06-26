import 'package:crm/core/text_utils.dart';
import 'package:crm/core/colors.dart';
import 'package:flutter/material.dart';

class DoctorInfo extends StatelessWidget {
  var name;
  var speciality;
  var docCode;
  var region;

  DoctorInfo(this.name, this.speciality, this.docCode, this.region,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(

      width: 400,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(12)), color: cardbg),
      child: Padding(
        padding:  EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                textNormal("Doctor Name:    ", Colors.grey, 16.0),
                textNormalBold(name, Colors.white, 16.0),
              ],
            ),
            spaceHeight(3.0),
            Row(
              children: [
                textNormal("Speciality:    ", Colors.grey, 16.0),
                textNormalBold(speciality, Colors.white, 16.0),
              ],
            ),
            spaceHeight(3.0),
            Row(
              children: [
                textNormal("Doctor Code:    ", Colors.grey, 16.0),
                textNormalBold(docCode, Colors.white, 16.0),
              ],
            ),
            spaceHeight(3.0),
            Row(
              children: [
                textNormal("Region:    ", Colors.grey, 16.0),
                textNormalBold(region, Colors.white, 16.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
