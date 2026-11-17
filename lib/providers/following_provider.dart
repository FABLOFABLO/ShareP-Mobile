import 'package:flutter_riverpod/legacy.dart';
import 'package:share_prompt/services/models/following_list_model.dart';
import 'package:share_prompt/services/services/follow_service.dart' as follow_service;

final followingProvider =
StateNotifierProvider.family<
    FollowingNotifier,
    FollowingListModel?,
    int
>(
      (ref, userId) => FollowingNotifier(),
);

class FollowingNotifier extends StateNotifier<FollowingListModel?> {
  FollowingNotifier() : super(null);

  Future<void> getFollowingList(int userId) async {
    final followingList = await follow_service.getFollowingList(userId);

    if (!mounted) return;
    state = followingList;
  }
}