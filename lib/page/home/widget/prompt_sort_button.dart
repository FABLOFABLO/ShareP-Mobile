import 'package:flutter/material.dart';
import 'package:share_prompt/constants/app_color.dart';
import 'package:share_prompt/constants/app_text_style.dart';

class PromptSortButton extends StatefulWidget {
  const PromptSortButton({super.key});

  @override
  State<PromptSortButton> createState() => _PromptSortButtonState();
}

class _PromptSortButtonState extends State<PromptSortButton> {
  String now = '최신순';
  OverlayEntry? _overlayEntry;

  void _showOverlay() {
    final String otherOption = now == '최신순' ? '좋아요순' : '최신순';
    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 100,
        left: 27,
        child: GestureDetector(
          onTap: () {
            setState(() {
              now = otherOption;
              _hideOverlay();
            });
          },
          child: Container(
            height: 36,
            width: 88,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColor.white,
              border: Border.all(color: AppColor.primary, width: 1.5),
            ),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    otherOption,
                    style: AppTextStyles.body5.copyWith(
                      color: AppColor.primary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry!.remove();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _showOverlay,
      child: Container(
        height: 36,
        width: 88,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: AppColor.secondary,
          border: Border.all(color: AppColor.primary, width: 1.5),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                now,
                style: AppTextStyles.body5.copyWith(color: AppColor.primary),
              ),
              Icon(Icons.keyboard_arrow_down_rounded, color: AppColor.primary),
            ],
          ),
        ),
      ),
    );
  }
}
