import 'package:flutter/material.dart';
import 'package:share_prompt/constants/app_color.dart';
import 'package:share_prompt/constants/app_text_style.dart';

class FollowBox extends StatefulWidget {
  final String userName;
  bool hasFollowing;

  FollowBox({super.key, this.hasFollowing = true, required this.userName});

  @override
  State<FollowBox> createState() => _FollowBoxState();
}

class _FollowBoxState extends State<FollowBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342,
      height: 62,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColor.gray30,
          width: 1.5
        ),
        borderRadius: BorderRadius.circular(16)
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(widget.userName, style: AppTextStyles.body3,),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.hasFollowing = !widget.hasFollowing;
                  });
                },
                child: Container(
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
                  width: 51,
                  height: 24,
                  decoration: BoxDecoration(
                    color: widget.hasFollowing
                        ? AppColor.primary
                        : AppColor.secondary,
                    borderRadius: BorderRadius.circular(100),
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
