import 'dart:ui';

import 'package:crm/core/text_utils.dart';
import 'package:flutter/material.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String image;

  ProfileAppBar({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
          height: 55,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.all(6.0),
                child: Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
              SizedBox(
                  width: 100, // Set the maximum width you want for the text
                  child: textNormal(title, Colors.white, 16.2)),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 6),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.grey[400], // Background color when no image
                  child: ClipOval(
                    child: Image.network(
                      image, // Your network image URL
                      fit: BoxFit.cover,
                      width: 30, // Double the radius
                      height: 30,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 20, // Slightly smaller than the avatar
                        );
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return  Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 20,
                        );
                      },
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
