import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/common/components/bottom_button.dart';
import 'package:share_prompt/common/components/default_app_bar.dart';
import 'package:share_prompt/common/components/sharep_text_field.dart';
import 'package:share_prompt/common/constants/app_color.dart';
import 'package:share_prompt/providers/auth_provider.dart';

class PasswordPage extends ConsumerStatefulWidget {
  const PasswordPage({super.key});

  @override
  ConsumerState<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends ConsumerState<PasswordPage> {
  final TextEditingController _nowPwController = TextEditingController();
  final TextEditingController _wantPwController = TextEditingController();
  final FocusNode _wantPwFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _nowPwController.dispose();
    _wantPwController.dispose();
    _wantPwFocusNode.dispose();
  }

  Future<void> _handlePassword() async {
    if (ref.read(authProvider)) return;

    final currentPassword = _nowPwController.text.trim();
    final newPassword = _wantPwController.text.trim();

    if (currentPassword.isEmpty || newPassword.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('비밀번호를 입력해주세요.')));
      return;
    }
    await ref
        .read(authProvider.notifier)
        .changePassword(
          currentPassword: currentPassword,
          newPassword: newPassword,
        );
    if (!mounted) return;
    context.go('/my');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: const DefaultAppBar(title: '비밀번호 변경', hasBack: true),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: AutofillGroup(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 47),
                          SharepTextField(
                            text: '현재 비밀번호',
                            hintText: '현재 비밀번호를 입력하세요',
                            hasIcon: true,
                            controller: _nowPwController,
                            onSubmitted: (_) {
                              _wantPwFocusNode.requestFocus();
                            },
                            minline: 1,
                            big: false,
                          ),
                          const SizedBox(height: 45),
                          SharepTextField(
                            text: '변경할 비밀번호',
                            hintText: '변경할 비밀번호를 입력하세요',
                            hasIcon: true,
                            controller: _wantPwController,
                            focusNode: _wantPwFocusNode,
                            textInputAction: TextInputAction.next,
                            onSubmitted: (_) => TextInputAction.done,
                            minline: 1,
                            big: false,
                          ),
                          const Spacer(),
                          BottomButton(
                            text: '변경하기',
                            color: AppColor.primary,
                            onTap: _handlePassword,
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
