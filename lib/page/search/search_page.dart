import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/constants/app_color.dart';
import 'package:share_prompt/constants/app_text_style.dart';
import 'package:share_prompt/page/search/widgets/search_tag.dart';
import 'package:share_prompt/providers/prompts_card_provider.dart';

import '../../components/prompt_card.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage>
    with TickerProviderStateMixin {
  final Set<int> selectedTags = {};
  final List<String> divideList = ['제목', '태그', '설명'];
  final TextEditingController _textController = TextEditingController();
  bool isSubmitted = false;

  void toggleTag(int index) {
    setState(() {
      if (selectedTags.contains(index)) {
        selectedTags.remove(index);
        return;
      }
      for (int i = 0; i < divideList.length; i++) {
        if (selectedTags.contains(i)) {
          selectedTags.remove(i);
        }
      }
      selectedTags.add(index);
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        _textController.value = const TextEditingValue(text: '');
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Container(
                  width: double.infinity,
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.gray40, width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        TextField(
                          onSubmitted: (value) {
                            setState(() {
                              if (value == '') {
                                isSubmitted = false;
                              } else {
                                isSubmitted = true;
                              }
                            });
                          },
                          controller: _textController,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.search,
                              color: AppColor.gray100,
                              size: 24,
                            ),
                            prefixIconConstraints: const BoxConstraints(
                              maxWidth: 35,
                            ),
                            hintText: '프롬프트 검색',
                            hintStyle: AppTextStyles.body4.copyWith(
                              color: AppColor.gray40,
                            ),
                            border: InputBorder.none,
                          ),
                          style: AppTextStyles.body4,
                          cursorColor: AppColor.gray100,
                          cursorWidth: 1,
                          cursorHeight: 15,
                        ),
                        Row(
                          spacing: 9,
                          children: [
                            SearchTag(
                              tag: divideList[0],
                              onTap: () => toggleTag(0),
                              hasTap: selectedTags.contains(0),
                            ),
                            SearchTag(
                              tag: divideList[1],
                              onTap: () => toggleTag(1),
                              hasTap: selectedTags.contains(1),
                            ),
                            SearchTag(
                              tag: divideList[2],
                              onTap: () => toggleTag(2),
                              hasTap: selectedTags.contains(2),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ?isSubmitted
                  ? showSearchResult()
                  : Expanded(
                      child: Center(
                        child: Text(
                          '검색된 프롬프트가 없습니다.',
                          style: AppTextStyles.body4Bold.copyWith(
                            color: AppColor.gray50,
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget? showSearchResult() {
    return Expanded(
      child: ListView.builder(
        itemCount: promptCards.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          final promptCard = promptCards[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
            child: PromptCard(
              title: promptCard.title,
              description: promptCard.description,
              tag: promptCard.tag,
              time: promptCard.time,
              like: promptCard.like,
              // TODO : 프롬프트 상세 조회 API 연동하기
              onTap: () => context.push('/detail'),
            ),
          );
        },
      ),
    );
  }
}
