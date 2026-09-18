import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../constants/app_color.dart';
import '../constants/app_text_style.dart';

class SharePalertdialog extends StatelessWidget {
  const SharePalertdialog({super.key, required this.title});

  final String title;

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
          onPressed: () => context.pop(),
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
