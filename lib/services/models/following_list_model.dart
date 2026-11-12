import 'package:share_prompt/services/models/following_box_model.dart';

class FollowingListModel {
  final List<FollowingBoxModel> followingList;

  FollowingListModel({required this.followingList});

  factory FollowingListModel.fromJson(List<dynamic> json) {
    return FollowingListModel(
      followingList: json
          .map((item) => FollowingBoxModel.fromJson(
        item as Map<String, dynamic>,
      ))
          .toList(),
    );
  }
}