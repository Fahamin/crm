class EuropePMCArticle {
  final String title;
  final String authorString;
  final String journal;
  final String pubYear;
  final String id;

  EuropePMCArticle({
    required this.title,
    required this.authorString,
    required this.journal,
    required this.pubYear,
    required this.id,
  });

  factory EuropePMCArticle.fromJson(Map<String, dynamic> json) {
    return EuropePMCArticle(
      title: json['title'] ?? '',
      authorString: json['authorString'] ?? '',
      journal: json['journalTitle'] ?? '',
      pubYear: json['pubYear'] ?? '',
      id: json['id'] ?? '',
    );
  }
}
