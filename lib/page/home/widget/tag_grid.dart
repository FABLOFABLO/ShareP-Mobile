import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_prompt/components/prompt_tag.dart';
import 'package:share_prompt/constants/app_text_style.dart';
import 'package:share_prompt/providers/tags_provider.dart';

class TagGrid extends ConsumerStatefulWidget {
  const TagGrid({super.key});

  @override
  ConsumerState<TagGrid> createState() => _TagGridState();
}

class _TagGridState extends ConsumerState<TagGrid> {


  final Set<int> selectedTags = {};

  void toggleTag(int index) {
    setState(() {
      if (selectedTags.contains(index)) {
        selectedTags.remove(index);
        return;
      }
      for (int i = 0; i < tagList.length; i++) {
        if (selectedTags.contains(i)) {
          selectedTags.remove(i);
        }
      }
      selectedTags.add(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final tagList = ref.watch(tagsProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('태그', style: AppTextStyles.body1),
          const SizedBox(height: 10),
          Row(
            spacing: 10,
            children: [
              PromptTag(
                tag: tagList[0],
                hasTap: selectedTags.contains(0),
                onTap: () => toggleTag(0),
              ),
              PromptTag(
                tag: tagList[1],
                hasTap: selectedTags.contains(1),
                onTap: () => toggleTag(1),
              ),
              PromptTag(
                tag: tagList[2],
                hasTap: selectedTags.contains(2),
                onTap: () => toggleTag(2),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            spacing: 10,
            children: [
              PromptTag(
                tag: tagList[3],
                hasTap: selectedTags.contains(3),
                onTap: () => toggleTag(3),
              ),
              PromptTag(
                tag: tagList[4],
                hasTap: selectedTags.contains(4),
                onTap: () => toggleTag(4),
              ),
              PromptTag(
                tag: tagList[5],
                hasTap: selectedTags.contains(5),
                onTap: () => toggleTag(5),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            spacing: 10,
            children: [
              PromptTag(
                tag: tagList[6],
                hasTap: selectedTags.contains(6),
                onTap: () => toggleTag(6),
              ),
              PromptTag(
                tag: tagList[7],
                hasTap: selectedTags.contains(7),
                onTap: () => toggleTag(7),
              ),
              PromptTag(
                tag: tagList[8],
                hasTap: selectedTags.contains(8),
                onTap: () => toggleTag(8),
              ),
            ],
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
