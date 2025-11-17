import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/local_stroage_service.dart';

class DoctorProfileController extends GetxController {

  var profileImageUrl = ''.obs;
  var isLoading = false.obs;
  var selectedImage = Rx<File?>(null);
  var localStorageService = Get.find<LocalStorageService>();

  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    localStorageService = await LocalStorageService.getInstance();
  }

  String? get userType => localStorageService.userType;
  String? get userName => localStorageService.userName;
  String? get userEmail => localStorageService.userEmail;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController degreeController = TextEditingController();
  final TextEditingController specialityController = TextEditingController();
  final TextEditingController registerController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController chamberController = TextEditingController();

  // Initialize with existing image
  void setInitialImage(String imageUrl) {
    profileImageUrl.value = imageUrl;
  }

  void submitData() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    } else {
      Get.snackbar("Error", "Please Enter All Data");
      return;
    }
  }

  // Image picker method
  Future<void> pickImage(ImageSource source) async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile = await picker.pickImage(
        source: source,
        maxWidth: 500,
        maxHeight: 500,
        imageQuality: 80,
      );

      if (pickedFile != null) {
        selectedImage.value = File(pickedFile.path);
        await uploadImageToServer(File(pickedFile.path));
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick image: $e',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  // Upload image to server
  Future<void> uploadImageToServer(File imageFile) async {
    try {
      isLoading.value = true;

      // TODO: Replace with your actual API call
      // Example:
      // var response = await ApiService.uploadProfileImage(imageFile);
      // if (response.success) {
      //   profileImageUrl.value = response.imageUrl;
      //   Get.snackbar('Success', 'Profile image updated successfully');
      // }

      // Simulate API call delay
      await Future.delayed(Duration(seconds: 2));

      // For demo, we'll use the local file path
      profileImageUrl.value = imageFile.path;

      Get.snackbar(
        'Success',
        'Profile image updated successfully',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to upload image: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Show image source selection dialog
  void showImageSourceDialog() {
    Get.dialog(
      AlertDialog(
        title: Text('Choose Image Source'),
        content: Text('Select where to pick image from'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              pickImage(ImageSource.camera);
            },
            child: Text('Camera'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              pickImage(ImageSource.gallery);
            },
            child: Text('Gallery'),
          ),
          TextButton(
            onPressed: () => Get.back(),
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
