import 'dart:ui';

import 'package:crm/app/wigets/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String image;

  const CustomAppBar({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 55,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              gradient: LinearGradient(
                colors: [
                  Color(0xFF84A1C2), // 50% opacity
                  Color(0xFFFFFFFF).withAlpha(25),
                  Color(0xFF9121F3).withAlpha(110), // 10% opacity// Darker Blue
                  // 10% opacity// Darker Blue
                ],
                begin: Alignment.centerLeft, // Start position
                end: Alignment.centerRight, // End position
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Image.asset(
                  "assets/images/navapharma.png", // Path to the image
                  width: 130,
                  fit: BoxFit.cover, // Adjusts how the image fits
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Icon(Icons.notifications,
                    color: Colors.white), // Background color for default image
              ),
              SizedBox(
                width: 100, // Set the maximum width you want for the text
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Poppins",
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis, // Adds '...' if the text overflows
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(image),
                  onBackgroundImageError: (_, __) {},
                  // Default icon
                  backgroundColor: Colors.grey[400],
                  // Prevents errors from crashing the app
                  child: Icon(Icons.person,
                      color:
                          Colors.white), // Background color for default image
                ),
              ),
            ],
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
