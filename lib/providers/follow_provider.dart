import 'package:flutter_riverpod/legacy.dart';
import 'package:share_prompt/services/services/follow_service.dart'
    as follow_service;

final followProvider = StateNotifierProvider.family<FollowNotifier, bool?, int>(
  (ref, userId) => FollowNotifier(userId),
);

class FollowNotifier extends StateNotifier<bool?> {
  FollowNotifier(this.userId) : super(null);

  final int userId;
  bool _isUpdating = false;

  Future<void> toggleFollow({required bool isFollowing}) async {
    if (_isUpdating) return;
    final currentState = state ?? isFollowing;

    _isUpdating = true;
    try {
      if (currentState) {
        await follow_service.unFollow(userId);
      } else {
        await follow_service.follow(userId);
      }

      if (mounted) state = !currentState;
    } finally {
      _isUpdating = false;
    }
  }
}
