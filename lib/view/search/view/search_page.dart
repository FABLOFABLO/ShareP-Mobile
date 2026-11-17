import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/common/components/prompt_card.dart';
import 'package:share_prompt/common/constants/app_color.dart';
import 'package:share_prompt/common/constants/app_text_style.dart';
import 'package:share_prompt/providers/my_profile_provider.dart';
import 'package:share_prompt/providers/prompt_list_provider.dart';
import 'package:share_prompt/providers/search_prompt_provider.dart';
import 'package:share_prompt/view/search/widgets/search_tag.dart';
import 'package:timeago/timeago.dart' as timeago;

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final TextEditingController _textController = TextEditingController();

  String _selectedFilter = 'TITLE';
  String? _errorMessage;
  bool _isSearching = false;

  Future<void> _handleSearchPrompt(String text, String filter) async {
    final query = text.trim();
    if (query.isEmpty) return;

    setState(() {
      _errorMessage = null;
      _isSearching = true;
    });

    try {
      await ref.read(searchPromptProvider.notifier).searchPrompt(query, filter);
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _errorMessage = '$error';
      });
    } finally {
      if (mounted) {
        setState(() {
          _isSearching = false;
        });
      }
    }
  }

  void _selectFilter(String filter) {
    setState(() {
      _selectedFilter = filter;
    });

    final query = _textController.text.trim();
    if (query.isNotEmpty) {
      _handleSearchPrompt(query, filter);
    }
  }

  Future<void> _refreshAfterLike() async {
    final query = _textController.text.trim();

    if (query.isNotEmpty) {
      await ref
          .read(searchPromptProvider.notifier)
          .searchPrompt(query, _selectedFilter);
    }

    await ref.read(promptListProvider.notifier).getPromptList('LATEST');

    await ref.read(myProfileProvider.notifier).getMyProfile();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

    @override
    Widget build(BuildContext context) {
      final searchedList = ref.watch(searchPromptProvider);

      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 26),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.gray40, width: 1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    child: Column(
                      children: [
                        TextField(
                          controller: _textController,
                          onSubmitted: (value) {
                            _handleSearchPrompt(value, _selectedFilter);
                          },
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
                        ),
                        const SizedBox(height: 8),
                        Row(
                          spacing: 9,
                          children: [
                            SearchTag(
                              tag: '제목',
                              filterValue: 'TITLE',
                              isSelected: _selectedFilter == 'TITLE',
                              onSelected: _selectFilter,
                            ),
                            SearchTag(
                              tag: '태그',
                              filterValue: 'TAG',
                              isSelected: _selectedFilter == 'TAG',
                              onSelected: _selectFilter,
                            ),
                            SearchTag(
                              tag: '설명',
                              filterValue: 'DESCRIPTION',
                              isSelected: _selectedFilter == 'DESCRIPTION',
                              onSelected: _selectFilter,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(_errorMessage!),
                ),
              Expanded(
                child: _isSearching
                    ? const Center(child: CircularProgressIndicator())
                    : searchedList == null
                    ? const Center(child: Text('검색어를 입력하세요'))
                    : searchedList.prompts.isEmpty
                    ? const Center(child: Text('검색 결과가 없습니다'))
                    : ListView.builder(
                  itemCount: searchedList.prompts.length,
                  itemBuilder: (context, index) {
                    final promptCard = searchedList.prompts[index];

                    return Padding(
                      key: ValueKey(promptCard.promptId),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 26,
                        vertical: 6,
                      ),
                      child: PromptCard(
                        promptId: promptCard.promptId,
                        title: promptCard.title,
                        description: promptCard.description,
                        tag: promptCard.tag,
                        time: timeago.format(promptCard.date, locale: 'ko'),
                        like: promptCard.like,
                        liked: promptCard.liked,
                        onTap: () async {
                          await context.push(
                              '/detail?promptId=${promptCard.promptId}');

                          if (!mounted) return;

                          final query = _textController.text.trim();
                          if (query.isNotEmpty) {
                            await _handleSearchPrompt(query, _selectedFilter);
                          }
                        },
                        onLikeChanged: _refreshAfterLike,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    }
}
