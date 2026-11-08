import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/view/home/widget/tag_grid.dart';
import 'package:share_prompt/common/components/bottom_button.dart';
import 'package:share_prompt/common/components/default_app_bar.dart';
import 'package:share_prompt/common/components/sharep_text_field.dart';
import 'package:share_prompt/common/constants/app_color.dart';

import '../../../providers/post_prompt_provider.dart';

class PromptPostPage extends ConsumerStatefulWidget {
  const PromptPostPage({super.key});

  @override
  ConsumerState<PromptPostPage> createState() => _PromptPostPageState();
}

class _PromptPostPageState extends ConsumerState<PromptPostPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contextController = TextEditingController();
  final TextEditingController _promptController = TextEditingController();
  final FocusNode _contextFocusNode = FocusNode();
  final FocusNode _promptFocusNode = FocusNode();
  String? _selectedTag;

  Future<void> _handlePostPrompt() async {
    final title = _titleController.text.trim();
    final description = _contextController.text.trim();
    final prompt = _promptController.text.trim();
    final tag = _selectedTag;

    if (title.isEmpty ||
        description.isEmpty ||
        prompt.isEmpty ||
        tag == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('모든 항목과 태그를 입력해 주세요.')),
      );
      return;
    }

    try {
      await ref.read(postPromptProvider.notifier).postPrompt(
        title: title,
        description: description,
        tag: tag,
        prompt: prompt,
      );

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('프롬프트를 게시했습니다.')),
      );
      context.pop();
    } catch (error, stackTrace) {
      if (!mounted) return;
      debugPrint('프롬프트 게시 실패: $error, 경로: $stackTrace');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('프롬프트 게시에 실패했습니다.')),
      );
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contextController.dispose();
    _promptController.dispose();
    _contextFocusNode.dispose();
    _promptFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: '프롬프트 작성', hasBack: true),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SharepTextField(
                      text: '제목',
                      hintText: '제목을 작성해주세요',
                      hasIcon: false,
                      controller: _titleController,
                      onSubmitted: (_) {
                        _contextFocusNode.requestFocus();
                      },
                      minline: 1,
                      big: true,
                    ),
                    const SizedBox(height: 20),
                    SharepTextField(
                      text: '내용',
                      hintText: '내용을 작성해주세요',
                      hasIcon: false,
                      controller: _contextController,
                      focusNode: _contextFocusNode,
                      onSubmitted: (_) {
                        _promptFocusNode.requestFocus();
                      },
                      minline: 1,
                      big: true,
                    ),
                    const SizedBox(height: 20),
                    SharepTextField(
                      text: '프롬프트',
                      hintText: '프롬프트를 작성해주세요',
                      hasIcon: false,
                      controller: _promptController,
                      focusNode: _promptFocusNode,
                      textInputAction: TextInputAction.done,
                      minline: 7,
                      big: true,
                    ),
                    const SizedBox(height: 20),
                    TagGrid(
                      onTagSelected: (tag) {
                        _selectedTag = tag;
                      },
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(text: '게시하기', color: AppColor.primary, onTap: _handlePostPrompt),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
