import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/constants/app_color.dart';
import 'package:share_prompt/constants/app_text_style.dart';

class ProfileCard extends StatefulWidget {
  final String name;
  final int promptCount;
  final int followerCount;
  final int followingCount;
  final bool isProfile;
  final bool isFollow;

  const ProfileCard({
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
  late bool _isFollow = widget.isFollow;

  @override
  void didUpdateWidget(covariant ProfileCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    _isFollow = widget.isFollow;
  }

  @override
  Widget build(BuildContext context) {
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
                        const SizedBox(width: 15,),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _isFollow = !_isFollow;
                            });
                          },
                          child: Container(
                            width: 51,
                            height: 24,
                            decoration: BoxDecoration(
                              color: _isFollow
                                  ? AppColor.primary
                                  : AppColor.secondary,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: _isFollow
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
                    // TODO : 팔로워 목록 조회 API 연동하기
                    onTap: () => context.push('/follower'),
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
                    // TODO : 팔로잉한 유저 목록 조회 API 연동하기
                  onTap: () => context.push('/following'),
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
                  )

                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
