import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/constants/app_color.dart';
import 'package:share_prompt/constants/app_text_style.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? label;

  const DefaultAppBar({super.key, this.label});

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: (label != null)
                ? Text(label!, style: AppTextStyles.title3)
                : null,
          ),

          Positioned(
            left: 10,
            bottom: 10,
            child: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColor.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
