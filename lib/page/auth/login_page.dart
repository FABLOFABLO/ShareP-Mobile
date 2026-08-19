import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/components/bottom_button.dart';
import 'package:share_prompt/components/id_text_field.dart';
import 'package:share_prompt/constants/app_color.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _idController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
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
                keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: AutofillGroup(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(height: 65),
                          Image.asset('assets/logo.png'),
                          const SizedBox(height: 50),

                          IdTextField(
                            text: '아이디',
                            hintText: '아이디를 입력하세요',
                            hasIcon: false,
                            controller: _idController,
                            onSubmitted: (_) {
                              _passwordFocusNode.requestFocus();
                            },
                          ),


                          IdTextField(
                            text: '비밀번호',
                            hintText: '비밀번호를 입력하세요',
                            hasIcon: true,
                            controller: _passwordController,
                            focusNode: _passwordFocusNode,
                            textInputAction: TextInputAction.next,
                            onSubmitted: (_) => TextInputAction.done,
                          ),

                          const Spacer(),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                '계정이 없으신가요?',
                                style: TextStyle(
                                  color: Color(0xFF484555),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                              ),
                              TextButton(
                                onPressed: () => context.go('/sign_up'),
                                child: const Text(
                                  '회원가입',
                                  style: TextStyle(
                                    color: Color(0xFF928CFF),
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          BottomButton(text: '로그인하기', color: AppColor.primary, onTap: () {}),
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
      )
    );
  }
}
