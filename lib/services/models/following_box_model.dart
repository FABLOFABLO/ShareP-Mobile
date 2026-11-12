class FollowingBoxModel {
  final bool hasFollowing;
  final String userLoginId;
  final int userId;
  final String userNickName;

  FollowingBoxModel({
    required this.hasFollowing,
    required this.userId, required this.userLoginId, required this.userNickName,
  });

  factory FollowingBoxModel.fromJson(Map<String, dynamic> json) {
    return FollowingBoxModel(
      hasFollowing: _parseFollowing(json['following']),
      userNickName: (json['following_nickname'] ?? json['follower_nickname']) as String,
      userId: (json['following_id'] ?? json['follower_id']) as int,
      userLoginId: (json['following_login_id'] ?? json['follower_login_id']) as String,
    );
  }
}

bool _parseFollowing(dynamic value) {
  if (value is bool) return value;
  if (value is String) {
    switch (value.trim().toUpperCase()) {
      case 'TRUE':
        return true;
      case 'FALSE':
      case 'ME':
        return false;
    }
  }
  throw FormatException('알 수 없는 following 값: $value');
}
