import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/components/bottom_button.dart';
import 'package:share_prompt/components/id_text_field.dart';
import 'package:share_prompt/components/pw_text_field.dart';
import 'package:share_prompt/constants/app_assets.dart';
import 'package:share_prompt/constants/app_color.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _checkPasswordController =
      TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _checkPasswordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_validatePasswordMatch);
    _checkPasswordController.addListener(_validatePasswordMatch);
  }

  bool _hasPasswordCheckError = false;

  void _validatePasswordMatch() {
    final password = _passwordController.text;
    final confirmation = _checkPasswordController.text;

    final hasError = confirmation.isNotEmpty && password != confirmation;

    if (_hasPasswordCheckError == hasError) {
      return;
    }

    setState(() {
      _hasPasswordCheckError = hasError;
    });
  }

  @override
  void dispose() {
    _passwordController.removeListener(_validatePasswordMatch);
    _checkPasswordController.removeListener(_validatePasswordMatch);
    _idController.dispose();
    _passwordController.dispose();
    _checkPasswordController.dispose();
    _passwordFocusNode.dispose();
    _checkPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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

                          IdTextField(
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

                          IdTextField(
                            text: '비밀번호',
                            hintText: '비밀번호를 입력하세요',
                            hasIcon: true,
                            controller: _passwordController,
                            focusNode: _passwordFocusNode,
                            textInputAction: TextInputAction.next,
                            onSubmitted: (_) {
                              _checkPasswordFocusNode.requestFocus();
                            },
                            minline: 1,
                            big: false,
                          ),

                          PwTextField(
                            text: '비밀번호 재확인',
                            hintText: '동일한 비밀번호를 입력하세요',
                            hasError: _hasPasswordCheckError,
                            hasIcon: true,
                            controller: _checkPasswordController,
                            focusNode: _checkPasswordFocusNode,
                            textInputAction: TextInputAction.done,
                            onSubmitted: (_) {
                              FocusScope.of(context).unfocus();
                            },
                          ),

                          const Spacer(),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                '이미 계정이 있으신가요?',
                                style: TextStyle(
                                  color: AppColor.gray100,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              TextButton(
                                onPressed: () => context.go('/login'),
                                child: const Text(
                                  '로그인',
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
                            text: '회원가입하기',
                            color: AppColor.primary,
                            onTap: () {},
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
