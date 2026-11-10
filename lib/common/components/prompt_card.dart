import 'package:flutter/material.dart';
import 'package:share_prompt/common/components/prompt_tag.dart';
import 'package:share_prompt/common/constants/app_color.dart';
import 'package:share_prompt/common/constants/app_text_style.dart';
import 'package:share_prompt/services/services/prompt_service.dart';

class PromptCard extends StatefulWidget {
  const PromptCard({
    super.key,
    required this.promptId,
    required this.title,
    required this.description,
    required this.tag,
    required this.time,
    required this.like,
    required this.onTap,
    required this.liked,
    required this.onLikeChanged,
  });

  final String title;
  final String description;
  final String tag;
  final String time;
  final int like;
  final VoidCallback onTap;
  final Future<void> Function() onLikeChanged;
  final int promptId;
  final bool liked;

  @override
  State<PromptCard> createState() => _PromptCardState();
}

class _PromptCardState extends State<PromptCard> {
  late bool _liked;
  late int _likeCount;
  bool _isUpdatingLike = false;

  @override
  void didUpdateWidget(PromptCard oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.liked != widget.liked) {
      _liked = widget.liked;
    }

    if (oldWidget.like != widget.like) {
      _likeCount = widget.like;
    }
  }

  @override
  void initState() {
    super.initState();
    _liked = widget.liked;
    _likeCount = widget.like;
  }

  Future<void> _toggleLike() async {
    if (_isUpdatingLike) return;

    setState(() => _isUpdatingLike = true);

    try {
      if (_liked) {
        await unlikePrompt(widget.promptId);
      } else {
        await likePrompt(widget.promptId);
      }

      if (!mounted) return;
      setState(() {
        _liked = !_liked;
        _likeCount += _liked ? 1 : -1;
      });

      try {
        await widget.onLikeChanged();
      } catch (error) {
        debugPrint('좋아요 목록 새로고침 오류: $error');
      }
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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
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
                child: GestureDetector(
                  onTap: widget.onTap,
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
                        widget.description,
                        textAlign: TextAlign.start,
                        style: AppTextStyles.caption3,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        spacing: 5,
                        children: [
                          PromptTag(
                            tag: widget.tag,
                            inPrompt: true,
                            onTap: () {},
                            hasTap: false,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.time,
                      style: AppTextStyles.body5.copyWith(
                        color: AppColor.gray70,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: _toggleLike,
                      child: Row(
                        children: [
                          Icon(
                            _liked ? Icons.favorite : Icons.favorite_border,
                            color: AppColor.primary,
                            size: 20,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '$_likeCount',
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
      ),
    );
  }
}
