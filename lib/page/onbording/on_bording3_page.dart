import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/components/bottom_button.dart';
import 'package:share_prompt/constants/app_color.dart';
import 'package:share_prompt/constants/app_text_style.dart';

class OnBording3Page extends StatelessWidget {
  const OnBording3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 190),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Container(
                width: 366,
                height: 150,
                decoration: BoxDecoration(
                  color: AppColor.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x52818C98),
                      blurRadius: 12,
                      offset: Offset(0, 6),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(width: 1, color: AppColor.gray20),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Container(
                        width: 332,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: AppColor.gray20,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            children: [
                              Icon(Icons.search, color: AppColor.gray50),
                              const SizedBox(width: 10),
                              Text(
                                '프롬프트, 태그, 계정 검색',
                                style: AppTextStyles.body3.copyWith(
                                  color: AppColor.gray50,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Spacer(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 150),
            Text(
              '검색하고 바로 복사',
              style: AppTextStyles.title1.copyWith(
                color: AppColor.gray100,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '계정·태그·제목으로 원하는 프롬프트를 찾고,\n복사 버튼으로 바로 활용해보세요!',
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
                  style: TextStyle(color: AppColor.gray100, fontSize: 28),
                ),
                Text(
                  '⦁',
                  style: TextStyle(color: AppColor.gray30, fontSize: 28),
                ),
              ],
            ),
            SizedBox(height: 15),

            BottomButton(
              text: '다음',
              color: AppColor.primary,
              onTap: () => context.go('/onboarding/4'),
            ),

            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
