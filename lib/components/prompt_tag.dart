import 'package:flutter/material.dart';
import 'package:share_prompt/constants/app_color.dart';
import 'package:share_prompt/constants/app_text_style.dart';

class PromptTag extends StatelessWidget {
  final String tag;
  final bool inPrompt;
  final VoidCallback onTap;
  final bool hasTap;

  PromptTag({super.key, required this.tag, this.inPrompt = false, required this.onTap, this.hasTap = false});

  @override
  Widget build(BuildContext context) {
    return inPrompt
        ? GestureDetector(
            onTap: onTap,
            child: Container(
              height: 24,
              padding: const EdgeInsets.symmetric(horizontal: 21),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: hasTap
                    ? AppColor.primary
                    : AppColor.gray50,
              ),
              child: Text(
                tag,
                style: AppTextStyles.body5.copyWith(
                  color: AppColor.white,
                ),
              ),
            )
          )
        : GestureDetector(
            onTap: onTap,
            child: Container(
              height: 34,
              padding: const EdgeInsets.symmetric(horizontal: 21),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: hasTap
                    ? AppColor.primary
                    : AppColor.gray50,
              ),
              child: Text(
                tag,
                style: AppTextStyles.body3.copyWith(
                  color: AppColor.white,
                ),
              ),
            )
          );
  }
}
