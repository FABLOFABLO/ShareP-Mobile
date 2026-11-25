import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_prompt/common/constants/app_color.dart';
import 'package:share_prompt/providers/follower_provider.dart';
import 'package:share_prompt/common/components/default_app_bar.dart';
import 'package:share_prompt/view/my/widget/follow_box.dart';

class UserFollower extends ConsumerStatefulWidget {
  final int userId;

  const UserFollower({super.key, required this.userId});

  @override
  ConsumerState<UserFollower> createState() => _UserFollowerState();
}

class _UserFollowerState extends ConsumerState<UserFollower> {
  Future<void> _loadFollowerList() async {
    if (!mounted) return;

    await ref
        .read(followerProvider(widget.userId).notifier)
        .getFollowerList(widget.userId);
  }

  @override
  void initState() {
    super.initState();
    _loadFollowerList();
  }

  @override
  Widget build(BuildContext context) {
    final boxes = ref.watch(followerProvider(widget.userId));

    return Scaffold(
      appBar: const DefaultAppBar(title: '팔로워', hasBack: true),
      body: boxes.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            const Center(child: Text('팔로워 목록을 불러오지 못했습니다.')),
        data: (data) {
          if (data.followerList.isEmpty) {
            return const Center(child: Text('아직 팔로워가 없습니다.'));
          }

          return SafeArea(
            child: RefreshIndicator(
              backgroundColor: AppColor.primary,
              color: AppColor.white,
              onRefresh: _loadFollowerList,
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: data.followerList.length,
                itemBuilder: (BuildContext context, int index) {
                  final box = data.followerList[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 26,
                      vertical: 6,
                    ),
                    child: FollowBox(
                      key: ValueKey(box.userId),
                      userName: box.userNickName,
                      userId: box.userId,
                      hasFollowing: box.hasFollowing,
                      onFollowChanged: _loadFollowerList,
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
