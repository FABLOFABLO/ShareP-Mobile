import 'package:share_prompt/common/utils/follow_enum.dart';

class FollowingBoxModel {
  final IsFollowing hasFollowing;
  final String userLoginId;
  final int userId;
  final String userNickName;

  FollowingBoxModel({
    required this.hasFollowing,
    required this.userId,
    required this.userLoginId,
    required this.userNickName,
  });

  factory FollowingBoxModel.fromJson(Map<String, dynamic> json) {
    return FollowingBoxModel(
      hasFollowing: _parseFollowing(json['following']),
      userNickName: (json['following_nickname']) as String,
      userId: (json['following_id']) as int,
      userLoginId: (json['following_login_id']) as String,
    );
  }
}

IsFollowing _parseFollowing(dynamic value) {
  if (value is String) {
    switch (value.trim().toUpperCase()) {
      case 'TRUE':
        return IsFollowing.yes;
      case 'FALSE':
        return IsFollowing.no;
      case 'ME':
        return IsFollowing.me;
    }
  }
  throw FormatException('알 수 없는 following 값: $value');
}
