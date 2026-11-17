import 'package:flutter/material.dart';
import 'package:share_prompt/common/networks/dio_provider.dart';
import 'package:share_prompt/services/models/follower_list_model.dart';
import 'package:share_prompt/services/models/following_list_model.dart';

Future<void> follow(int userId) async {
  await dio.put('/follow/$userId/follow');
}

Future<void> unFollow(int userId) async {
  await dio.delete('/follow/$userId/unfollow');
}

Future<FollowerListModel> getFollowerList(int userId) async {
  final response = await dio.get('/follow/$userId/follower');

  final data = response.data;
  debugPrint('$data');

  if (data == null) {
    throw const FormatException('팔로워 목록을 불러오는데 실패했습니다.');
  }
  return FollowerListModel.fromJson(data);
}

Future<FollowingListModel> getFollowingList(int userId) async {
  final response = await dio.get('/follow/$userId/following');

  final data = response.data;

  debugPrint('$data');

  if (data == null) {
    throw const FormatException('팔로잉 목록을 불러오는데 실패했습니다.');
  }
  return FollowingListModel.fromJson(data);
}
