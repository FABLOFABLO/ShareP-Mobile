import 'package:flutter_riverpod/legacy.dart';
import 'package:share_prompt/model/profile_card_model.dart';

final ProfileCardModel profileCard = ProfileCardModel(
  isProfile: true,
  name: '한지석',
  promptCount: 124,
  followerCount: 4,
  followingCount: 560,
);

final profileProvider =
    StateNotifierProvider<ProfileNotifier, ProfileCardModel>(
      (ref) => ProfileNotifier(),
    );

class ProfileNotifier extends StateNotifier<ProfileCardModel> {
  ProfileNotifier() : super(profileCard);
}
