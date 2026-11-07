import 'package:flutter_riverpod/legacy.dart';
import 'package:share_prompt/services/models/my_profile_model.dart';
import 'package:share_prompt/services/services/profile_service.dart'
    as profile_service;

final myProfileProvider =
    StateNotifierProvider<MyProfileNotifier, MyProfileModel?>(
      (ref) => MyProfileNotifier(),
    );

class MyProfileNotifier extends StateNotifier<MyProfileModel?> {
  MyProfileNotifier() : super(null);

  Future<void> getMyProfile() async {
    final profile = await profile_service.getMyProfile();

    if (!mounted) return;
    state = profile;
  }
}
