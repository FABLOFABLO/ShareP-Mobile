import 'package:flutter_riverpod/legacy.dart';
import 'package:share_prompt/services/models/prompt_list_model.dart';
import '../services/models/prompt_card_model.dart';

final PromptListModel promptList = PromptListModel(
  prompts: [
    PromptCardModel(
      promptId: 1,
      title: "앨범 커버 프롬프트 뿌림",
      date: DateTime.parse("2026-07-12 10:13:37"),
      description: "AI가 몽환적인 인디 앨범 커버 만들어주는 프롬프트 뿌림",
      tag: "image",
      like: 16,
    ),
    PromptCardModel(
      promptId: 6,
      title: "사이버펑크 앨범 커버",
      date: DateTime.parse("2026-07-12 10:13:37"),
      description: "AI가 사이버펑크 앨범 커버 만들어주는 프롬프트",
      tag: "image",
      like: 10,
    ),
  ],
);

final promptListProvider =
    StateNotifierProvider<PromptListNotifier, PromptListModel>(
      (ref) => PromptListNotifier(),
    );

class PromptListNotifier extends StateNotifier<PromptListModel> {
  PromptListNotifier() : super(promptList);
}
