import 'package:flutter/material.dart';

import 'package:share_prompt/core/widgets/bottom_button.dart';
import 'package:share_prompt/core/widgets/default_app_bar.dart';
import 'package:share_prompt/core/widgets/sharep_text_field.dart';
import 'package:share_prompt/core/constants/app_color.dart';

class NicknamePage extends StatefulWidget {
  const NicknamePage({super.key});

  @override
  State<NicknamePage> createState() => _NicknamePageState();
}

class _NicknamePageState extends State<NicknamePage> {
  final TextEditingController _wantNicknameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _wantNicknameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: const DefaultAppBar(title: '닉네임 변경', hasBack: true),
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
                            text: '변경할 닉네임',
                            hintText: '변경할 닉네임을 입력하세요',
                            hasIcon: false,
                            controller: _wantNicknameController,
                            textInputAction: TextInputAction.next,
                            onSubmitted: (_) => TextInputAction.done,
                            minline: 1,
                            big: false,
                          ),
                          const Spacer(),
                          BottomButton(
                            text: '변경하기',
                            color: AppColor.primary,
                            // TODO : 닉네임 변경 API 연동하기
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
