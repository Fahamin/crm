import 'package:crm/app/modules/utils/text_utils.dart';
import 'package:flutter/material.dart';

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
                  backgroundImage: NetworkImage(image),
                  onBackgroundImageError: (_, __) {},
                  // Default icon
                  backgroundColor: Colors.grey[400],
                  // Prevents errors from crashing the app
                  child: Icon(Icons.person,
                      color:
                          Colors.white), // Background color for default image
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
