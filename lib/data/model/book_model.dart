class BookModel {
  final String title;
  final String? thumbnail;
  final String? description;
  final List<String> authors;
  final String? previewLink;

  BookModel({
    required this.title,
    this.thumbnail,
    this.description,
    required this.authors,
    this.previewLink,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    final volume = json['volumeInfo'];
    return BookModel(
      title: volume['title'] ?? '',
      thumbnail: volume['imageLinks']?['thumbnail'],
      description: volume['description'],
      authors: List<String>.from(volume['authors'] ?? []),
      previewLink: volume['previewLink'],
    );
  }
}
