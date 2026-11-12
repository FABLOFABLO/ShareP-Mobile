import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/providers/prompt_detail_provider.dart';
import 'package:share_prompt/services/services/follow_service.dart';
import 'package:share_prompt/view/home/widget/prompt_context.dart';
import 'package:share_prompt/common/components/default_app_bar.dart';
import 'package:share_prompt/common/components/sharep_alert_dialog.dart';
import 'package:share_prompt/common/constants/app_color.dart';
import 'package:share_prompt/common/constants/app_text_style.dart';
import 'package:share_prompt/services/services/prompt_service.dart'
    as prompt_service;

import '../../../providers/my_profile_provider.dart';
import '../../../providers/prompt_list_provider.dart';

class PromptDetailPage extends ConsumerStatefulWidget {
  const PromptDetailPage({super.key, required this.promptId});

  final int promptId;

  @override
  ConsumerState<PromptDetailPage> createState() => _PromptDetailPageState();
}

class _PromptDetailPageState extends ConsumerState<PromptDetailPage> {
  bool isLiked = false;
  String? _promptDetailErrorMessage;
  bool _isUpdatingLike = false;
  bool _isUpdatingFollow = false;

  Future<void> _toggleLike(bool currentlyLiked) async {
    if (_isUpdatingLike) return;

    setState(() => _isUpdatingLike = true);

    try {
      if (currentlyLiked) {
        await prompt_service.unlikePrompt(widget.promptId);
      } else {
        await prompt_service.likePrompt(widget.promptId);
      }

      await ref
          .read(promptDetailProvider(widget.promptId).notifier)
          .getPromptDetail(widget.promptId);

      await ref.read(promptListProvider.notifier).getPromptList('LATEST');

      await ref.read(myProfileProvider.notifier).getMyProfile();
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('좋아요 변경에 실패했습니다.')));
    } finally {
      if (mounted) {
        setState(() => _isUpdatingLike = false);
      }
    }
  }

  Future<void> _deletePrompt() async {
    try {
      await prompt_service.deletePrompt(widget.promptId);

      if (!mounted) return;

      await ref.read(promptListProvider.notifier).getPromptList('LATEST');

      await ref.read(myProfileProvider.notifier).getMyProfile();
      if (!context.mounted) return;

      context.pop(true);
    } catch (error) {
      if (!mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('프롬프트 삭제에 실패했습니다.')));
    }
  }

  Future<void> _loadPromptDetail(int promptId) async {
    setState(() {
      _promptDetailErrorMessage = null;
    });

    try {
      await ref
          .read(promptDetailProvider(promptId).notifier)
          .getPromptDetail(promptId);
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _promptDetailErrorMessage = '해당 프롬프트를 불러오지 못했습니다.';
      });
    }
  }

  Future<void> _toggleFollow(int authorId, bool isFollowing) async {
    if (_isUpdatingFollow) return;

    setState(() => _isUpdatingFollow = true);

    try {
      if (isFollowing) {
        await unFollow(authorId);
      } else {
        await follow(authorId);
      }

      await ref
          .read(promptDetailProvider(widget.promptId).notifier)
          .getPromptDetail(widget.promptId);
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('팔로우 상태 변경에 실패했습니다.')),
      );
    } finally {
      await ref
          .read(myProfileProvider.notifier)
          .getMyProfile();
      if (mounted) {
        setState(() => _isUpdatingFollow = false);
      }
    }
  }


  @override
  void initState() {
    super.initState();
    _loadPromptDetail(widget.promptId);
  }

  @override
  Widget build(BuildContext context) {
    final detail = ref.watch(promptDetailProvider(widget.promptId));

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
                                onTap: _isUpdatingLike
                                    ? null
                                    : () => _toggleLike(detail.liked),
                                child: Row(
                                  children: [
                                    Icon(
                                      detail.liked
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: AppColor.primary,
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
                                  '/profile?userId=${detail.authorId}&isAuthor=${detail.isAuthor}',
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
                              if (!isMine)
                                GestureDetector(
                                  onTap: _isUpdatingFollow
                                      ? null
                                      : () => _toggleFollow(
                                            detail.authorId,
                                            detail.isFollowing,
                                          ),
                                  child: Container(
                                    width: 53,
                                    height: 26,
                                    decoration: BoxDecoration(
                                      color: detail.isFollowing
                                          ? AppColor.secondary
                                          : AppColor.primary,
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: Center(
                                      child: Text(
                                        detail.isFollowing ? '팔로잉' : '팔로우',
                                        style: AppTextStyles.body5.copyWith(
                                          color: detail.isFollowing
                                              ? AppColor.primary
                                              : AppColor.white,
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
                          PromptContext(prompt: detail.prompt, tag: detail.tag),
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
          },
        );
      },
    );
  }
}
