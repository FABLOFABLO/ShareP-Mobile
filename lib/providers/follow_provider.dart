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
  bool _hasInitValue = false;

  void setInitValue(bool isFollowing) {
    if (_hasInitValue) return;
    _hasInitValue = true;
    state = isFollowing;
  }

  Future<void> toggleFollow() async {
    final currentState = state;
    if (_isUpdating || currentState == null) return;

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
