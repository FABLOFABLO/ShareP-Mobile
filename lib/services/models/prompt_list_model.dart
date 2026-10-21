import 'package:share_prompt/services/models/prompt_card_model.dart';

class PromptListModel {
  final List<PromptCardModel> prompts;

  PromptListModel({
    required this.prompts
  });

  factory PromptListModel.fromJson(Map<String, dynamic> json) {
    return PromptListModel(
        prompts: json['prompts']
    );
  }
}
