import 'package:flutter_riverpod/legacy.dart';
import 'package:share_prompt/services/models/user_profile_model.dart';
import 'package:share_prompt/services/services/profile_service.dart'
    as profile_service;

final userProfileProvider =
    StateNotifierProvider<UserProfileNotifier, UserProfileModel?>(
      (ref) => UserProfileNotifier(),
    );

class UserProfileNotifier extends StateNotifier<UserProfileModel?> {
  UserProfileNotifier() : super(null);

  Future<void> getUserProfile(int userId) async {
    final profile = await profile_service.getUserProfile(userId);

    if (!mounted) return;
    state = profile;
  }
}
