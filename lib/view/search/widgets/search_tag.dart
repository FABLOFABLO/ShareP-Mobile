import 'package:flutter/material.dart';
import 'package:share_prompt/common/constants/app_color.dart';
import 'package:share_prompt/common/constants/app_text_style.dart';

class SearchTag extends StatelessWidget {
  const SearchTag({
    super.key,
    required this.tag,
    required this.filterValue,
    required this.isSelected,
    required this.onSelected,
  });

  final String tag;
  final String filterValue;
  final bool isSelected;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(filterValue),
      child: Container(
        width: 48,
        height: 20,
        decoration: BoxDecoration(
          color: isSelected ? AppColor.primary : AppColor.secondary,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Center(
          child: Text(
            tag,
            style: AppTextStyles.body5.copyWith(
              color: isSelected ? AppColor.white : AppColor.primary,
            ),
          ),
        ),
      ),
    );
  }
}
