import 'package:flutter_riverpod/legacy.dart';
import '../model/follow_box_model.dart';

final List<FollowBoxModel> boxes = [
  FollowBoxModel(userName: '최고의 디자이너 한지석', hasFollowing: false),
  FollowBoxModel(userName: '김지우', hasFollowing: false),
  FollowBoxModel(userName: '이강희', hasFollowing: false),
  FollowBoxModel(userName: '홍성찬', hasFollowing: false),
  FollowBoxModel(userName: '이지아', hasFollowing: false),
  FollowBoxModel(userName: '권수현', hasFollowing: false),
  FollowBoxModel(userName: '김수인', hasFollowing: false),
];

final followProvider =
    StateNotifierProvider<FollowNotifier, List<FollowBoxModel>>(
      (ref) => FollowNotifier(),
    );

class FollowNotifier extends StateNotifier<List<FollowBoxModel>> {
  FollowNotifier() : super(boxes);
}
