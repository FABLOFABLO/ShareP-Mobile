import 'package:flutter/material.dart';
import 'package:share_prompt/components/default_app_bar.dart';
import '../../../components/bottom_button.dart';
import '../../../components/sharep_text_field.dart';
import '../../../constants/app_color.dart';

class IdPage extends StatefulWidget {
  const IdPage({super.key});

  @override
  State<IdPage> createState() => _IdPageState();
}

class _IdPageState extends State<IdPage> {
  final TextEditingController _nowIdController = TextEditingController();
  final TextEditingController _wantIdController = TextEditingController();
  final FocusNode _wantIdFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _nowIdController.dispose();
    _wantIdController.dispose();
    _wantIdFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        appBar: const DefaultAppBar(title: '아이디 변경', hasBack: true),
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
                            text: '현재 아이디',
                            hintText: '현재 아이디를 입력하세요',
                            hasIcon: false,
                            controller: _nowIdController,
                            onSubmitted: (_) {
                              _wantIdFocusNode.requestFocus();
                            },
                            minline: 1,
                            big: false,
                          ),
                          const SizedBox(height: 45),
                          SharepTextField(
                            text: '변경할 아이디',
                            hintText: '변경할 아이디를 입력하세요',
                            hasIcon: false,
                            controller: _wantIdController,
                            focusNode: _wantIdFocusNode,
                            textInputAction: TextInputAction.next,
                            onSubmitted: (_) => TextInputAction.done,
                            minline: 1,
                            big: false,
                          ),
                          const Spacer(),
                          BottomButton(
                            text: '변경하기',
                            color: AppColor.primary,
                            // TODO : 아이디 변경 API 연동하기
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
