class PromptCardModel {
  final int promptId;
  final String title;
  final String description;
  final String tag;
  final DateTime date;
  final int like;

  PromptCardModel({
    required this.promptId,
    required this.title,
    required this.description,
    required this.tag,
    required this.date,
    required this.like,
  });

  factory PromptCardModel.fromJson(Map<String, dynamic> json) {
    return PromptCardModel(
      promptId: json['prompt-id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      tag: json['tag'] as String,
      date: DateTime.parse(json['date'] as String).toLocal(),
      like: json['like'] as int,
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'tag': tag,
    'like': like,
  };
}
