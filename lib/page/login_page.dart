import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/components/text_field.dart';

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
    return SafeArea(
      child: Scaffold(
        body: AutofillGroup(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 40),
              Image.asset('assets/logo.png'),
              IdTextField(
                text: '아이디',
                hasIcon: false,
                controller: _idController,
                onSubmitted: (_) => _passwordFocusNode.requestFocus(),
              ),
              const SizedBox(height: 10),
              IdTextField(
                text: '비밀번호',
                hasIcon: true,
                controller: _passwordController,
                focusNode: _passwordFocusNode,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => FocusScope.of(context).unfocus(),
              ),
              const SizedBox(height: 350),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('계정이 없으신가요?', style: TextStyle(color: Color(0xFF484555), fontWeight: FontWeight.w500,fontSize: 16),),
                  TextButton(onPressed: () => context.push('/sign_up'), child: Text('회원가입', style: TextStyle(color: Color(0xFF6B4EFE), fontWeight: FontWeight.w700, fontSize: 16))),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Color(0xFF6B4EFE),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(child: Text('로그인하기', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w600))),
                  ),
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
