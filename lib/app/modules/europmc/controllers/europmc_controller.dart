import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../core/model/europe_PMC_article.dart';

class EuropmcController extends GetxController {
  var articles = <EuropePMCArticle>[].obs;
  var isLoading = true.obs;


  void fetchArticles(String query) async {
    isLoading(true);
    final url = 'https://www.ebi.ac.uk/europepmc/webservices/rest/search?query=$query&format=json';

    try {
      final response = await http.get(Uri.parse(url));
      final data = json.decode(response.body);
      final List results = data['resultList']['result'];

      articles.value =
          results.map((e) => EuropePMCArticle.fromJson(e)).toList();
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading(false);
    }
  }
}
