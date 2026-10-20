import 'package:flutter/material.dart';

import '../../../components/bottom_button.dart';
import '../../../components/default_app_bar.dart';
import '../../../components/sharep_text_field.dart';
import '../../../constants/app_color.dart';

class PasswordPage extends StatefulWidget {
  const PasswordPage({super.key});

  @override
  State<PasswordPage> createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
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
                            // TODO : 비밀번호 변경 API 연동하기
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
