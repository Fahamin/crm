import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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
}
