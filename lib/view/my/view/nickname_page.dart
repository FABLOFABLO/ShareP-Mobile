import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/common/components/bottom_button.dart';
import 'package:share_prompt/common/components/default_app_bar.dart';
import 'package:share_prompt/common/components/sharep_text_field.dart';
import 'package:share_prompt/common/constants/app_color.dart';
import 'package:share_prompt/providers/auth_provider.dart';
import 'package:share_prompt/providers/my_profile_provider.dart';

class NicknamePage extends ConsumerStatefulWidget {
  const NicknamePage({super.key});

  @override
  ConsumerState<NicknamePage> createState() => _NicknamePageState();
}

class _NicknamePageState extends ConsumerState<NicknamePage> {
  final TextEditingController _wantNicknameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _wantNicknameController.dispose();
  }

  Future<void> _handleNickName() async {
    if (ref.read(authProvider)) return;

    final nickName = _wantNicknameController.text.trim();

    if (nickName.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('닉네임을 입력해주세요.')));
      return;
    }
    try {
      await ref.read(authProvider.notifier).changeNickName(nickName: nickName);
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('닉네임 변경이 실패하였습니다. 다시 확인해 주세요.')),
      );
      return;
    }
    try {
      await ref.read(myProfileProvider.notifier).getMyProfile();
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('마이페이지를 불러오는데 실패하였습니다. 다시 확인해 주세요.')),
      );
    }
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
                            onTap: _handleNickName,
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
