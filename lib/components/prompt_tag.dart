import 'package:flutter/material.dart';
import 'package:share_prompt/constants/app_color.dart';
import 'package:share_prompt/constants/app_text_style.dart';

class PromptTag extends StatelessWidget {
  final String tag;

  const PromptTag({super.key, required this.tag});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColor.gray50
      ),
      child: Center(child: Text(tag, style: AppTextStyles.body5.copyWith(color: AppColor.white))),
    );
  }
}
