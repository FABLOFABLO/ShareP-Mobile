import 'package:flutter/material.dart';
import 'package:share_prompt/components/prompt_tag.dart';
import 'package:share_prompt/constants/app_text_style.dart';

class TagGrid extends StatefulWidget {
  const TagGrid({super.key});

  @override
  State<TagGrid> createState() => _TagGridState();
}

class _TagGridState extends State<TagGrid> {
  static const List<String> tagList = [
    '로고',
    '브랜딩',
    '일러스트',
    '브랜딩',
    '일러스트',
    '로고',
    '로고',
    '일러스트',
    '일러스트',
  ];

  int selectedRow = 0;
  int selectedColumn = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('태그', style: AppTextStyles.body1),
          const SizedBox(height: 10),
          Row(
            spacing: 10,
            children: [
              PromptTag(tag: tagList[0]),
              PromptTag(tag: tagList[1]),
              PromptTag(tag: tagList[2]),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            spacing: 10,
            children: [
              PromptTag(tag: tagList[3]),
              PromptTag(tag: tagList[4]),
              PromptTag(tag: tagList[5]),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            spacing: 10,
            children: [
              PromptTag(tag: tagList[6]),
              PromptTag(tag: tagList[7]),
              PromptTag(tag: tagList[8]),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
