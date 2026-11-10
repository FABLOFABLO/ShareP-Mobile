import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/view/my/widget/setting_box.dart';
import 'package:share_prompt/common/components/default_app_bar.dart';
import 'package:share_prompt/common/components/sharep_alert_dialog.dart';
import 'package:share_prompt/common/constants/app_color.dart';
import 'package:share_prompt/providers/auth_provider.dart';

class SettingPage extends ConsumerStatefulWidget {
  const SettingPage({super.key});

  @override
  ConsumerState<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends ConsumerState<SettingPage> {
  Future<void> handleLogout() async {
    if (ref.read(authProvider)) return;

    try {
      await ref.read(authProvider.notifier).logout();
    } catch (_) {}
    if (!mounted) return;
    context.go('/login');
  }

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
                height: 330,
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
                              return SharePalertdialog(
                                title: '정말 로그아웃 하시겠습니까?',
                                onTap: () {
                                  handleLogout();
                                  if(!context.mounted) return;
                                  context.pop();
                                },
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
}
