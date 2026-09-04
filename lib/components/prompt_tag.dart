import 'package:flutter/material.dart';
import 'package:share_prompt/constants/app_color.dart';
import 'package:share_prompt/constants/app_text_style.dart';

class PromptTag extends StatefulWidget {
  final String tag;
  final bool inPrompt;

  const PromptTag({super.key, required this.tag, this.inPrompt = false});

  @override
  State<PromptTag> createState() => _PromptTagState();
}

class _PromptTagState extends State<PromptTag> {
  bool hasTap = false;

  @override
  Widget build(BuildContext context) {
    return widget.inPrompt
        ? GestureDetector(
            onTap: () {},
            child: Container(
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: hasTap ? AppColor.primary : AppColor.gray50,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 17.0),
                    child: Text(
                      widget.tag,
                      style: AppTextStyles.body5.copyWith(
                        color: AppColor.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : GestureDetector(
            onTap: () {
              setState(() {
                hasTap = !hasTap;
              });
            },
            child: Container(
              height: 34,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: hasTap ? AppColor.primary : AppColor.gray50,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 21.0),
                    child: Text(
                      widget.tag,
                      style: AppTextStyles.body3.copyWith(
                        color: AppColor.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
