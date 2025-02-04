import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ImageController extends GetxController {
  late ScrollController scrollController;
  final double scrollSpeed = 50.0; // Adjust speed

  final List<String> imagePaths = [
    "assets/images/slide/a.png",
    "assets/images/slide/b.png",
    "assets/images/slide/c.png",
    "assets/images/slide/d.png",
    "assets/images/slide/e.png",
    "assets/images/slide/f.png",
    "assets/images/slide/g.png",
    "assets/images/slide/h.png",
  ];

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
    startScrolling();
  }

  void startScrolling() {
    Future.delayed(Duration(milliseconds: 500), () {
      double maxScroll = scrollController.position.maxScrollExtent;
      animateScroll(maxScroll);
    });
  }

  void animateScroll(double maxScroll) {
    scrollController
        .animateTo(
      maxScroll,
      duration: Duration(seconds: 30), // Increase duration for slower scrolling
      curve: Curves.linear,
    )
        .then((_) {
      scrollController.jumpTo(0);
      animateScroll(maxScroll); // Restart scrolling
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
