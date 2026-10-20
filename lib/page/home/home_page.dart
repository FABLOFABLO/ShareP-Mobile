import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/components/home_app_bar.dart';
import 'package:share_prompt/components/prompt_card.dart';
import 'package:share_prompt/constants/app_color.dart';
import 'package:share_prompt/providers/prompts_card_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final promptCards = ref.watch(promptsProvider);
    return Scaffold(
      appBar: const HomeAppBar(),
      body: SafeArea(
        child: ListView.builder(
          itemCount: promptCards.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            final promptCard = promptCards[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
              child: PromptCard(
                title: promptCard.title,
                description: promptCard.description,
                tag: promptCard.tag,
                time: promptCard.time,
                like: promptCard.like,
                // TODO : 프롬프트 상세조회 API 연동하기
                onTap: () => context.push('/detail'),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        shape: const CircleBorder(),
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.white,
        onPressed: () => context.push('/post'),
        child: const Icon(Icons.add, size: 30),
      ),
    );
  }
}
