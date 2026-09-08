import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/components/default_app_bar.dart';
import 'package:share_prompt/components/proflie_card.dart';

import '../../components/prompt_card.dart';
import '../../constants/app_color.dart';
import '../../constants/app_text_style.dart';
import '../../model/prompt_card_model.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final List<PromptCardModel> _promptCards = [
    PromptCardModel(
      title: '브랜드 로고 디자인 프롬프트',
      description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
      tag: '로고',
      time: '3시간 전',
      like: 12,
      id: 19,
    ),
    PromptCardModel(
      title: '브랜드 로고 디자인 프롬프트',
      description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
      tag: '로고',
      time: '3시간 전',
      like: 12,
      id: 20,
    ),
    PromptCardModel(
      title: '브랜드 로고 디자인 프롬프트',
      description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
      tag: '로고',
      time: '3시간 전',
      like: 12,
      id: 21,
    ),
    PromptCardModel(
      title: '브랜드 로고 디자인 프롬프트',
      description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
      tag: '로고',
      time: '3시간 전',
      like: 12,
      id: 22,
    ),
    PromptCardModel(
      title: '브랜드 로고 디자인 프롬프트',
      description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
      tag: '로고',
      time: '3시간 전',
      like: 12,
      id: 23,
    ),
    PromptCardModel(
      title: '브랜드 로고 디자인 프롬프트',
      description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
      tag: '로고',
      time: '3시간 전',
      like: 12,
      id: 24,
    ),
    PromptCardModel(
      title: '브랜드 로고 디자인 프롬프트',
      description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
      tag: '로고',
      time: '3시간 전',
      like: 12,
      id: 25,
    ),
    PromptCardModel(
      title: '브랜드 로고 디자인 프롬프트',
      description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
      tag: '로고',
      time: '3시간 전',
      like: 12,
      id: 26,
    ),
    PromptCardModel(
      title: '브랜드 로고 디자인 프롬프트',
      description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
      tag: '로고',
      time: '3시간 전',
      like: 12,
      id: 27,
    ),
    PromptCardModel(
      title: '브랜드 로고 디자인 프롬프트',
      description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
      tag: '로고',
      time: '3시간 전',
      like: 12,
      id: 28,
    ),
    PromptCardModel(
      title: '브랜드 로고 디자인 프롬프트',
      description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
      tag: '로고',
      time: '3시간 전',
      like: 12,
      id: 29,
    ),
    PromptCardModel(
      title: '브랜드 로고 디자인 프롬프트',
      description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
      tag: '로고',
      time: '3시간 전',
      like: 12,
      id: 30,
    ),
    PromptCardModel(
      title: '브랜드 로고 디자인 프롬프트',
      description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
      tag: '로고',
      time: '3시간 전',
      like: 12,
      id: 31,
    ),
    PromptCardModel(
      title: '브랜드 로고 디자인 프롬프트',
      description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
      tag: '로고',
      time: '3시간 전',
      like: 12,
      id: 32,
    ),
  ];
  bool isFollowed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(title: '프로필', hasBack: true,),
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
            const SizedBox(height: 40,),
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
                      Divider(
                        height: 3,
                        thickness: 2,
                        color: AppColor.primary,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25,),
            Expanded(
              child: ListView.builder(
                itemCount: _promptCards.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
                    child: PromptCard(
                      title: _promptCards[index].title,
                      description: _promptCards[index].description,
                      tag: _promptCards[index].tag,
                      time: _promptCards[index].time,
                      like: _promptCards[index].like,
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
