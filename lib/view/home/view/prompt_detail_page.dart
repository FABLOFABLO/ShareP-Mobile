import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/providers/prompt_detail_provider.dart';
import 'package:share_prompt/view/home/widget/prompt_context.dart';
import 'package:share_prompt/common/components/default_app_bar.dart';
import 'package:share_prompt/common/components/sharep_alert_dialog.dart';
import 'package:share_prompt/common/constants/app_color.dart';
import 'package:share_prompt/common/constants/app_text_style.dart';
import 'package:share_prompt/services/services/prompt_service.dart'
    as prompt_service;

class PromptDetailPage extends ConsumerStatefulWidget {
  const PromptDetailPage({super.key, required this.promptId});

  final int promptId;

  @override
  ConsumerState<PromptDetailPage> createState() => _PromptDetailPageState();
}

class _PromptDetailPageState extends ConsumerState<PromptDetailPage> {
  bool isLiked = false;
  bool isFollow = false;
  String? _promptDetailErrorMessage;

  Future<void> _deletePrompt() async {
    try {
      await prompt_service.deletePrompt(widget.promptId);

      if (!mounted) return;
      context.pop(true);
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('프롬프트 삭제에 실패했습니다.')),
      );
    }
  }

  Future<void> _loadPromptDetail(int promptId) async {
    setState(() {
      _promptDetailErrorMessage = null;
    });

    try {
      await ref.read(promptDetailProvider.notifier).getPromptDetail(promptId);
    } catch (e, stackTrace) {
      debugPrint('상세조회 오류: $e, 경로: $stackTrace');
      if (!mounted) return;
      setState(() {
        _promptDetailErrorMessage = '해당 프롬프트를 불러오지 못했습니다.';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadPromptDetail(widget.promptId);
  }

  @override
  Widget build(BuildContext context) {
    final detail = ref.watch(promptDetailProvider);

    if (_promptDetailErrorMessage != null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(_promptDetailErrorMessage!)],
          ),
        ),
      );
    }
    if (detail == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final isMine = detail.isAuthor;

    return Scaffold(
      appBar: DefaultAppBar(
        hasBack: true,
        actions: isMine
            ? [
                TextButton(
                  onPressed: showDeletePrompt,
                  child: Text(
                    '삭제',
                    style: AppTextStyles.body2Bold.copyWith(
                      color: AppColor.error,
                    ),
                  ),
                ),
              ]
            : null,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                detail.title,
                                style: AppTextStyles.title1.copyWith(
                                  color: AppColor.gray100,
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
                                      isLiked
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: isLiked
                                          ? AppColor.primary
                                          : AppColor.primary,
                                      size: 25,
                                    ),
                                    const SizedBox(width: 3),
                                    Text(
                                      '${detail.like}',
                                      style: AppTextStyles.body4Bold.copyWith(
                                        color: AppColor.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 14),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () => context.push(
                                  '/profile?userId=${detail.authorId}',
                                ),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 13,
                                      backgroundColor: AppColor.gray50,
                                      child: Icon(
                                        Icons.person,
                                        color: AppColor.white,
                                        size: 20,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      detail.author,
                                      style: AppTextStyles.body1.copyWith(
                                        color: AppColor.gray100,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              ?isMine
                                  ? null
                                  : GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isFollow = !isFollow;
                                        });
                                      },
                                      child: Container(
                                        width: 53,
                                        height: 26,
                                        decoration: BoxDecoration(
                                          color: isFollow
                                              ? AppColor.primary
                                              : AppColor.secondary,
                                          borderRadius: BorderRadius.circular(
                                            100,
                                          ),
                                        ),
                                        child: Center(
                                          child: isFollow
                                              ? Text(
                                                  '팔로우',
                                                  style: AppTextStyles.body5
                                                      .copyWith(
                                                        color: AppColor.white,
                                                      ),
                                                )
                                              : Text(
                                                  '팔로잉',
                                                  style: AppTextStyles.body5
                                                      .copyWith(
                                                        color: AppColor.primary,
                                                      ),
                                                ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                          const SizedBox(height: 34),
                          Text(
                            detail.description,
                            style: AppTextStyles.body3.copyWith(
                              color: AppColor.gray100,
                            ),
                          ),
                          const SizedBox(height: 34),
                          PromptContext(prompt: detail.prompt),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showDeletePrompt() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return SharePalertdialog(
          title: '정말 해당 프롬프트를\n삭제하시겠습니까?',
          onTap: () async {
            context.pop();
            await _deletePrompt();
          }
        );
      },
    );
  }
}
