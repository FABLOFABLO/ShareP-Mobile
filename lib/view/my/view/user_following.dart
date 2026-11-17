import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_prompt/common/components/default_app_bar.dart';
import 'package:share_prompt/providers/following_provider.dart';
import 'package:share_prompt/view/my/widget/follow_box.dart';

class UserFollowing extends ConsumerStatefulWidget {
  final int userId;

  const UserFollowing({super.key, required this.userId});

  @override
  ConsumerState<UserFollowing> createState() => _UserFollowingState();
}

class _UserFollowingState extends ConsumerState<UserFollowing> {
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _loadFollowingList(widget.userId);
  }

  Future<void> _loadFollowingList(int userId) async {
    setState(() {
      _errorMessage = null;
    });

    try {
      await ref.read(followingProvider(widget.userId).notifier).getFollowingList(userId);
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _errorMessage = '팔로잉 목록을 불러오지 못했습니다.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final boxes = ref.watch(followingProvider(widget.userId));

    if (boxes == null && _errorMessage == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: const DefaultAppBar(title: '팔로잉', hasBack: true),
      body: _errorMessage != null
          ? Center(child: Text(_errorMessage!))
          : boxes!.followingList.isEmpty
          ? const Center(child: Text('아직 팔로잉하는 유저가 없습니다.'))
          : SafeArea(
              child: ListView.builder(
                itemCount: boxes.followingList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  final box = boxes.followingList[index];

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
                      onFollowChanged: () => _loadFollowingList(widget.userId),
                    ),
                  );
                },
              ),
            ),
    );
  }
}
