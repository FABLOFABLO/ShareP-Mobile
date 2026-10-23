import 'package:share_prompt/services/models/common_profile_model.dart';
import 'package:share_prompt/services/models/prompt_card_model.dart';

class MyProfileModel {
  final CommonProfileModel base;
  final List<PromptCardModel> liked;

  MyProfileModel({required this.base, required this.liked});

  factory MyProfileModel.fromJson(Map<String, dynamic> json) {
    return MyProfileModel(
      base: CommonProfileModel.fromJson(json),
      liked: (json['liked'] as List<dynamic>)
          .map((item) => PromptCardModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }
}
