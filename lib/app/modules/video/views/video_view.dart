import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../videoplayer.dart';
import '../controllers/video_controller.dart';

import 'package:cached_network_image/cached_network_image.dart';

class VideoView extends GetView<VideoController> {
  const VideoView({super.key});

  @override
  Widget build(BuildContext context) {
    final String query = Get.arguments ?? "diabetes"; // fallback if none
    Future.microtask(() => controller.searchVideos(query));

    return Scaffold(
      appBar: AppBar(
        title: Text("$query Videos"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Obx(() {
            if (controller.isLoading.value) {
              return const Expanded(
                child: Center(child: CircularProgressIndicator()),
              );
            }

            if (controller.videos.isEmpty) {
              return const Expanded(
                child: Center(child: Text("No videos found")),
              );
            }

            return Expanded(
              child: ListView.builder(
                itemCount: controller.videos.length,
                itemBuilder: (_, i) {
                  final video = controller.videos[i];
                  // YouTube thumbnail URL format
                  final thumbnailUrl =
                      'https://img.youtube.com/vi/${video.videoId}/0.jpg';

                  return Card(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: InkWell(
                      onTap: () {
                        Get.to(() => VideoPlayerPage(),arguments: video.videoId);
                      },
                      child: Row(
                        children: [
                          // Thumbnail image
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: CachedNetworkImage(
                              imageUrl: thumbnailUrl,
                              width: 120,
                              height: 90,
                              fit: BoxFit.cover,
                              placeholder: (context, url) => Container(
                                width: 120,
                                height: 90,
                                color: Colors.grey,
                                child: const Center(
                                    child: CircularProgressIndicator()),
                              ),
                              errorWidget: (context, url, error) => Container(
                                width: 120,
                                height: 90,
                                color: Colors.grey,
                                child: const Icon(Icons.error),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Video title
                          Expanded(
                            child: Text(
                              video.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Icon(Icons.play_circle_outline, size: 30),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }),
        ],
      ),
    );
  }
}
