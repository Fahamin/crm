import 'dart:convert';

import 'package:crm/data/model/student_book_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class StudentBookService {
  static Future<List<StudentBookModel>> getStudentBooks() async {
    final searchUrl = 'http://nplelife.com/get_NPL/crm_get_books.php';

    var response = await http.post(
      Uri.parse(searchUrl),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      body: {
        "user_type": "1",
      },
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      debugPrint('Response data: $data');

      // Check if data is a List
      if (data is List) {
        return data.map((item) => StudentBookModel.fromJson(item)).toList();
      } else {
        throw Exception('Expected List but got ${data.runtimeType}');
      }
    } else {
      throw Exception(
          'Failed to fetch books. Status code: ${response.statusCode}');
    }
  }
}
