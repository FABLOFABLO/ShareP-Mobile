import 'package:flutter_riverpod/legacy.dart';
import 'package:share_prompt/model/prompt_card_model.dart';

final List<PromptCardModel> promptCards = [
  PromptCardModel(
    title: '브랜드 로고 디자인 프롬프트',
    description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
    tag: '로고',
    time: '3시간 전',
    like: 12,
    id: 19,
  ),
  PromptCardModel(
    title: '브랜드 로고 디자인 프롬프트',
    description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
    tag: '로고',
    time: '3시간 전',
    like: 12,
    id: 20,
  ),
  PromptCardModel(
    title: '브랜드 로고 디자인 프롬프트',
    description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
    tag: '로고',
    time: '3시간 전',
    like: 12,
    id: 21,
  ),
  PromptCardModel(
    title: '브랜드 로고 디자인 프롬프트',
    description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
    tag: '로고',
    time: '3시간 전',
    like: 12,
    id: 22,
  ),
  PromptCardModel(
    title: '브랜드 로고 디자인 프롬프트',
    description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
    tag: '로고',
    time: '3시간 전',
    like: 12,
    id: 23,
  ),
  PromptCardModel(
    title: '브랜드 로고 디자인 프롬프트',
    description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
    tag: '로고',
    time: '3시간 전',
    like: 12,
    id: 24,
  ),
  PromptCardModel(
    title: '브랜드 로고 디자인 프롬프트',
    description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
    tag: '로고',
    time: '3시간 전',
    like: 12,
    id: 25,
  ),
  PromptCardModel(
    title: '브랜드 로고 디자인 프롬프트',
    description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
    tag: '로고',
    time: '3시간 전',
    like: 12,
    id: 26,
  ),
  PromptCardModel(
    title: '브랜드 로고 디자인 프롬프트',
    description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
    tag: '로고',
    time: '3시간 전',
    like: 12,
    id: 27,
  ),
  PromptCardModel(
    title: '브랜드 로고 디자인 프롬프트',
    description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
    tag: '로고',
    time: '3시간 전',
    like: 12,
    id: 28,
  ),
  PromptCardModel(
    title: '브랜드 로고 디자인 프롬프트',
    description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
    tag: '로고',
    time: '3시간 전',
    like: 12,
    id: 29,
  ),
  PromptCardModel(
    title: '브랜드 로고 디자인 프롬프트',
    description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
    tag: '로고',
    time: '3시간 전',
    like: 12,
    id: 30,
  ),
  PromptCardModel(
    title: '브랜드 로고 디자인 프롬프트',
    description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
    tag: '로고',
    time: '3시간 전',
    like: 12,
    id: 31,
  ),
  PromptCardModel(
    title: '브랜드 로고 디자인 프롬프트',
    description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
    tag: '로고',
    time: '3시간 전',
    like: 12,
    id: 32,
  ),
];

final promptsProvider =
    StateNotifierProvider<PromptsNotifier, List<PromptCardModel>>(
      (ref) => PromptsNotifier(),
    );

class PromptsNotifier extends StateNotifier<List<PromptCardModel>> {
  PromptsNotifier() : super(promptCards);
}
