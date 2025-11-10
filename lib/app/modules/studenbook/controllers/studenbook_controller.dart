import 'package:crm/data/model/student_book_model.dart';
import 'package:crm/data/remote/student_book_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class StudenbookController extends GetxController {
  var isLoading = false.obs;
  var bookList = <StudentBookModel>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getStudentBooks();
  }

  void getStudentBooks() async {
    isLoading(true);
    try {
      bookList.value = await StudentBookService.getStudentBooks();
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Error", e.toString());
    }
    isLoading(false);
  }
}
