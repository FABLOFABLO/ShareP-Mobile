import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/providers/prompt_detail_provider.dart';
import 'package:share_prompt/view/home/widget/prompt_context.dart';
import '../../../common/components/default_app_bar.dart';
import '../../../common/components/sharep_alert_dialog.dart';
import '../../../common/constants/app_color.dart';
import '../../../common/constants/app_text_style.dart';

class PromptDetailPage extends ConsumerStatefulWidget {
  const PromptDetailPage({super.key, this.isMine = false});

  final bool isMine;

  @override
  ConsumerState<PromptDetailPage> createState() => _PromptDetailPageState();
}

class _PromptDetailPageState extends ConsumerState<PromptDetailPage> {
  bool isLiked = false;
  bool isFollow = false;

  @override
  Widget build(BuildContext context) {
    final detail = ref.watch(promptDetailProvider);
    return Scaffold(
      appBar: DefaultAppBar(
        hasBack: true,
        actions: widget.isMine
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
                                // TODO : 유저 프로필 조회 API 연동하기
                                onTap: () => context.push('/profile'),
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
                              ?widget.isMine
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
        return const SharePalertdialog(title: '정말 해당 프롬프트를\n삭제하시겠습니까?');
      },
    );
  }
}
