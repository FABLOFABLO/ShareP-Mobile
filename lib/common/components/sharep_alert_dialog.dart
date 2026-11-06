import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/common/constants/app_color.dart';
import 'package:share_prompt/common/constants/app_text_style.dart';

class SharePalertdialog extends StatelessWidget {
  const SharePalertdialog({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final TextStyle dialog = AppTextStyles.body2Bold.copyWith(
      color: AppColor.primary,
    );

    return CupertinoAlertDialog(
      title: Text(title),
      actions: [
        CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: onTap,
          child: Text('예', style: dialog),
        ),
        CupertinoDialogAction(
          onPressed: () => context.pop(),
          child: Text('아니오', style: dialog),
        ),
      ],
    );
  }
}
