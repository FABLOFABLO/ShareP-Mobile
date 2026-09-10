import 'package:flutter/material.dart';
import 'package:share_prompt/constants/app_color.dart';
import 'package:share_prompt/constants/app_text_style.dart';

class SharepTextField extends StatefulWidget {
  final String text;
  final String hintText;
  final bool hasIcon;
  final bool hasError;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final TextInputAction textInputAction;
  final ValueChanged<String>? onSubmitted;
  final int minline;
  final bool big;

  const SharepTextField({
    super.key,
    required this.text,
    required this.hintText,
    required this.hasIcon,
    required this.controller,
    this.focusNode,
    this.textInputAction = TextInputAction.next,
    this.onSubmitted,
    required this.minline,
    required this.big,
    this.hasError = false,
  });

  @override
  State<SharepTextField> createState() => _SharepTextFieldState();
}

class _SharepTextFieldState extends State<SharepTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.hasIcon;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.text,
            style: widget.big ? AppTextStyles.body1 : AppTextStyles.body4,
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: double.infinity,
            height: widget.minline == 1 ? 40 : null,
            child: TextField(
              minLines: widget.minline,
              maxLines: widget.minline,
              cursorHeight: 18,
              cursorWidth: 1,
              cursorColor: AppColor.gray100,
              controller: widget.controller,
              focusNode: widget.focusNode,
              obscureText: widget.hasIcon && _obscureText,
              keyboardType: widget.hasIcon
                  ? TextInputType.visiblePassword
                  : TextInputType.text,
              textInputAction: widget.textInputAction,
              onSubmitted: widget.onSubmitted,
              decoration: InputDecoration(
                isDense: true,
                hintText: widget.hintText,
                hintStyle: AppTextStyles.body4.copyWith(color: AppColor.gray40),
                filled: true,
                fillColor: AppColor.gray10,
                contentPadding: widget.hasIcon
                    ? const EdgeInsets.symmetric(horizontal: 16)
                    : const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColor.gray40,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(
                    color: AppColor.gray40,
                    width: 1,
                  ),
                ),
                suffixIcon: widget.hasIcon
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppColor.gray60,
                        ),
                      )
                    : null,
                suffixIconConstraints: const BoxConstraints(
                  minWidth: 20,
                  minHeight: 20,
                ),
              ),
            ),
          ),
          widget.hasError
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(Icons.error, color: AppColor.error, size: 13),
                      const SizedBox(width: 2),
                      Text(
                        '비밀번호가 일치하지 않습니다.',
                        style: AppTextStyles.body5.copyWith(
                          color: AppColor.error,
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
