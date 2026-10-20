class ProfileCardModel {
  final bool isProfile;
  final String name;
  final int promptCount;
  final int followerCount;
  final int followingCount;

  ProfileCardModel({
    required this.isProfile,
    required this.name,
    required this.promptCount,
    required this.followerCount,
    required this.followingCount,
  });
}
