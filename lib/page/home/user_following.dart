import 'package:flutter/material.dart';
import 'package:share_prompt/page/home/widget/follow_box.dart';

import '../../components/default_app_bar.dart';
import '../../model/follow_box_model.dart';

class UserFollowing extends StatefulWidget {
  const UserFollowing({super.key});

  @override
  State<UserFollowing> createState() => _UserFollowingState();
}

class _UserFollowingState extends State<UserFollowing> {
  final List<FollowBoxModel> boxes = [
    FollowBoxModel(
      userName: '최고의 디자이너 한지석',
      hasFollowing: true,
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
      hasFollowing: true,
    ),
    FollowBoxModel(
      userName: '권수현',
      hasFollowing: false,
    ),
    FollowBoxModel(
      userName: '김수인',
      hasFollowing: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(label: '팔로잉'),
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
                  ),
                );
              },
            ),
        ),
    );
  }
}
