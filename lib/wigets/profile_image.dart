import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  var imageLink;

  ProfileImage(this.imageLink, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.grey[400], // Background color when no image
        child: ClipOval(
          child: Image.network(
            imageLink, // Your network image URL
            fit: BoxFit.cover,
            width: 150,
            // Double the radius
            height: 150,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.person,
                color: Colors.white,
                size: 150, // Slightly smaller than the avatar
              );
            },
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Icon(
                Icons.person,
                color: Colors.white,
                size: 150,
              );
            },
          ),
        ),
      ),
    );
  }
}
