import 'package:flutter_riverpod/legacy.dart';
import '../services/models/common_profile_model.dart';
import '../services/models/user_profile_model.dart';
import '../services/models/prompt_card_model.dart';

final UserProfileModel userProfile = UserProfileModel(
  base: CommonProfileModel(
    userId: 1,
    name: '한지석',
    promptCount: 1,
    followerCount: 12,
    followingCount: 5,
    prompts: [
      PromptCardModel(
          promptId: 1,
          title: "앨범 커버 프롬프트 뿌림",
          date: "2026-07-12 10:13:37",
          description: "AI가 몽환적인 인디 앨범 커버 만들어주는 프롬프트 뿌림",
          tag: "이미지",
          like: 16
      )
    ],
  ),
  isFollowing: false,
);

final userProfileProvider =
StateNotifierProvider<UserProfileNotifier, UserProfileModel>(
      (ref) => UserProfileNotifier(),
);

class UserProfileNotifier extends StateNotifier<UserProfileModel> {
  UserProfileNotifier() : super(userProfile);
}
