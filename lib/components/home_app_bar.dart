import 'package:flutter/material.dart';
import 'package:share_prompt/page/home/widget/prompt_sort_button.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 26.0, top: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [PromptSortButton()],
      ),
    );
  }
}
