import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import '../../../common/components/prompt_tag.dart';
import '../../../common/constants/app_assets.dart';
import '../../../common/constants/app_color.dart';
import '../../../common/constants/app_text_style.dart';

class PromptContext extends StatefulWidget {
  final String prompt;

  const PromptContext({super.key, required this.prompt});

  @override
  State<PromptContext> createState() => _PromptContextState();
}

class _PromptContextState extends State<PromptContext> {
  final FToast fToast = FToast();

  void showToast() {
    fToast.showToast(
      child: Platform.isAndroid
          ? Container()
          : Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: AppColor.primary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Row(
                  children: [
                    const Icon(Icons.check, size: 26, color: AppColor.white),
                    const SizedBox(width: 15),
                    Text(
                      '복사되었습니다.',
                      style: AppTextStyles.body4Bold.copyWith(
                        color: AppColor.white,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        fToast.removeCustomToast();
                      },
                      icon: const Icon(
                        Icons.cancel,
                        size: 20,
                        color: AppColor.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );
  }

  @override
  void initState() {
    super.initState();
    fToast.init(context);
  }

  @override
  void dispose() {
    fToast.removeQueuedCustomToasts();
    fToast.removeCustomToast();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 310,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                '프롬프트',
                style: AppTextStyles.body1.copyWith(color: AppColor.gray100),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  showToast();
                  Clipboard.setData(ClipboardData(text: widget.prompt));
                },
                child: SvgPicture.asset(AppAssets.copy),
              ),
            ],
          ),
          const SizedBox(height: 9),
          Container(
            width: double.infinity,
            height: 230,
            decoration: BoxDecoration(
              color: AppColor.gray10,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColor.gray40, width: 1.5),
            ),
            child:  Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(widget.prompt, style: AppTextStyles.body4),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [PromptTag(tag: '로고', onTap: () {})],
          ),
        ],
      ),
    );
  }
}
