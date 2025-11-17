import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../core/colors.dart';
import '../../../../wigets/appbar_title.dart';
import '../../details_book_view.dart';
import '../controllers/books_controller.dart';

class BooksView extends GetView<BooksController> {
  const BooksView({super.key});

  @override
  Widget build(BuildContext context) {
    final String query = Get.arguments ?? "diabetes"; // fallback if none
    Future.microtask(() => controller.fetchBooks(query));

    return Scaffold(
      backgroundColor: background,
      appBar: AppbarTitle("Medical Books"),
      body: Column(
        children: [

          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                itemCount: controller.books.length,
                itemBuilder: (context, index) {
                  final book = controller.books[index];
                  return ListTile(
                    leading: book.thumbnail != null
                        ? Image.network(book.thumbnail!, width: 50)
                        : const Icon(Icons.book),
                    title: Text(book.title),
                    subtitle: Text(book.authors.join(', ')),
                    onTap: () => Get.to(() => DetailsView(book: book)),
                  );
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}


