import 'package:get/get.dart';
import '../../../../core/pubmed_serive.dart';

class PubmedController extends GetxController {
  final PubMedService _service = PubMedService();

  var isLoading = false.obs;
  var articles = <Map<String, String>>[].obs;



  void fetchPubMedArticles(String query) async {
    try {
      isLoading.value = true;
      final ids = await _service.searchArticles(query);
      final data = await _service.fetchSummaries(ids);
      articles.value = data;
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
