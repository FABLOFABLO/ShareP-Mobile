import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  String? _errorMessage;

  Future<void> _loadFollowerList(int userId) async {
    setState(() {
      _errorMessage = null;
    });

    try {
      await ref.read(followerProvider(widget.userId).notifier).getFollowerList(userId);
    } catch (error) {
      debugPrint('팔로워 오류: $error');
      if (!mounted) return;
      setState(() {
        _errorMessage = '팔로워 목록을 불러오지 못했습니다.';
      });
    }
  }

  @override void initState() {
    super.initState();
    _loadFollowerList(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    final boxes = ref.watch(followerProvider(widget.userId));


    if (boxes == null && _errorMessage == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: const DefaultAppBar(title: '팔로워', hasBack: true),
      body: _errorMessage != null
          ? Center(child: Text(_errorMessage!))
          : boxes!.followerList.isEmpty
          ? const Center(child: Text('아직 팔로워가 없습니다.'))
          : SafeArea(
        child: ListView.builder(
          itemCount: boxes.followerList.length,
          itemBuilder: (BuildContext context, int index) {
            final box = boxes.followerList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
              child: FollowBox(
                key: ValueKey(box.userId),
                userName: box.userNickName,
                userId: box.userId,
                hasFollowing: box.hasFollowing,
                onFollowChanged: () => _loadFollowerList(widget.userId),
              ),
            );
          },
        ),
      ),
    );
  }
}
