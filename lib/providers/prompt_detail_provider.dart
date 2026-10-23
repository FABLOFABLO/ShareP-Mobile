import 'package:flutter_riverpod/legacy.dart';
import '../services/models/prompt_detail_model.dart';

final PromptDetailModel promptDetails =
  PromptDetailModel(
    title: '브랜드 로고 디자인 프롬프트',
    description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
    tag: '로고',
    date: "2026-07-12 10:13:37",
    like: 12,
    prompt:
        '당신은 친절한 프로그래밍 선생님입니다. 고등학교 1학년 학생에게 Spring Boot의 동작 원리를 설명해주세요. 어려운 용어를 사용할 때는 반드시 쉬운 뜻과 예시를 함께 제시하고, 설명이 끝나면 이해도를 확인할 수 있는 간단한 문제 3개를 출제해주세요.',
    author: '한지석',
    followerCount: 12,
    isFollowing: false,
    promptId: 19,
  );

final promptDetailProvider =
    StateNotifierProvider<PromptDetailNotifier, PromptDetailModel>(
      (ref) => PromptDetailNotifier(),
    );

class PromptDetailNotifier extends StateNotifier<PromptDetailModel> {
  PromptDetailNotifier() : super(promptDetails);
}
