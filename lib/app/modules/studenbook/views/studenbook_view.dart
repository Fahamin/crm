import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../pdfdownload/views/pdfdownload_view.dart';
import '../controllers/studenbook_controller.dart';

class StudenbookView extends GetView<StudenbookController> {
  const StudenbookView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Books'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => controller.getStudentBooks(),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.bookList.isEmpty) {
          return const Center(child: Text('No books found.'));
        }

        return ListView.builder(
          itemCount: controller.bookList.length,
          itemBuilder: (context, index) {
            final book = controller.bookList[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: ListTile(
                title: Text(
                  book.tITLE.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Year: ${book.yEAROF} Prof'),
                  ],
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle book tap (e.g., open PDF)
                  Get.toNamed(Routes.PDFDOWNLOAD,
                      arguments:
                          "http://www.elife.navanapharma.com/profile_image/${book.fILENAME}");
                },
              ),
            );
          },
        );
      }),
    );
  }
}
