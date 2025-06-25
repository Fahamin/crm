import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FeedbackController extends GetxController {
  var selectedQ1 = ''.obs;
  final List<String> q1 = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];

  void setSelectedQ1(String value) {
    selectedQ1.value = value;

  }

  var selectedQ2 = ''.obs;
  final List<String> q2 = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];

  void setSelectedQ2(String value) {
    selectedQ2.value = value;
  }

  var selectedQ3 = ''.obs;
  final List<String> q3 = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];

  void setSelectedQ3(String value) {
    selectedQ3.value = value;
  }

  var selectedQ4 = ''.obs;
  final List<String> q4 = ['Option 1', 'Option 2', 'Option 3', 'Option 4'];

  void setSelectedQ4(String value) {
    selectedQ4.value = value;
  }



  // For multiple selection (checkboxes)
  var selectedCheckbox = <String>[].obs;

  void toggleSelection(String item) {
    if (selectedCheckbox.contains(item)) {
      selectedCheckbox.remove(item);
    } else {
      selectedCheckbox.add(item);
    }
  }

  final TextEditingController selectedQ6 = TextEditingController();
  final TextEditingController selectedQ7 = TextEditingController();

  var isLoading = false.obs;


}
