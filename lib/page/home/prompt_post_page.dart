import 'package:flutter/material.dart';
import 'package:share_prompt/components/default_app_bar.dart';
import 'package:share_prompt/components/id_text_field.dart';
import 'package:share_prompt/page/home/widget/tag_grid.dart';

import '../../components/bottom_button.dart';
import '../../constants/app_color.dart';

class PromptPostPage extends StatefulWidget {
  const PromptPostPage({super.key});

  @override
  State<PromptPostPage> createState() => _PromptPostPageState();
}

class _PromptPostPageState extends State<PromptPostPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contextController = TextEditingController();
  final TextEditingController _promptController = TextEditingController();
  final FocusNode _contextFocusNode = FocusNode();
  final FocusNode _promptFocusNode = FocusNode();

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
      appBar: const DefaultAppBar(label: '프롬프트 작성'),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    IdTextField(
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
                    IdTextField(
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
                    IdTextField(
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
                    const TagGrid(),
                  ],
                ),
              ),
            ),
            // TODO : 프롬프트 게시 API 연동하기
            BottomButton(text: '게시하기', color: AppColor.primary, onTap: () {}),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
