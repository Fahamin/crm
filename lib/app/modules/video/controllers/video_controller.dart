import 'package:get/get.dart';

import '../../../../data/remote/video_service.dart';
import '../../../../data/model/video_model.dart';

class VideoController extends GetxController {
  var videos = <VideoModel>[].obs;
  var isLoading = false.obs;

  void searchVideos(var que) async {
    isLoading(true);
    try {
      videos.value = await VideoService.searchVideosByViews(que);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    isLoading(false);
  }

}
