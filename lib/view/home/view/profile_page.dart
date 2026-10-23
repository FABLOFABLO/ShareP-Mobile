import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/common/components/proflie_card.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../common/components/default_app_bar.dart';
import '../../../common/constants/app_color.dart';
import '../../../common/constants/app_text_style.dart';
import '../../../common/components/prompt_card.dart';
import '../../../providers/user_profile_provider.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  bool isFollowed = false;

  @override
  Widget build(BuildContext context) {
    final profileCard = ref.watch(userProfileProvider);

    return Scaffold(
      appBar: const DefaultAppBar(title: '프로필', hasBack: true),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            ProfileCard(
              name: profileCard.base.name,
              promptCount: profileCard.base.promptCount,
              followerCount: profileCard.base.followerCount,
              followingCount: profileCard.base.followingCount,
              isProfile: profileCard.isFollowing,
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
                itemCount: profileCard.base.prompts.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  final promptsCard = profileCard.base.prompts[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 26,
                      vertical: 6,
                    ),
                    child: PromptCard(
                      title: promptsCard.title,
                      description: promptsCard.description,
                      tag: promptsCard.tag,
                      time: timeago.format(promptsCard.date, locale: 'ko'),
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
