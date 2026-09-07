import 'package:flutter/material.dart';
import 'package:share_prompt/components/default_app_bar.dart';
import 'package:share_prompt/model/follow_box_model.dart';
import 'package:share_prompt/page/home/widget/follow_box.dart';

class UserFollower extends StatefulWidget {
  const UserFollower({super.key});

  @override
  State<UserFollower> createState() => _UserFollowerState();
}

class _UserFollowerState extends State<UserFollower> {
  final List<FollowBoxModel> boxes = [
    FollowBoxModel(
      userName: '최고의 디자이너 한지석',
      hasFollowing: false,
    ),
    FollowBoxModel(
      userName: '김지우',
      hasFollowing: false,
    ),
    FollowBoxModel(
      userName: '이강희',
      hasFollowing: false,
    ),
    FollowBoxModel(
      userName: '홍성찬',
      hasFollowing: false,
    ),
    FollowBoxModel(
      userName: '이지아',
      hasFollowing: false,
    ),
    FollowBoxModel(
      userName: '권수현',
      hasFollowing: false,
    ),
    FollowBoxModel(
      userName: '김수인',
      hasFollowing: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(label: '팔로잉'),
      body: SafeArea(
        child:
            ListView.builder(
              itemCount: boxes.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
                  child: FollowBox(
                    userName: boxes[index].userName,
                    hasFollowing: boxes[index].hasFollowing,
                  )
                );
              },
            ),
        ),
    );
  }
}

