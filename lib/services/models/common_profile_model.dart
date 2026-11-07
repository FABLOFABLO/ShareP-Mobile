import 'package:share_prompt/services/models/prompt_card_model.dart';

class CommonProfileModel {
  final int userId;
  final String name;
  final int followerCount;
  final int followingCount;
  final int promptsCount;
  final List<PromptCardModel> prompts;

  CommonProfileModel({
    required this.userId,
    required this.name,
    required this.followerCount,
    required this.followingCount,
    required this.prompts,
    required this.promptsCount,
  });

  factory CommonProfileModel.fromJson(Map<String, dynamic> json) {
    return CommonProfileModel(
      userId: json['user_id'] as int,
      name: json['nickname'] as String,
      followerCount: json['follower'] as int,
      followingCount: json['following'] as int,
      promptsCount: json['prompt_count'] as int,
      prompts: (json['prompts'] as List<dynamic>)
          .map((item) => PromptCardModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
