import 'package:crm/core/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../wigets/appbar_title.dart';
import '../../../../wigets/journal_item.dart';
import '../../web_view_screen.dart';
import '../controllers/europmc_controller.dart';

class EuropmcView extends GetView<EuropmcController> {
  EuropmcView({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the passed search term from arguments
    final String query = Get.arguments ?? "diabetes"; // fallback if none

    // Fetch on first build
    Future.microtask(() => controller.fetchArticles(query));

    return Scaffold(
      backgroundColor: background,
      appBar:AppbarTitle("${query} Journal"),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (controller.articles.isEmpty) {
          return Center(child: Text('No articles found'));
        }

        return ListView.builder(
          itemCount: controller.articles.length,
          itemBuilder: (context, index) {
            final article = controller.articles[index];

            debugPrint(article.journal);
            return JournalItem(article);
          },
        );
      }),
    );
  }
}
