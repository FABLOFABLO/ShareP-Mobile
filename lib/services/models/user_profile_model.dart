import 'package:share_prompt/services/models/common_profile_model.dart';

class UserProfileModel {
  final CommonProfileModel base;
  final bool isFollowing;

  UserProfileModel({required this.base, required this.isFollowing});

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      base: CommonProfileModel.fromJson(json),
      isFollowing: json['is-following'] as bool,
    );
  }
}
