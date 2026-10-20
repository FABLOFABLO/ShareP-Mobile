import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/components/bottom_button.dart';
import 'package:share_prompt/constants/app_color.dart';

class OnBoarding1Page extends StatelessWidget {
  const OnBoarding1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 240),
            Center(child: Image.asset('assets/on_bording_logo.png')),
            const SizedBox(height: 31),
            const Text(
              '좋은 프롬프트를 나누고,\nAI와 함께 더 멋진 결과물을 만들어요.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.gray70,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 6,
              children: [
                Text(
                  '⦁',
                  style: TextStyle(color: AppColor.gray100, fontSize: 28),
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
                  style: TextStyle(color: AppColor.gray30, fontSize: 28),
                ),
              ],
            ),
            const SizedBox(height: 15),

            BottomButton(
              text: '다음',
              color: AppColor.primary,
              onTap: () => context.go('/onboarding/2'),
            ),

            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
