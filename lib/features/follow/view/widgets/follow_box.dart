import 'package:flutter/material.dart';
import 'package:share_prompt/core/constants/app_color.dart';
import 'package:share_prompt/core/constants/app_text_style.dart';

class FollowBox extends StatefulWidget {
  final String userName;
  final bool hasFollowing;

  const FollowBox({super.key, this.hasFollowing = true, required this.userName});

  @override
  State<FollowBox> createState() => _FollowBoxState();
}

class _FollowBoxState extends State<FollowBox> {

  late bool _hasFollowing;

  @override
  void initState() {
    super.initState();
    _hasFollowing = widget.hasFollowing;
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
                // TODO : 팔로우 API 연동하기
                onTap: () {
                  setState(() {
                    _hasFollowing = !_hasFollowing;
                  });
                },
                child: Container(
                  width: 51,
                  height: 24,
                  decoration: BoxDecoration(
                    color: widget.hasFollowing
                        ? AppColor.primary
                        : AppColor.secondary,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                    child: widget.hasFollowing
                        ? Text(
                            '팔로우',
                            style: AppTextStyles.body5.copyWith(
                              color: AppColor.white,
                            ),
                          )
                        : Text(
                            '팔로잉',
                            style: AppTextStyles.body5.copyWith(
                              color: AppColor.primary,
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
