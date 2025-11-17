import 'dart:io';

import 'package:crm/app/modules/profile/controllers/doctor_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileImage extends StatelessWidget {
  final String imageLink;
  final bool showEditButton;
  final double radius;

  ProfileImage({
    Key? key,
    required this.imageLink,
    this.showEditButton = true,
    this.radius = 30,
  }) : super(key: key);

  final DoctorProfileController profileController =
      Get.put(DoctorProfileController());

  @override
  Widget build(BuildContext context) {
    // Initialize with the provided image link
    profileController.setInitialImage(imageLink);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 6),
      child: Stack(
        children: [
          // Profile Image Circle
          Obx(() {
            final currentImage = profileController.profileImageUrl.value;
            final selectedImage = profileController.selectedImage.value;

            return CircleAvatar(
              radius: radius,
              backgroundColor: Colors.grey[400],
              child: ClipOval(
                child: _buildImageContent(currentImage, selectedImage),
              ),
            );
          }),

          // Edit Button
          if (showEditButton) _buildEditButton(),
        ],
      ),
    );
  }

  Widget _buildImageContent(String currentImage, File? selectedImage) {
    // If user selected a new image, show it
    if (selectedImage != null) {
      return Image.file(
        selectedImage,
        fit: BoxFit.cover,
        width: radius * 2,
        height: radius * 2,
      );
    }

    // If network image exists, show it
    if (currentImage.isNotEmpty && currentImage.startsWith('http')) {
      return Image.network(
        currentImage,
        fit: BoxFit.cover,
        width: radius * 2,
        height: radius * 2,
        errorBuilder: (context, error, stackTrace) {
          return _buildPlaceholderIcon();
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return _buildLoadingIndicator();
        },
      );
    }

    // If local image path exists (for demo)
    if (currentImage.isNotEmpty && !currentImage.startsWith('http')) {
      return Image.file(
        File(currentImage),
        fit: BoxFit.cover,
        width: radius * 2,
        height: radius * 2,
        errorBuilder: (context, error, stackTrace) {
          return _buildPlaceholderIcon();
        },
      );
    }

    // Default placeholder
    return _buildPlaceholderIcon();
  }

  Widget _buildPlaceholderIcon() {
    return Icon(
      Icons.person,
      color: Colors.white,
      size: radius * 2 * 0.6,
    );
  }

  Widget _buildLoadingIndicator() {
    return SizedBox(
      width: radius * 2,
      height: radius * 2,
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
    );
  }

  Widget _buildEditButton() {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Obx(() {
        if (profileController.isLoading.value) {
          return Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: SizedBox(
              width: 12,
              height: 12,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          );
        }

        return GestureDetector(
          onTap: profileController.showImageSourceDialog,
          child: Container(
            padding: EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 2),
            ),
            child: Icon(
              Icons.edit,
              color: Colors.white,
              size: 12,
            ),
          ),
        );
      }),
    );
  }
}
