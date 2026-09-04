import 'package:flutter/material.dart';
import 'package:share_prompt/components/on_bording2_scaffold.dart';
import 'package:share_prompt/components/prompt_card.dart';
import 'package:share_prompt/constants/app_color.dart';
import 'package:share_prompt/constants/app_text_style.dart';
import 'package:share_prompt/components/bottom_button.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/constants/app_assets.dart';

class OnBoarding2Page extends StatefulWidget {
  const OnBoarding2Page({super.key});

  @override
  State<OnBoarding2Page> createState() => _OnBording2PageState();
}

class _OnBording2PageState extends State<OnBoarding2Page> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                Container(
                  width: 74,
                  height: 32,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColor.secondary,
                    border: Border.all(color: AppColor.primary, width: 1),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 10),
                      Text(
                        '최신순',
                        style: AppTextStyles.body5.copyWith(
                          color: AppColor.primary,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: AppColor.primary,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Image.asset(AppAssets.star),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Column(
              children: [
                PromptCard(
                  title: '브랜드 로고 디자인 프롬프트',
                  description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
                  tag: '로고',
                  author: '한지석',
                  like: 12,
                ),
                const SizedBox(height: 15),
                PromptCard(
                  title: '브랜드 로고 디자인 프롬프트',
                  description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
                  tag: '로고',
                  author: '한지석',
                  like: 12,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '좋은 프롬프트를 한눈에',
            style: AppTextStyles.title1.copyWith(
              color: AppColor.gray100,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '최신순, 좋아요순으로 인기 프롬프트를\n둘러보고 마음에 드는 프롬프트를\n쉽게 발견해보세요!',
            style: AppTextStyles.body3.copyWith(color: AppColor.gray70),
            textAlign: TextAlign.center,
          ),

          Spacer(),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 6,
            children: [
              Text('⦁', style: TextStyle(color: AppColor.gray30, fontSize: 28)),
              Text(
                '⦁',
                style: TextStyle(color: AppColor.gray100, fontSize: 28),
              ),
              Text('⦁', style: TextStyle(color: AppColor.gray30, fontSize: 28)),
              Text('⦁', style: TextStyle(color: AppColor.gray30, fontSize: 28)),
            ],
          ),
          SizedBox(height: 15),

          BottomButton(
            text: '다음',
            color: AppColor.primary,
            onTap: () => context.go('/onboarding/3'),
          ),

          SizedBox(height: 15),
        ],
      ),
    );
  }
}
