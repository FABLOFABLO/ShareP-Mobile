import 'package:flutter_riverpod/legacy.dart';
import '../services/models/prompt_card_model.dart';

final List<PromptCardModel> promptCards = [
  PromptCardModel(
    title: '브랜드 로고 디자인 프롬프트',
    description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
    tag: '로고',
    date: '3시간 전',
    like: 12,
    promptId: 19,
  ),
  PromptCardModel(
    title: '브랜드 로고 디자인 프롬프트',
    description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
    tag: '로고',
    date: '3시간 전',
    like: 12,
    promptId: 20,
  ),
  PromptCardModel(
    title: '브랜드 로고 디자인 프롬프트',
    description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
    tag: '로고',
    date: '3시간 전',
    like: 12,
    promptId: 21,
  ),
  PromptCardModel(
    title: '브랜드 로고 디자인 프롬프트',
    description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
    tag: '로고',
    date: '3시간 전',
    like: 12,
    promptId: 22,
  ),
  PromptCardModel(
    title: '브랜드 로고 디자인 프롬프트',
    description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
    tag: '로고',
    date: '3시간 전',
    like: 12,
    promptId: 23,
  ),
  PromptCardModel(
    title: '브랜드 로고 디자인 프롬프트',
    description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
    tag: '로고',
    date: '3시간 전',
    like: 12,
    promptId: 24,
  ),
  PromptCardModel(
    title: '브랜드 로고 디자인 프롬프트',
    description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
    tag: '로고',
    date: '3시간 전',
    like: 12,
    promptId: 25,
  ),
  PromptCardModel(
    title: '브랜드 로고 디자인 프롬프트',
    description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
    tag: '로고',
    date: '3시간 전',
    like: 12,
    promptId: 26,
  ),
  PromptCardModel(
    title: '브랜드 로고 디자인 프롬프트',
    description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
    tag: '로고',
    date: '3시간 전',
    like: 12,
    promptId: 27,
  ),
  PromptCardModel(
    title: '브랜드 로고 디자인 프롬프트',
    description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
    tag: '로고',
    date: '3시간 전',
    like: 12,
    promptId: 28,
  ),
  PromptCardModel(
    title: '브랜드 로고 디자인 프롬프트',
    description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
    tag: '로고',
    date: '3시간 전',
    like: 12,
    promptId: 29,
  ),
  PromptCardModel(
    title: '브랜드 로고 디자인 프롬프트',
    description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
    tag: '로고',
    date: '3시간 전',
    like: 12,
    promptId: 30,
  ),
  PromptCardModel(
    title: '브랜드 로고 디자인 프롬프트',
    description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
    tag: '로고',
    date: '3시간 전',
    like: 12,
    promptId: 31,
  ),
  PromptCardModel(
    title: '브랜드 로고 디자인 프롬프트',
    description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
    tag: '로고',
    date: '3시간 전',
    like: 12,
    promptId: 32,
  ),
];

final promptCardProvider =
    StateNotifierProvider<PromptCardNotifier, List<PromptCardModel>>(
      (ref) => PromptCardNotifier(),
    );

class PromptCardNotifier extends StateNotifier<List<PromptCardModel>> {
  PromptCardNotifier() : super(promptCards);
}
