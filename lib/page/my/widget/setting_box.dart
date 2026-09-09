import 'package:flutter/material.dart';
import 'package:share_prompt/constants/app_color.dart';
import 'package:share_prompt/constants/app_text_style.dart';

class SettingBox extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const SettingBox({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 33),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: Center(
            child: Row(
              children: [
                Text(
                  label,
                  style: (label == '로그아웃')
                      ? AppTextStyles.body2.copyWith(color: AppColor.gray50)
                      : (label == '회원탈퇴')
                      ? AppTextStyles.body2.copyWith(color: AppColor.error)
                      : AppTextStyles.body2
                      .copyWith(color: AppColor.gray100),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColor.primary,
                  size: 24,
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
