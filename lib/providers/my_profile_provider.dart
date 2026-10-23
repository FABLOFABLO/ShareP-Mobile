import 'package:flutter_riverpod/legacy.dart';
import '../services/models/common_profile_model.dart';
import '../services/models/my_profile_model.dart';
import '../services/models/prompt_card_model.dart';

final MyProfileModel myProfile = MyProfileModel(
  base: CommonProfileModel(
    userId: 1,
    name: '김지우',
    promptCount: 1,
    followerCount: 12,
    followingCount: 5,
    prompts: [
      PromptCardModel(
        promptId: 1,
        title: "앨범 커버 프롬프트 뿌림",
        date: DateTime.parse("2026-07-12 10:13:37"),
        description: "AI가 몽환적인 인디 앨범 커버 만들어주는 프롬프트 뿌림",
        tag: "이미지",
        like: 16,
      ),
    ],
  ),
  liked: [
    PromptCardModel(
      promptId: 6,
      title: "사이버펑크 앨범 커버",
      date: DateTime.parse("2026-07-12 10:13:37"),
      description: "AI가 사이버펑크 앨범 커버 만들어주는 프롬프트",
      tag: "이미지",
      like: 10,
    ),
    PromptCardModel(
      promptId: 6,
      title: "사이버펑크 앨범 커버",
      date: DateTime.parse("2026-07-12 10:13:37"),
      description: "AI가 사이버펑크 앨범 커버 만들어주는 프롬프트",
      tag: "이미지",
      like: 10,
    ),
  ],
);

final myProfileProvider =
    StateNotifierProvider<MyProfileNotifier, MyProfileModel>(
      (ref) => MyProfileNotifier(),
    );

class MyProfileNotifier extends StateNotifier<MyProfileModel> {
  MyProfileNotifier() : super(myProfile);
}
