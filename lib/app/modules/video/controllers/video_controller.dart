import 'package:get/get.dart';

import '../../../../data/remote/service.dart';
import '../../../../data/videomodel.dart';

class VideoController extends GetxController {
  var videos = <VideoModel>[].obs;
  var isLoading = false.obs;

  void searchVideos(var que) async {
    isLoading(true);
    try {
      videos.value = await VideoService.searchVideos(que);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
    isLoading(false);
  }

}
