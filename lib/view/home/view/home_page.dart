import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:share_prompt/providers/prompt_list_provider.dart';
import 'package:share_prompt/view/home/widget/home_app_bar.dart';
import 'package:share_prompt/common/components/prompt_card.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:share_prompt/common/constants/app_color.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  String _sort = 'LATEST';
  String? _promptListErrorMessage;
  String? _promptDetailErrorMessage;

  Future<void> _loadPromptList(String sort) async {
    setState(() {
      _sort = sort;
      _promptListErrorMessage = null;
    });

    try {
      await ref.read(promptListProvider.notifier).getPromptList(sort);
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _promptListErrorMessage = '게시글 목록을 불러오지 못했습니다.';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _loadPromptList('LATEST');
    });
  }

  @override
  Widget build(BuildContext context) {
    final promptList = ref.watch(promptListProvider);

    if (_promptListErrorMessage != null) {
      return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(_promptListErrorMessage!)],
          ),
        ),
      );
    }

    if (promptList == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: HomeAppBar(selectedSort: _sort, onSortChanged: _loadPromptList),
      body: SafeArea(
        child: ListView.builder(
          itemCount: promptList.prompts.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            final promptCard = promptList.prompts[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 6),
              child: PromptCard(
                title: promptCard.title,
                description: promptCard.description,
                tag: promptCard.tag,
                time: timeago.format(promptCard.date, locale: 'ko'),
                like: promptCard.like,
                onTap: () async {
                  final deleted = await context.push<bool>(
                    '/detail?promptId=${promptCard.promptId}',
                  );

                  if (deleted == true && context.mounted) {
                    await _loadPromptList(_sort);
                  }
                },
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
