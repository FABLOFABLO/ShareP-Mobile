import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/components/bottom_button.dart';
import 'package:share_prompt/components/proflie_card.dart';
import 'package:share_prompt/components/prompt_card.dart';
import 'package:share_prompt/constants/app_color.dart';
import 'package:share_prompt/constants/app_text_style.dart';

class OnBoarding4Page extends StatelessWidget {
  const OnBoarding4Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 150),
            ProfileCard(
              name: '한지석',
              promptCount: 124,
              followerCount: 4,
              followingCount: 560,
            ),
            const SizedBox(height: 30),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '내 프롬프트',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.body1Bold.copyWith(
                            color: AppColor.primary,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '좋아요한 프롬프트',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.body3.copyWith(
                            color: AppColor.gray50,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      const Divider(
                        height: 3,
                        thickness: 1,
                        color: Color(0xFFA5ADB8),
                      ),
                      FractionallySizedBox(
                        widthFactor: 0.5,
                        child: Container(
                          height: 3,
                          color: const Color(0xFF6847FF),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            PromptCard(
              title: '브랜드 로고 디자인 프롬프트',
              description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
              tag: '로고',
              author: '한지석',
              like: 12,
              onTap: () {},
            ),
            const SizedBox(height: 30),
            Text(
              '공유하고 함께 성장해요',
              style: AppTextStyles.title1.copyWith(
                color: AppColor.gray100,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '나만의 프롬프트를 게시하고\n좋아요와 팔로우로 AI 결과물을\n함께 발전시켜보세요!',
              style: AppTextStyles.body3.copyWith(color: AppColor.gray70),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 6,
              children: [
                Text(
                  '⦁',
                  style: TextStyle(color: AppColor.gray30, fontSize: 28),
                ),
                Text(
                  '⦁',
                  style: TextStyle(color: AppColor.gray30, fontSize: 28),
                ),
                Text(
                  '⦁',
                  style: TextStyle(color: AppColor.gray30, fontSize: 28),
                ),
                Text(
                  '⦁',
                  style: TextStyle(color: AppColor.gray100, fontSize: 28),
                ),
              ],
            ),
            SizedBox(height: 15),

            BottomButton(
              text: '시작하기',
              color: AppColor.primary,
              onTap: () => context.go('/login'),
            ),

            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
