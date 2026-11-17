import 'package:share_prompt/services/models/follower_box_model.dart';

class FollowerListModel {
  final List<FollowerBoxModel> followerList;

  FollowerListModel({required this.followerList});

  factory FollowerListModel.fromJson(List<dynamic> json) {
    return FollowerListModel(
      followerList: json
          .map((item) => FollowerBoxModel.fromJson(
        item as Map<String, dynamic>,
      ))
          .toList(),
    );
  }
}