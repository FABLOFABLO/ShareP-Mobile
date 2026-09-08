import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_prompt/page/home/widget/follow_box.dart';
import 'package:share_prompt/providers/follow_provider.dart';
import '../../components/default_app_bar.dart';

class UserFollowing extends ConsumerStatefulWidget {
  const UserFollowing({super.key});

  @override
  ConsumerState<UserFollowing> createState() => _UserFollowingState();
}

class _UserFollowingState extends ConsumerState<UserFollowing> {
  @override
  Widget build(BuildContext context) {
    final boxes = ref.watch(followProvider);

    return Scaffold(
      appBar: const DefaultAppBar(label: '팔로잉'),
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
