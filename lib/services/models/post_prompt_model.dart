class PostPromptModel {
  const PostPromptModel({
    required this.title,
    required this.description,
    required this.tag,
    required this.prompt
  });

  final String title;
  final String description;
  final String tag;
  final String prompt;

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'tag': tag,
    'prompt': prompt,
  };
}