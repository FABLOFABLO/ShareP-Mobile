import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';
import '../../../constants/app_text_style.dart';

class SearchTag extends StatefulWidget {
  final String tag;
  final VoidCallback onTap;
  final bool hasTap;

  const SearchTag({super.key, required this.onTap, this.hasTap = false, required this.tag});

  @override
  State<SearchTag> createState() => _SearchTagState();
}

class _SearchTagState extends State<SearchTag> {
  bool isTap = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 48,
        height: 20,
        decoration: BoxDecoration(
          color: widget.hasTap ? AppColor.primary : AppColor.secondary,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: widget.hasTap
              ? Text(
                  widget.tag,
                  style: AppTextStyles.body5.copyWith(color: AppColor.white),
                )
              : Text(
                  widget.tag,
                  style: AppTextStyles.body5.copyWith(color: AppColor.primary),
                ),
        ),
      ),
    );
  }
}
