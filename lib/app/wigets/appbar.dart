import 'dart:ui';

import 'package:crm/app/wigets/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String image;

  const CustomAppBar({super.key, required this.title,required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: 55,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/pic/appbarbg.png"),
              // Local asset image
              fit: BoxFit.cover, // Cover the entire container
            ),
            borderRadius: BorderRadius.circular(12),
            // Optional: Rounded corners
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 8,
                spreadRadius: 2,
                offset: Offset(2, 4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Image.asset(
                  "assets/images/pic/navapharma.png", // Path to the image
                  width: 200,
                  fit: BoxFit.cover, // Adjusts how the image fits
                ),
              ),
              Text(title,style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins"
              ),),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 5),
                child: CircleAvatar(
                  radius: 15,
                  backgroundImage: NetworkImage(image),
                  onBackgroundImageError: (_, __) {}, // Default icon
                  backgroundColor: Colors.grey[400], // Prevents errors from crashing the app
                  child: Icon(Icons.person, color: Colors.white), // Background color for default image
                ),
              ),
            ],
          )),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
