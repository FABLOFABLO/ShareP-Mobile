import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:share_prompt/services/models/following_list_model.dart';
import 'package:share_prompt/services/services/follow_service.dart'
    as follow_service;

final followingProvider = StateNotifierProvider.autoDispose
    .family<FollowingNotifier, AsyncValue<FollowingListModel>, int>(
      (ref, userId) => FollowingNotifier(),
    );

class FollowingNotifier extends StateNotifier<AsyncValue<FollowingListModel>> {
  FollowingNotifier() : super(const AsyncLoading());

  Future<void> getFollowingList(int userId) async {
    state = const AsyncLoading();

    try {
      final followingList = await follow_service.getFollowingList(userId);

      if (!mounted) return;
      state = AsyncData(followingList);
    } catch (error, stackTrace) {
      if (!mounted) return;
      state = AsyncError(error, stackTrace);
    }
  }
}
