import 'package:flutter/material.dart';
import 'package:share_prompt/constants/app_color.dart';
import 'package:share_prompt/constants/app_text_style.dart';

class ProfileCard extends StatefulWidget {
  final String name;
  final int promptCount;
  final int followerCount;
  final int followingCount;
  final bool isProfile;
  bool isFollow;

  ProfileCard({
    super.key,
    required this.name,
    required this.promptCount,
    required this.followerCount,
    required this.followingCount,
    this.isProfile = false,
    this.isFollow = false,
  });

  @override
  State<ProfileCard> createState() => _ProflieCardState();
}

class _ProflieCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Row(
        children: [
          CircleAvatar(
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
                        SizedBox(width: 15,),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              widget.isFollow = !widget.isFollow;
                            });
                          },
                          child: Container(
                            child: Center(
                              child: widget.isFollow
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
                              color: widget.isFollow
                                  ? AppColor.primary
                                  : AppColor.secondary,
                              borderRadius: BorderRadius.circular(100),
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
                      Text('프롬프트', style: AppTextStyles.body5),
                      Text(
                        '${widget.promptCount}개',
                        style: AppTextStyles.body3Bold,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('팔로워', style: AppTextStyles.body5),
                      Text(
                        '${widget.followerCount}명',
                        style: AppTextStyles.body3Bold,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('팔로잉', style: AppTextStyles.body5),
                      Text(
                        '${widget.followingCount}명',
                        style: AppTextStyles.body3Bold,
                      ),
                    ],
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
