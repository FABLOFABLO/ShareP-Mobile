import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/components/home_app_bar.dart';
import 'package:share_prompt/components/prompt_card.dart';
import 'package:share_prompt/constants/app_color.dart';
import 'package:share_prompt/model/prompt_card_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<PromptCardModel> _promptCards = [
      PromptCardModel(
        title: '브랜드 로고 디자인 프롬프트',
        description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
        tag: '로고',
        author: '한지석',
        like: 12,
        id: 19,
      ),
      PromptCardModel(
        title: '브랜드 로고 디자인 프롬프트',
        description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
        tag: '로고',
        author: '한지석',
        like: 12,
        id: 20,
      ),
      PromptCardModel(
        title: '브랜드 로고 디자인 프롬프트',
        description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
        tag: '로고',
        author: '한지석',
        like: 12,
        id: 21,
      ),
      PromptCardModel(
        title: '브랜드 로고 디자인 프롬프트',
        description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
        tag: '로고',
        author: '한지석',
        like: 12,
        id: 22,
      ),
      PromptCardModel(
        title: '브랜드 로고 디자인 프롬프트',
        description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
        tag: '로고',
        author: '한지석',
        like: 12,
        id: 23,
      ),
      PromptCardModel(
        title: '브랜드 로고 디자인 프롬프트',
        description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
        tag: '로고',
        author: '한지석',
        like: 12,
        id: 24,
      ),
      PromptCardModel(
        title: '브랜드 로고 디자인 프롬프트',
        description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
        tag: '로고',
        author: '한지석',
        like: 12,
        id: 25,
      ),
      PromptCardModel(
        title: '브랜드 로고 디자인 프롬프트',
        description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
        tag: '로고',
        author: '한지석',
        like: 12,
        id: 26,
      ),
      PromptCardModel(
        title: '브랜드 로고 디자인 프롬프트',
        description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
        tag: '로고',
        author: '한지석',
        like: 12,
        id: 27,
      ),
      PromptCardModel(
        title: '브랜드 로고 디자인 프롬프트',
        description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
        tag: '로고',
        author: '한지석',
        like: 12,
        id: 28,
      ),
      PromptCardModel(
        title: '브랜드 로고 디자인 프롬프트',
        description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
        tag: '로고',
        author: '한지석',
        like: 12,
        id: 29,
      ),
      PromptCardModel(
        title: '브랜드 로고 디자인 프롬프트',
        description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
        tag: '로고',
        author: '한지석',
        like: 12,
        id: 30,
      ),
      PromptCardModel(
        title: '브랜드 로고 디자인 프롬프트',
        description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
        tag: '로고',
        author: '한지석',
        like: 12,
        id: 31,
      ),
      PromptCardModel(
        title: '브랜드 로고 디자인 프롬프트',
        description: '로고만들때 사용해보세요.\n유용한 프롬프트입니다 :)',
        tag: '로고',
        author: '한지석',
        like: 12,
        id: 32,
      ),
    ];
    return Scaffold(
      appBar: HomeAppBar(),
      body: SafeArea(
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
                author: _promptCards[index].author,
                like: _promptCards[index].like,
                onTap: () => context.push('/detail'),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        shape: const CircleBorder(),
        child: Icon(Icons.add, size: 30),
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.white,
        onPressed: () => context.push('/post'),
      ),
    );
  }
}
