import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/components/default_app_bar.dart';
import 'package:share_prompt/components/proflie_card.dart';
import 'package:share_prompt/providers/prompts_card_provider.dart';

import '../../components/prompt_card.dart';
import '../../constants/app_color.dart';
import '../../constants/app_text_style.dart';
import '../../model/prompt_card_model.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  bool isFollowed = false;

  @override
  Widget build(BuildContext context) {
    final promptsCards = ref.watch(promptsProvider);

    return Scaffold(
      appBar: const DefaultAppBar(title: '프로필', hasBack: true),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const ProfileCard(
              name: '한지석',
              promptCount: 124,
              followerCount: 4,
              followingCount: 560,
              isProfile: true,
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '프롬프트',
                          textAlign: TextAlign.center,
                          style: AppTextStyles.body1Bold.copyWith(
                            color: AppColor.primary,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  const Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Divider(height: 3, thickness: 2, color: AppColor.primary),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: ListView.builder(
                itemCount: promptCards.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  final promptsCard = promptsCards[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 26,
                      vertical: 6,
                    ),
                    child: PromptCard(
                      title: promptsCard.title,
                      description: promptsCard.description,
                      tag: promptsCard.tag,
                      time: promptsCard.time,
                      like: promptsCard.like,
                      // TODO : 프롬프트 상세 조회 API 연동하기
                      onTap: () => context.push('/detail'),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
