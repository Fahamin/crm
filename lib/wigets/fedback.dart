import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/text_utils.dart';
import '../core/colors.dart';

class FeedBack extends StatelessWidget {
  var imaage;
  var title;
  var des;

  FeedBack(this.imaage, this.title, this.des, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 180,
          width: 400,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              color: cardbg),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(width: 48, height: 48, child: Image.asset(imaage)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: textNormalStart(title, Colors.white, 14.0),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: textNormalStart(des, Colors.white, 12.0),
              ),
            ],
          )),
    );
  }
}
