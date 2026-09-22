import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/core/widgets/default_app_bar.dart';
import 'package:share_prompt/core/constants/app_color.dart';
import 'package:share_prompt/core/constants/app_text_style.dart';
import 'package:share_prompt/features/my/view/widgets/setting_button.dart';
import 'package:share_prompt/features/profile/view_model/profile_provider.dart';
import 'package:share_prompt/features/prompt/view_model/prompts_card_provider.dart';
import 'package:share_prompt/features/profile/view/widgets/proflie_card.dart';
import 'package:share_prompt/features/prompt/view/widgets/prompt_card.dart';

class MyPage extends ConsumerStatefulWidget {
  const MyPage({super.key});

  @override
  ConsumerState<MyPage> createState() => _MyPageState();
}

class _MyPageState extends ConsumerState<MyPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final promptsCards = ref.watch(promptsProvider);
    final profileCard = ref.watch(profileProvider);

    return Scaffold(
      appBar: const DefaultAppBar(title: '마이페이지', actions: [SettingButton()]),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            ProfileCard(
              name: profileCard.name,
              promptCount: profileCard.promptCount,
              followerCount: profileCard.followerCount,
              followingCount: profileCard.followingCount,
              isProfile: false,
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TabBar(
                labelPadding: EdgeInsets.zero,
                labelStyle: AppTextStyles.body1Bold.copyWith(
                  color: AppColor.primary,
                ),
                unselectedLabelStyle: AppTextStyles.body2.copyWith(
                  color: AppColor.gray50,
                ),
                indicatorColor: AppColor.primary,
                indicatorWeight: 2,
                indicatorSize: TabBarIndicatorSize.tab,
                overlayColor: WidgetStateProperty.resolveWith((states) {
                  return Colors.transparent;
                }),
                splashFactory: NoSplash.splashFactory,
                onTap: (int index) {},
                isScrollable: false,
                controller: _tabController,
                tabs: const [
                  Tab(text: '내 프롬프트'),
                  Tab(text: '좋아요한 프롬프트'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                physics: const ClampingScrollPhysics(),
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: promptsCards.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        final promptCard = promptsCards[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 26,
                            vertical: 6,
                          ),
                          child: PromptCard(
                            title: promptCard.title,
                            description: promptCard.description,
                            tag: promptCard.tag,
                            time: promptCard.time,
                            like: promptCard.like,
                            // TODO : 프롬프트 상세 조회 API 연동하기
                            onTap: () => context.push('/detail?isMine=true'),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: promptCards.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        final promptCard = promptCards[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 26,
                            vertical: 6,
                          ),
                          child: PromptCard(
                            title: promptCard.title,
                            description: promptCard.description,
                            tag: promptCard.tag,
                            time: promptCard.time,
                            like: promptCard.like,
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
          ],
        ),
      ),
    );
  }
}
