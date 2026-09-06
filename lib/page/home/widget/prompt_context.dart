import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:share_prompt/components/prompt_tag.dart';
import 'package:share_prompt/constants/app_assets.dart';
import 'package:share_prompt/constants/app_color.dart';
import 'package:share_prompt/constants/app_text_style.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';

class PromptContext extends StatefulWidget {
  const PromptContext({super.key});

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
                    Icon(Icons.check, size: 26, color: AppColor.white),
                    const SizedBox(width: 15),
                    Text(
                      '복사되었습니다.',
                      style: AppTextStyles.body4Bold.copyWith(
                        color: AppColor.white,
                      ),
                    ),
                    Spacer(),
                    IconButton(
                      onPressed: () {
                        fToast.removeCustomToast();
                      },
                      icon: Icon(Icons.cancel, size: 20, color: AppColor.white),
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
    final String promptContext =
        '당신은 친절한 프로그래밍 선생님입니다.\n고등학교 1학년 학생에게 Spring Boot의 동작 원리를 설명해주세요. 어려운 용어를 사용할 때는 반드시 쉬운 뜻과 예시를 함께 제시하고, 설명이 끝나면 이해도를 확인할 수 있는 간단한 문제 3개를 출제해주세요.';
    return Container(
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
              Spacer(),
              GestureDetector(
                onTap: () {
                  showToast();
                  Clipboard.setData(ClipboardData(text: promptContext));
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
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(promptContext, style: AppTextStyles.body4),
            ),
          ),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              PromptTag(tag: '로고'),
            ],
          )
        ],
      ),
    );
  }
}
