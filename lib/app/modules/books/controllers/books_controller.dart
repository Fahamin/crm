import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../../data/model/book_model.dart';

class BooksController extends GetxController {
  var searchText = ''.obs;
  var isLoading = false.obs;
  var books = [].obs;

  Future<void> searchBooks(String query) async {
    isLoading.value = true;
    final url = 'https://openlibrary.org/search.json?q=$query';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      books.value = data['docs'];
    }
    isLoading.value = false;
  }

  


  Future<void> fetchBooks(String query) async {
    isLoading.value = true;
    final url =
        Uri.parse("https://www.googleapis.com/books/v1/volumes?q=$query");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List items = data['items'] ?? [];
      books.value = items.map((e) => BookModel.fromJson(e)).toList();
      debugPrint("fahamin${books.value.length}");
    } else {
      Get.snackbar("Error", "Failed to load books");
    }

    isLoading.value = false;
  }
}
