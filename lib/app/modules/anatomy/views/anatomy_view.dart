import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/anatomy_controller.dart';

class AnatomyView extends GetView<AnatomyController> {
   const AnatomyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return  Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage.isNotEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(controller.errorMessage.value),
                ElevatedButton(
                  onPressed: controller.fetchMyHumanCollection,
                  child:  Text('Retry'),
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
              margin:  EdgeInsets.all(8),
              child: InkWell(
                onTap: () =>
                    Get.toNamed(Routes.DMODELVIEW, arguments: item.contentUrl),
                child: Padding(
                  padding:  EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Thumbnail image
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: CachedNetworkImage(
                          imageUrl: item.thumbnailUrl,
                          fit: BoxFit.fill,
                          placeholder: (context, url) =>
                               Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                               Icon(Icons.error),
                        ),
                      ),
                       SizedBox(height: 12),
                      // Title
                      Text(
                        item.title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                       SizedBox(height: 8),
                      // Metadata
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 16,
                            color: Colors.grey[600],
                          ),
                           SizedBox(width: 4),
                          Text(
                            '${item.authoredDate.day}/${item.authoredDate.month}/${item.authoredDate.year}',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                           SizedBox(width: 16),
                          if (item.teams != null && item.teams!.isNotEmpty)
                            Row(
                              children: [
                                Icon(
                                  Icons.group,
                                  size: 16,
                                  color: Colors.grey[600],
                                ),
                                 SizedBox(width: 4),
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
}
