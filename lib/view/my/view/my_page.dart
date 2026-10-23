import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/view/my/widget/setting_button.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../common/components/default_app_bar.dart';
import '../../../common/components/prompt_card.dart';
import '../../../common/constants/app_color.dart';
import '../../../common/constants/app_text_style.dart';
import '../../../common/components/proflie_card.dart';
import '../../../providers/my_profile_provider.dart';

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
    final profileCard = ref.watch(myProfileProvider);

    return Scaffold(
      appBar: const DefaultAppBar(title: '마이페이지', actions: [SettingButton()]),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10),
            ProfileCard(
              name: profileCard.base.name,
              promptCount: profileCard.base.promptCount,
              followerCount: profileCard.base.followerCount,
              followingCount: profileCard.base.followingCount,
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
                      itemCount: profileCard.base.prompts.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        final promptCard = profileCard.base.prompts[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 26,
                            vertical: 6,
                          ),
                          child: PromptCard(
                            title: promptCard.title,
                            description: promptCard.description,
                            tag: promptCard.tag,
                            time: timeago.format(promptCard.date, locale: 'ko'),
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
                      itemCount: profileCard.liked.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
                        final promptCard = profileCard.liked[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 26,
                            vertical: 6,
                          ),
                          child: PromptCard(
                            title: promptCard.title,
                            description: promptCard.description,
                            tag: promptCard.tag,
                            time: timeago.format(promptCard.date, locale: 'ko'),
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
