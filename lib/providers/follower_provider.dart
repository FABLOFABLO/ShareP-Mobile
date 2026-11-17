import 'package:flutter_riverpod/legacy.dart';
import 'package:share_prompt/services/models/follower_list_model.dart';
import 'package:share_prompt/services/services/follow_service.dart' as follow_service;

final followerProvider =
    StateNotifierProvider.family<FollowerNotifier, FollowerListModel?, int>(
      (ref, userId) => FollowerNotifier(),
    );

class FollowerNotifier extends StateNotifier<FollowerListModel?> {
  FollowerNotifier() : super(null);

  Future<void> getFollowerList(int userId) async {
    final followerList = await follow_service.getFollowerList(userId);

    if (!mounted) return;
    state = followerList;
  }
}
