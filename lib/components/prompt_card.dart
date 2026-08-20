import 'package:flutter/material.dart';
import 'package:share_prompt/components/prompt_tag.dart';
import 'package:share_prompt/constants/app_color.dart';
import 'package:share_prompt/constants/app_text_style.dart';

class PromptCard extends StatefulWidget {
  const PromptCard({
    super.key,
    required this.title,
    required this.main,
    required this.tagCount,
    required this.userName,
    required this.likeCount,
  });

  final String title;
  final String main;
  final int tagCount;
  final String userName;
  final int likeCount;

  @override
  State<PromptCard> createState() => _PromptCardState();
}

class _PromptCardState extends State<PromptCard> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 144,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(width: 2, color: AppColor.gray30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    textAlign: TextAlign.start,
                    style: AppTextStyles.body3,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.main,
                    textAlign: TextAlign.start,
                    style: AppTextStyles.caption3,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 5,
                    children: [
                      PromptTag(tag: '로고'),
                      PromptTag(tag: '브랜딩'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.userName,
                    style: AppTextStyles.body5.copyWith(
                      color: AppColor.gray70,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isLiked = !isLiked;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          color: isLiked ? AppColor.primary : AppColor.primary,
                          size: 20,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          '${widget.likeCount + (isLiked ? 1 : 0)}',
                          style: AppTextStyles.body4Bold.copyWith(
                            color: AppColor.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
