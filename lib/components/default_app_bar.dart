import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/constants/app_color.dart';
import '../constants/app_text_style.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.height = 56,
    this.hasBack = false,
  });

  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final double height;
  final bool hasBack;

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final Widget? leadingWidget =
    hasBack ? _buildBackButton(context) : leading;

    return Material(
      color: Colors.transparent,
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: height,
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (leadingWidget != null)
                Positioned(
                  left: 24,
                  child: leadingWidget,
                ),

              if (title != null)
                Center(
                  child: Text(
                    title!,
                    style: AppTextStyles.title3,
                  ),
                ),

              if (actions != null)
                Positioned(
                  right: 12,
                  child: Row(
                    children: actions!,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pop(),
      child: const Icon(Icons.arrow_back_ios_new, color: AppColor.primary,),
    );
  }
}