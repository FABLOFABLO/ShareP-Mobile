import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_prompt/components/default_app_bar.dart';
import 'package:share_prompt/page/home/widget/follow_box.dart';
import 'package:share_prompt/providers/follow_provider.dart';

class UserFollower extends ConsumerStatefulWidget {
  const UserFollower({super.key});

  @override
  ConsumerState<UserFollower> createState() => _UserFollowerState();
}

class _UserFollowerState extends ConsumerState<UserFollower> {
  @override
  Widget build(BuildContext context) {
    final boxes = ref.watch(followProvider);

    return Scaffold(
      appBar: const DefaultAppBar(title: '팔로워', hasBack: true),
      body: SafeArea(
        child: ListView.builder(
          itemCount: boxes.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            final box = boxes[index];

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
              child: FollowBox(
                userName: box.userName,
                hasFollowing: box.hasFollowing,
              ),
            );
          },
        ),
      ),
    );
  }
}
