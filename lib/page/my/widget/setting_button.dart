import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/constants/app_color.dart';

class SettingButton extends StatelessWidget {
  const SettingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => context.push('/setting'),
      icon: const Icon(Icons.settings, color: AppColor.gray60, size: 30,),
    );
  }
}
