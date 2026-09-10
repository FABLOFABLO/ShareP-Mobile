import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/components/default_app_bar.dart';
import 'package:share_prompt/constants/app_color.dart';
import 'package:share_prompt/constants/app_text_style.dart';
import 'package:share_prompt/page/my/widget/setting_box.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: '설정', hasBack: true),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              const SizedBox(height: 25),
              Container(
                height: 392,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.5, color: AppColor.gray30),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 38),
                  child: Column(
                    children: [
                      SettingBox(
                        label: '아이디 변경',
                        onTap: () => context.push('/id'),
                      ),
                      SettingBox(
                        label: '닉네임 변경',
                        onTap: () => context.push('/nickname'),
                      ),
                      SettingBox(
                        label: '비밀번호 변경',
                        onTap: () => context.push('/password'),
                      ),
                      SettingBox(
                        label: '로그아웃',
                        onTap: () {
                          showCupertinoDialog(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: const Text('로그아웃 하시겠습니까?'),
                                actions: [
                                  CupertinoDialogAction(
                                    isDestructiveAction: true,
                                    onPressed: () => context.pop(),
                                    child: Text(
                                      '예',
                                      style: AppTextStyles.body2Bold.copyWith(
                                        color: AppColor.primary,
                                      ),
                                    ),
                                  ),
                                  CupertinoDialogAction(
                                    onPressed: () => context.pop(),
                                    child: Text(
                                      '아니오',
                                      style: AppTextStyles.body2Bold.copyWith(
                                        color: AppColor.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                      SettingBox(
                        label: '회원탈퇴',
                        onTap: () {
                          showCupertinoDialog(
                            context: context,
                            builder: (context) {
                              return CupertinoAlertDialog(
                                title: const Text('회원탈퇴를 하시겠습니까?'),
                                actions: [
                                  CupertinoDialogAction(
                                    isDestructiveAction: true,
                                    onPressed: () {
                                      context.pop();
                                      _showDeleteAccount(context);
                                    },
                                    child: Text(
                                      '예',
                                      style: AppTextStyles.body2Bold.copyWith(
                                        color: AppColor.primary,
                                      ),
                                    ),
                                  ),
                                  CupertinoDialogAction(
                                    onPressed: () => context.pop(),
                                    child: Text(
                                      '아니오',
                                      style: AppTextStyles.body2Bold.copyWith(
                                        color: AppColor.primary,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDeleteAccount(BuildContext context) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Text('정말로 회원탈퇴를 하시겠습니까?'),
          actions: [
            CupertinoDialogAction(
              isDestructiveAction: true,
              onPressed: () => context.pop(),
              child: Text(
                '예',
                style: AppTextStyles.body2Bold.copyWith(
                  color: AppColor.primary,
                ),
              ),
            ),
            CupertinoDialogAction(
              onPressed: () => Navigator.of(
                context,
              ).popUntil(ModalRoute.withName('/setting')),
              child: Text(
                '아니오',
                style: AppTextStyles.body2Bold.copyWith(
                  color: AppColor.primary,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
