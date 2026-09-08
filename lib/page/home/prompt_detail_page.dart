import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/components/default_app_bar.dart';
import 'package:share_prompt/page/home/widget/prompt_context.dart';

import '../../constants/app_color.dart';
import '../../constants/app_text_style.dart';

class PromptDetailPage extends StatefulWidget {
  const PromptDetailPage({super.key});

  @override
  State<PromptDetailPage> createState() => _PromptDetailPageState();
}

class _PromptDetailPageState extends State<PromptDetailPage> {
  bool isLiked = false;
  bool isFollow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(hasBack: true,),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                '제품 사진 촬영 프롬프트',
                                style: AppTextStyles.title1.copyWith(
                                  color: AppColor.gray100,
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isLiked = !isLiked;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      isLiked
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: isLiked
                                          ? AppColor.primary
                                          : AppColor.primary,
                                      size: 25,
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      '86',
                                      style: AppTextStyles.body4Bold.copyWith(
                                        color: AppColor.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
                          Row(
                            children: [
                              GestureDetector(
                                // TODO : 유저 프로필 조회 API 연동하기
                                onTap: () => context.push('/profile'),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 13,
                                      backgroundColor: AppColor.gray50,
                                      child: Icon(
                                        Icons.person,
                                        color: AppColor.white,
                                        size: 20,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      '한지석',
                                      style: AppTextStyles.body1.copyWith(
                                        color: AppColor.gray100,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isFollow = !isFollow;
                                  });
                                },
                                child: Container(
                                  width: 53,
                                  height: 26,
                                  decoration: BoxDecoration(
                                    color: isFollow
                                        ? AppColor.primary
                                        : AppColor.secondary,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Center(
                                    child: isFollow
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
                          const SizedBox(height: 34),
                          Text(
                            '안녕하세요 여러분 오늘은 제품 사진 촬영할 때\n쓰기 좋은 프롬프트를 공유하려고 합니다 ㅎㅎㅎㅎㅎ\n아 디자인 하기 싫다 어쨌든 많이 사용해주세용',
                            style: AppTextStyles.body3.copyWith(
                              color: AppColor.gray100,
                            ),
                          ),
                          const SizedBox(height: 34),
                          const PromptContext(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
