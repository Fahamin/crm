class VideoModel {
  final String title;
  final String videoId;

  VideoModel({
    required this.title,
    required this.videoId,
  });

  factory VideoModel.fromJson(Map<String, dynamic> json) {
    final snippet = json['snippet'] ?? {};
    final id = json['id'] ?? {};

    // Ensures videoId is always String
    final dynamic rawVideoId = id['videoId'];
    final String safeVideoId = rawVideoId?.toString() ?? '';

    return VideoModel(
      title: snippet['title']?.toString() ?? 'No Title',
      videoId: safeVideoId,
    );
  }
}
