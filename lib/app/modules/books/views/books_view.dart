import 'package:crm/core/text_utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../wigets/appbar_title.dart';
import '../../../routes/app_pages.dart';
import '../../pdf_read/views/pdf_read_view.dart';
import '../../web_view_screen.dart';
import '../controllers/books_controller.dart';

class BooksView extends GetView<BooksController> {
   BooksView({super.key});

  @override
  Widget build(BuildContext context) {
    final String query = Get.arguments ?? "diabetes"; // fallback if none
    Future.microtask(() => controller.searchBooks(query));

    return Scaffold(
      appBar: AppbarTitle("${query} Books"),
      body: Padding(
        padding:  EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() {
              if (controller.isLoading.value) {
                return  Center(child: CircularProgressIndicator());
              }
              if (controller.books.isEmpty) {
                return  Text("No results");
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: controller.books.length,
                  itemBuilder: (_, index) {
                    final book = controller.books[index];
                    final title = book['title'] ?? 'No Title';
                    final coverId = book['cover_i'];
                    final authors =
                        book['author_name']?.join(', ') ?? 'Unknown';
                    final year =
                        book['first_publish_year']?.toString() ?? 'N/A';
                    final publisher = book['publisher'] != null
                        ? (book['publisher'] as List).first
                        : 'N/A';
                    final url = "https://openlibrary.org${book['key']}";
                    final imageUrl = coverId != null
                        ? "https://covers.openlibrary.org/b/id/$coverId-M.jpg"
                        : null;
                    final iaId = book['ia'];

                    return Card(
                      margin:  EdgeInsets.symmetric(
                          vertical: 8, horizontal: 4),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                          contentPadding:  EdgeInsets.all(10),
                          leading: imageUrl != null
                              ? Image.network(imageUrl,
                                  width: 60, fit: BoxFit.cover)
                              :  Icon(Icons.book, size: 60),
                          title: Text(title,
                              style:
                                   TextStyle(fontWeight: FontWeight.bold)),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Author: $authors"),
                              Text("Publisher: $publisher"),
                              Text("First Published: $year"),
                            ],
                          ),
                          onTap: () {

                              // fallback to WebView
                              final url =
                                  "https://openlibrary.org${book['key']}?mode=read";
                              Get.to(() => WebViewPage(url: url));

                          }),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
