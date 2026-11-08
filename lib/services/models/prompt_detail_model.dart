class PromptDetailModel {
  final int promptId;
  final String title;
  final String description;
  final String tag;
  final String date;
  final int like;
  final String prompt;
  final String author;
  final int authorId;
  final bool isFollowing;
  final bool liked;
  final bool isAuthor;

  PromptDetailModel({
    required this.promptId,
    required this.title,
    required this.description,
    required this.tag,
    required this.date,
    required this.like,
    required this.prompt,
    required this.author,
    required this.authorId,
    required this.isFollowing,
    required this.liked,
    required this.isAuthor,
  });

  factory PromptDetailModel.fromJson(Map<String, dynamic> json) {
    return PromptDetailModel(
      promptId: json['prompt_id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      tag: json['tag'] as String,
      date: json['create_at'] as String,
      like: json['like_count'] as int,
      isFollowing: json['followed'] as bool,
      prompt: json['prompt'] as String,
      author: json['author'] as String,
      authorId: json['author_id'] as int,
      liked: json['liked'] as bool,
      isAuthor: json['is_author'] as bool
    );
  }
}
