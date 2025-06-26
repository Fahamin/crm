class MyhumanContent {
  final String contentId;
  final String title;
  final String thumbnailUrl;
  final String contentUrl;
  final DateTime authoredDate;
  final String contentType;
  final List<String> accessibility;
  final List<Team>? teams;
  final ContentFlags flags;

  MyhumanContent({
    required this.contentId,
    required this.title,
    required this.thumbnailUrl,
    required this.contentUrl,
    required this.authoredDate,
    required this.contentType,
    required this.accessibility,
    this.teams,
    required this.flags,
  });

  factory MyhumanContent.fromJson(Map<String, dynamic> json) {
    return MyhumanContent(
      contentId: json['content_id'],
      title: json['content_title'] ?? 'Untitled',
      thumbnailUrl: json['content_thumbnail_url'],
      contentUrl: json['content_url'],
      authoredDate: DateTime.parse(json['content_authored_date']),
      contentType: json['content_type'],
      accessibility: List<String>.from(json['content_accessibility']),
      teams: json['content_teams'] != null
          ? List<Team>.from(json['content_teams']!.map((x) => Team.fromJson(x)))
          : null,
      flags: ContentFlags.fromJson(json['content_flags']),
    );
  }
}

class Team {
  final String teamId;
  final String teamName;

  Team({required this.teamId, required this.teamName});

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      teamId: json['team_id'],
      teamName: json['team_name'],
    );
  }
}

class ContentFlags {
  final bool isAnimated;
  final bool isTour;
  final bool isQuiz;

  ContentFlags({
    required this.isAnimated,
    required this.isTour,
    required this.isQuiz,
  });

  factory ContentFlags.fromJson(Map<String, dynamic> json) {
    return ContentFlags(
      isAnimated: json['is_animated'] ?? false,
      isTour: json['is_tour'] ?? false,
      isQuiz: json['is_quiz'] ?? false,
    );
  }
}