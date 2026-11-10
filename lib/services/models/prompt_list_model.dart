import 'package:share_prompt/services/models/prompt_card_model.dart';

class PromptListModel {
  final List<PromptCardModel> prompts;

  PromptListModel({required this.prompts});

  factory PromptListModel.fromJson(List<dynamic> json) {
    return PromptListModel(
      prompts: json
          .map((item) => PromptCardModel.fromJson(
        item as Map<String, dynamic>,
      ))
          .toList(),
    );
  }
}