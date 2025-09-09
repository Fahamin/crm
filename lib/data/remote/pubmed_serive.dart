import 'dart:convert';
import 'package:http/http.dart' as http;

class PubMedService {
  // Step 1: Search articles
  Future<List<String>> searchArticles(String query) async {
    final searchUrl =
        'https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esearch.fcgi?db=pubmed&term=$query&retmode=json&retmax=10';

    final response = await http.get(Uri.parse(searchUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<String> ids = List<String>.from(data['esearchresult']['idlist']);
      return ids;
    } else {
      throw Exception('Failed to fetch article IDs');
    }
  }

  // Step 2: Fetch article summaries
  Future<List<Map<String, String>>> fetchSummaries(List<String> ids) async {
    final idString = ids.join(',');
    final fetchUrl =
        'https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=pubmed&id=$idString&retmode=xml';

    final response = await http.get(Uri.parse(fetchUrl));
    if (response.statusCode == 200) {
      final xmlString = response.body;
      return _parseArticlesFromXml(xmlString);
    } else {
      throw Exception('Failed to fetch article details');
    }
  }

  // Step 3: Parse the XML manually
  List<Map<String, String>> _parseArticlesFromXml(String xml) {
    final RegExp articleRegExp = RegExp(r'<PubmedArticle>(.*?)</PubmedArticle>', dotAll: true);
    final RegExp titleRegExp = RegExp(r'<ArticleTitle>(.*?)</ArticleTitle>', dotAll: true);
    final RegExp abstractRegExp = RegExp(r'<AbstractText.*?>(.*?)</AbstractText>', dotAll: true);

    final List<Map<String, String>> articles = [];

    for (final match in articleRegExp.allMatches(xml)) {
      final articleXml = match.group(0) ?? '';
      final titleMatch = titleRegExp.firstMatch(articleXml);
      final abstractMatch = abstractRegExp.firstMatch(articleXml);

      final title = titleMatch?.group(1)?.replaceAll(RegExp(r'\s+'), ' ') ?? 'No title';
      final abstract = abstractMatch?.group(1)?.replaceAll(RegExp(r'\s+'), ' ') ?? 'No abstract';

      articles.add({'title': title, 'abstract': abstract});
    }

    return articles;
  }
}
