class PromptDetailModel {
  final int promptId;
  final String title;
  final String description;
  final String tag;
  final String date;
  final int like;
  final String prompt;
  final String author;
  final int followerCount;
  final bool isFollowing;

  PromptDetailModel({
    required this.promptId,
    required this.title,
    required this.description,
    required this.tag,
    required this.date,
    required this.like,
    required this.prompt,
    required this.author,
    required this.followerCount,
    required this.isFollowing,
  });

  factory PromptDetailModel.fromJson(Map<String, dynamic> json) {
    return PromptDetailModel(
      promptId: json['prompt-id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      tag: json['tag'] as String,
      date: json['date'] as String,
      like: json['like'] as int,
      followerCount: json['follower-count'] as int,
      isFollowing: json['is-following'] as bool,
      prompt: json['prompt'] as String,
      author: json['author'] as String
    );
  }
}
