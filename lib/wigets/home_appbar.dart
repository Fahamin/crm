import 'package:crm/core/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/routes/app_pages.dart';

class DrAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String image;

  const DrAppbar({super.key, required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textNormal("Welcome", Colors.blue, 12.0),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200, // Set the maximum width you want for the text
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Poppins",
                  ),
                  maxLines: 1,
                  overflow:
                      TextOverflow.ellipsis, // Adds '...' if the text overflows
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.grey[400],
                  // Background color when no image
                  child: InkWell(
                    onTap: () {
                      Get.toNamed(Routes.DOCTOR_PROFILE);
                    },
                    child: ClipOval(
                      child: Image.network(
                        image, // Your network image URL
                        fit: BoxFit.cover,
                        width: 30,
                        // Double the radius
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
                          return Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 20,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
