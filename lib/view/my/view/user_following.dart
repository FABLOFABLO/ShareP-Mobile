import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_prompt/common/components/default_app_bar.dart';
import 'package:share_prompt/common/constants/app_color.dart';
import 'package:share_prompt/providers/following_provider.dart';
import 'package:share_prompt/view/my/widget/follow_box.dart';

class UserFollowing extends ConsumerStatefulWidget {
  final int userId;

  const UserFollowing({super.key, required this.userId});

  @override
  ConsumerState<UserFollowing> createState() => _UserFollowingState();
}

class _UserFollowingState extends ConsumerState<UserFollowing> {
  @override
  void initState() {
    super.initState();
    _loadFollowingList();
  }

  Future<void> _loadFollowingList() async {
    if (!mounted) return;

    await ref
        .read(followingProvider(widget.userId).notifier)
        .getFollowingList(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    final boxes = ref.watch(followingProvider(widget.userId));

    return Scaffold(
      appBar: const DefaultAppBar(title: '팔로잉', hasBack: true),
      body: boxes.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) =>
            const Center(child: Text('팔로잉 목록을 불러오지 못했습니다.')),
        data: (data) {
          if (data.followingList.isEmpty) {
            return const Center(child: Text('아직 팔로잉하는 유저가 없습니다.'));
          }

          return SafeArea(
            child: RefreshIndicator(
              backgroundColor: AppColor.primary,
              color: AppColor.white,
              onRefresh: () async {
                await _loadFollowingList();
              },
              child: ListView.builder(
                itemCount: data.followingList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  final box = data.followingList[index];

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
                      onFollowChanged: _loadFollowingList,
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
