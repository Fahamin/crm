import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/video_model.dart';



class VideoService {
  static const String _apiKey = 'AIzaSyCRu5PZeiPh84d5AEdJxx7_6Z5LQqWjqiI';
  static const String _baseUrl = 'https://www.googleapis.com/youtube/v3';

  static Future<List<VideoModel>> searchVideos(String query) async {
    final url =
        '$_baseUrl/search?part=snippet&q=$query&type=video&maxResults=150&key=$_apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data['items'] as List)
          .map((e) => VideoModel.fromJson(e))
          .toList();
    } else {
      throw Exception("Failed to load videos");
    }
  }
}
