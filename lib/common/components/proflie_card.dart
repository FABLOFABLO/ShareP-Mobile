import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/common/constants/app_color.dart';
import 'package:share_prompt/common/constants/app_text_style.dart';
import 'package:share_prompt/providers/follow_provider.dart';

class ProfileCard extends ConsumerStatefulWidget {
  final String name;
  final int promptCount;
  final int followerCount;
  final int followingCount;
  final bool isProfile;
  final bool isFollow;
  final int userId;
  final Future<void> Function() onFollowChanged;

  const ProfileCard({
    super.key,
    required this.name,
    required this.promptCount,
    required this.followerCount,
    required this.followingCount,
    this.isProfile = false,
    this.isFollow = false,
    required this.userId,
    required this.onFollowChanged,
  });

  @override
  ConsumerState<ProfileCard> createState() => _ProflieCardState();
}

class _ProflieCardState extends ConsumerState<ProfileCard> {
  bool _isUpdatingFollow = false;

  @override
  void initState() {
    super.initState();
    _initFollowState();
  }

  void _initFollowState() {
    if (!mounted) return;
    ref
        .read(followProvider(widget.userId).notifier)
        .setInitValue(widget.isFollow);
  }

  @override
  void didUpdateWidget(ProfileCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.userId != widget.userId ||
        oldWidget.isFollow != widget.isFollow ||
        oldWidget.isProfile != widget.isProfile) {
      _initFollowState();
    }
  }

  Future<void> _toggleFollow() async {
    if (_isUpdatingFollow) return;

    setState(() => _isUpdatingFollow = true);

    try {
      await ref.read(followProvider(widget.userId).notifier).toggleFollow();

      try {
        await widget.onFollowChanged();
      } catch (error) {
        debugPrint('팔로우 오류: $error');
      }
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('팔로우 불러오기에 실패했습니다.')));
    } finally {
      if (mounted) {
        setState(() => _isUpdatingFollow = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isFollow = widget.isProfile
        ? ref.watch(followProvider(widget.userId))
        : widget.isFollow;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: AppColor.gray50,
            child: Icon(Icons.person, size: 70, color: AppColor.white),
          ),
          const SizedBox(width: 25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: widget.isProfile
                    ? [
                        Text(widget.name, style: AppTextStyles.title3),
                        const SizedBox(width: 15),
                        GestureDetector(
                          onTap: _isUpdatingFollow || isFollow == null
                              ? null
                              : _toggleFollow,
                          child: Container(
                            width: 51,
                            height: 24,
                            decoration: BoxDecoration(
                              color: isFollow == true
                                  ? AppColor.secondary
                                  : AppColor.primary,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: isFollow == true
                                  ? Text(
                                      '팔로잉',
                                      style: AppTextStyles.body5.copyWith(
                                        color: AppColor.primary,
                                      ),
                                    )
                                  : Text(
                                      '팔로우',
                                      style: AppTextStyles.body5.copyWith(
                                        color: AppColor.white,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ]
                    : [Text(widget.name, style: AppTextStyles.title3)],
              ),
              const SizedBox(height: 5),
              Row(
                spacing: 30,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('프롬프트', style: AppTextStyles.body5),
                      Text(
                        '${widget.promptCount}개',
                        style: AppTextStyles.body3Bold,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () =>
                        context.push('/follower?userId=${widget.userId}'),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('팔로워', style: AppTextStyles.body5),
                        Text(
                          '${widget.followerCount}명',
                          style: AppTextStyles.body3Bold,
                        ),
                      ],
                    ),
                  ),

                  GestureDetector(
                    onTap: () =>
                        context.push('/following?userId=${widget.userId}'),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('팔로잉', style: AppTextStyles.body5),
                        Text(
                          '${widget.followingCount}명',
                          style: AppTextStyles.body3Bold,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
