import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FeedbackController extends GetxController {
  var selectedQ1 = ''.obs;
  final List<String> q1 = ['Highly Satisfied', 'Satisfied', 'Need Improvement', 'Dissatisfied','Highly Dissatisfied'];

  void setSelectedQ1(String value) {
    selectedQ1.value = value;

  }

  var selectedQ2 = ''.obs;
  final List<String> q2 = ['Fast', 'Fast Enough', 'Need to be faster', 'Slow','Very Slow'];

  void setSelectedQ2(String value) {
    selectedQ2.value = value;
  }

  var selectedQ3 = ''.obs;
  final List<String> q3 =['Highly Satisfied', 'Satisfied', 'Need Improvement', 'Dissatisfied','Highly Dissatisfied'];

  void setSelectedQ3(String value) {
    selectedQ3.value = value;
  }

  var selectedQ4 = ''.obs;
  final List<String> q4 = ['Very well informed', 'Informed', 'Sufficiently informed', 'Not well informed', 'Poorly informed'];

  void setSelectedQ4(String value) {
    selectedQ4.value = value;
  }


  var selectedQ5 = ''.obs;
  final List<String> q5 = ['Too thick', 'Non Gel-Pen', 'Poor Charge', 'Not Sync'];

  void setSelectedQ5(String value) {
    selectedQ5.value = value;
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



  void submitData()
  {
    debugPrint(selectedQ1.value);
    debugPrint(selectedQ2.value);
    debugPrint(selectedQ3.value);
    debugPrint(selectedQ4.value);
    debugPrint(selectedQ5.value);
    debugPrint(selectedQ6.text);
    debugPrint(selectedQ7.text);

  }
}
