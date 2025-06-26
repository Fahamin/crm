import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/myhuman_controller.dart';

class MyhumanCollectionView extends GetView<MyhumanController> {
  const MyhumanCollectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyHuman Collection'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.fetchMyHumanCollection,
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(controller.errorMessage.value),
                ElevatedButton(
                  onPressed: controller.fetchMyHumanCollection,
                  child: const Text('Retry'),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          itemCount: controller.collection.length,
          itemBuilder: (context, index) {
            final item = controller.collection[index];
            return Card(
              margin: const EdgeInsets.all(8),
              child: InkWell(
                onTap: () => _openContent(item.contentUrl),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Thumbnail image
                      SizedBox(
                        height: 200,
                        width: double.infinity,
                        child: CachedNetworkImage(
                          imageUrl: item.thumbnailUrl,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Title
                      Text(
                        item.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      // Metadata
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 16,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${item.authoredDate.day}/${item.authoredDate.month}/${item.authoredDate.year}',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                          const SizedBox(width: 16),
                          if (item.teams != null && item.teams!.isNotEmpty)
                            Row(
                              children: [
                                Icon(
                                  Icons.group,
                                  size: 16,
                                  color: Colors.grey[600],
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  item.teams!.first.teamName,
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }

  void _openContent(String url) {
    Get.defaultDialog(
      title: 'Open Content',
      middleText: 'Would you like to open this content in a browser?',
      textConfirm: 'Open',
      textCancel: 'Cancel',
      onConfirm: () {
        Get.back();
        // Implement with url_launcher
        // launchUrl(Uri.parse(url));
      },
    );
  }
}
