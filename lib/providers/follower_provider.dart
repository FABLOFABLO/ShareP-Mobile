import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:share_prompt/services/models/follower_list_model.dart';
import 'package:share_prompt/services/services/follow_service.dart'
    as follow_service;

final followerProvider = StateNotifierProvider.autoDispose
    .family<FollowerNotifier, AsyncValue<FollowerListModel>, int>(
      (ref, userId) => FollowerNotifier(),
    );

class FollowerNotifier extends StateNotifier<AsyncValue<FollowerListModel>> {
  FollowerNotifier() : super(const AsyncLoading());

  Future<void> getFollowerList(int userId) async {
    state = const AsyncLoading();

    try {
      final followerList = await follow_service.getFollowerList(userId);

      if (!mounted) return;
      state = AsyncData(followerList);
    } catch (error, stackTrace) {
      if (!mounted) return;
      state = AsyncError(error, stackTrace);
    }
  }
}
