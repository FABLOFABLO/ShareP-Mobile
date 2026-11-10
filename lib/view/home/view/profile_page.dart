import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/common/components/proflie_card.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:share_prompt/common/components/default_app_bar.dart';
import 'package:share_prompt/common/constants/app_color.dart';
import 'package:share_prompt/common/constants/app_text_style.dart';
import 'package:share_prompt/common/components/prompt_card.dart';
import 'package:share_prompt/providers/user_profile_provider.dart';
import 'package:share_prompt/providers/my_profile_provider.dart';
import '../../../providers/prompt_list_provider.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key, required this.userId});

  final int userId;

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  bool isFollowed = false;
  String? _errorMessage;

  Future<void> _loadUserProfile(int userId) async {
    setState(() {
      _errorMessage = null;
    });

    try {
      await ref
          .read(userProfileProvider(widget.userId).notifier)
          .getUserProfile(userId);
    } catch (error, stackTrace) {
      debugPrint('유저페이지 오류: $error, 경로: $stackTrace');
      if (!mounted) return;
      setState(() {
        _errorMessage = '유저 페이지를 불러오지 못했습니다.';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadUserProfile(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    final profileCard = ref.watch(userProfileProvider(widget.userId));

    if (_errorMessage != null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(_errorMessage!)],
          ),
        ),
      );
    }

    if (profileCard == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: const DefaultAppBar(title: '프로필', hasBack: true),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            ProfileCard(
              name: profileCard.base.name,
              promptCount: profileCard.base.promptsCount,
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
                    key: ValueKey(promptsCard.promptId),
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
                      onTap: () => context.push(
                        '/detail?promptId=${promptsCard.promptId}',
                      ),
                      promptId: promptsCard.promptId,
                      liked: promptsCard.liked,
                      onLikeChanged: () async {
                        await ref
                            .read(promptListProvider.notifier)
                            .getPromptList('LATEST');

                        await ref
                            .read(myProfileProvider.notifier)
                            .getMyProfile();
                      },
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
