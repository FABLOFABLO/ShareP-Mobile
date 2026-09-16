import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../constants/app_color.dart';
import '../constants/app_text_style.dart';

class SharePalertdialog extends StatelessWidget {
  const SharePalertdialog({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      actions: [
        CupertinoDialogAction(
          isDestructiveAction: true,
          onPressed: () => context.pop(),
          child: Text(
            '예',
            style: AppTextStyles.dialog
          ),
        ),
        CupertinoDialogAction(
          onPressed: () => context.pop(),
          child: Text(
            '아니오',
            style: AppTextStyles.dialog
          ),
        ),
      ],
    );
  }
}
