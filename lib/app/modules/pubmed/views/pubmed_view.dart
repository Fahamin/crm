import 'package:crm/core/colors.dart';
import 'package:crm/core/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/pubmed_controller.dart';

class PubmedView extends GetView<PubmedController> {
  @override
  Widget build(BuildContext context) {
    // Get the passed search term from arguments
    final String query = Get.arguments ?? "diabetes"; // fallback if none

    // Fetch on first build
    Future.microtask(() => controller.fetchPubMedArticles(query));

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(title: textNormal(query, Colors.white, 16.0),
        centerTitle: true,backgroundColor: background,iconTheme: IconThemeData(color: Colors.white),),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.articles.length,
          itemBuilder: (_, index) {
            final article = controller.articles[index];
            return ListTile(
              title: textNormalStart(article['title'] ?? '',Colors.white,16.0),
              subtitle: textNormalStart(
                article['abstract'] ?? '',
                Colors.white70,12.0
              ),
            );
          },
        );
      }),
    );
  }
}
