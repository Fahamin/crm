import 'package:crm/core/text_utils.dart';
import 'package:flutter/material.dart';

import '../core/colors.dart';

class AppbarTitle extends StatelessWidget implements PreferredSizeWidget {
  var value;

  AppbarTitle(this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: textNormalBold(value, Colors.white, 18.0),
      centerTitle: true,
      backgroundColor: background,
      iconTheme: IconThemeData(color: Colors.white),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight); // 👈 FIXED
}
