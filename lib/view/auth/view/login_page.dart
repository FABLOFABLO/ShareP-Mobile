import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/common/components/bottom_button.dart';
import 'package:share_prompt/common/components/sharep_text_field.dart';
import 'package:share_prompt/common/constants/app_assets.dart';
import 'package:share_prompt/common/constants/app_color.dart';
import 'package:share_prompt/providers/auth_provider.dart';


class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();

  Future<void> _handleLogin() async {
    if (ref.read(authProvider)) return;

    final id = _idController.text.trim();
    final password = _passwordController.text;

    if (id.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('아이디와 비밀번호를 입력해주세요.')),
      );
      return;
    }

    try {
      await ref.read(authProvider.notifier).login(
        id: id,
        password: password,
      );

      if (!mounted) return;
      context.go('/home');
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('로그인에 실패했습니다. 다시 확인해주세요.')),
      );
    }
  }

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authProvider);

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
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
                          const SizedBox(height: 65),
                          Image.asset(AppAssets.logo),
                          const SizedBox(height: 50),

                          SharepTextField(
                            text: '아이디',
                            hintText: '아이디를 입력하세요',
                            hasIcon: false,
                            controller: _idController,
                            onSubmitted: (_) {
                              _passwordFocusNode.requestFocus();
                            },
                            minline: 1,
                            big: false,
                          ),
                          const SizedBox(height: 17),
                          SharepTextField(
                            text: '비밀번호',
                            hintText: '비밀번호를 입력하세요',
                            hasIcon: true,
                            controller: _passwordController,
                            focusNode: _passwordFocusNode,
                            textInputAction: TextInputAction.next,
                            onSubmitted: (_) => TextInputAction.done,
                            minline: 1,
                            big: false,
                          ),

                          const Spacer(),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                '계정이 없으신가요?',
                                style: TextStyle(
                                  color: AppColor.gray100,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              TextButton(
                                onPressed: () => context.go('/sign_up'),
                                child: const Text(
                                  '회원가입',
                                  style: TextStyle(
                                    color: AppColor.primary,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          BottomButton(
                            text: isLoading ? '로그인 중...' : '로그인하기',
                            color: AppColor.primary,
                            onTap: _handleLogin
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
