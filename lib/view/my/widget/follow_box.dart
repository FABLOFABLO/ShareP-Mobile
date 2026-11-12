import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_prompt/common/constants/app_color.dart';
import 'package:share_prompt/common/constants/app_text_style.dart';
import 'package:share_prompt/providers/my_profile_provider.dart';
import 'package:share_prompt/services/services/follow_service.dart';

class FollowBox extends ConsumerStatefulWidget {
  final String userName;
  final int userId;
  final bool hasFollowing;
  final Future<void> Function() onFollowChanged;


  const FollowBox({
    super.key,
    required this.userName,
    required this.userId,
    required this.hasFollowing, required this.onFollowChanged,
  });

  @override
  ConsumerState<FollowBox> createState() => _FollowBoxState();
}

class _FollowBoxState extends ConsumerState<FollowBox> {
  late bool _hasFollowing;
  bool _isUpdatingFollow = false;

  @override
  void initState() {
    super.initState();
    _hasFollowing = widget.hasFollowing;
  }

  @override
  void didUpdateWidget(FollowBox oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.hasFollowing != widget.hasFollowing) {
      _hasFollowing = widget.hasFollowing;
    }
  }

  Future<void> _toggleFollow() async {
    if(_isUpdatingFollow) return;

    setState(() => _isUpdatingFollow = true);

    try {
      if (_hasFollowing) {
        await unFollow(widget.userId);
      } else {
        await follow(widget.userId);
      }

      if (!mounted) return;
      setState(() {
        _hasFollowing = !_hasFollowing;
      });

      try {
        await widget.onFollowChanged();
      } catch (error) {
        debugPrint('팔로우 오류: $error');
      }
    } catch (error) {
        if(!mounted) return;
        ScaffoldMessenger.of(context,).showSnackBar(const SnackBar(content: Text('팔로우 불러오기에 실패했습니다.')));
      } finally {
      await ref
          .read(myProfileProvider.notifier)
          .getMyProfile();
      if(mounted) {
        setState(() => _isUpdatingFollow = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      height: 62,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.gray30, width: 1.5),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(widget.userName, style: AppTextStyles.body3),
              const Spacer(),
      GestureDetector(
                onTap: _isUpdatingFollow ? null : _toggleFollow,
                child: Container(
                  width: 51,
                  height: 24,
                  decoration: BoxDecoration(
                    color: _hasFollowing
                        ? AppColor.secondary
                        : AppColor.primary,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: Text(
                      _hasFollowing ? '팔로잉' : '팔로우',
                      style: AppTextStyles.body5.copyWith(
                        color: _hasFollowing ? AppColor.primary : AppColor.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
