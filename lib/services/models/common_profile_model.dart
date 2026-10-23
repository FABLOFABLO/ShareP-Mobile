import 'package:share_prompt/services/models/prompt_card_model.dart';

class CommonProfileModel {
  final int userId;
  final String name;
  final int promptCount;
  final int followerCount;
  final int followingCount;
  final List<PromptCardModel> prompts;

  CommonProfileModel({
    required this.userId,
    required this.name,
    required this.promptCount,
    required this.followerCount,
    required this.followingCount,
    required this.prompts,
  });

  factory CommonProfileModel.fromJson(Map<String, dynamic> json) {
    return CommonProfileModel(
      userId: json['user-id'] as int,
      name: json['nickname'] as String,
      promptCount: json['prompt-count'] as int,
      followerCount: json['follower'] as int,
      followingCount: json['following'] as int,
      prompts: (json['prompts'] as List<dynamic>)
          .map((item) => PromptCardModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
