import 'package:crm/app/modules/web_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../data/model/book_model.dart';

class DetailsView extends StatelessWidget {
  final BookModel book;
  const DetailsView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (book.thumbnail != null)
              Image.network(book.thumbnail!, height: 200),
            const SizedBox(height: 12),
            Text(book.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text("By ${book.authors.join(', ')}"),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Text(book.description ?? 'No Description'),
              ),
            ),
            const SizedBox(height: 16),
            if (book.previewLink != null)
              ElevatedButton(
                onPressed: () {
                  Get.to(() => WebViewPage(url: book.previewLink.toString()));
                },
                child: const Text("Preview Book"),
              )
          ],
        ),
      ),
    );
  }
}
