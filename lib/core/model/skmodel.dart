class SketchfabModel {
  final String name;
  final String thumbnailUrl;
  final String uid;

  SketchfabModel({
    required this.name,
    required this.thumbnailUrl,
    required this.uid,
  });

  factory SketchfabModel.fromJson(Map<String, dynamic> json) {
    return SketchfabModel(
      name: json['name'],
      uid: json['uid'],
      thumbnailUrl: json['thumbnails']['images'][0]['url'],
    );
  }
}