import 'package:flutter/cupertino.dart';

class PromptCardModel {
  final int promptId;
  final String title;
  final String description;
  final String tag;
  final DateTime date;
  final int like;
  final bool liked;

  PromptCardModel({
    required this.promptId,
    required this.title,
    required this.description,
    required this.tag,
    required this.date,
    required this.like,
    required this.liked,
  });

  factory PromptCardModel.fromJson(Map<String, dynamic> json) {
    debugPrint('prompt item: $json');
    return PromptCardModel(
      promptId: json['prompt_id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      tag: json['tag'] as String,
      date: DateTime.parse(json['create_at'] as String).toLocal(),
      like: json['like_count'] as int,
      liked: json['liked'] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'tag': tag,
    'like': like,
  };
}
