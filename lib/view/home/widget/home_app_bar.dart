import 'package:flutter/material.dart';

import 'prompt_sort_button.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.selectedSort,
    required this.onSortChanged,
  });

  final String selectedSort;
  final ValueChanged<String> onSortChanged;

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 26.0, top: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PromptSortButton(
            selectedSort: widget.selectedSort,
            onSortChanged: widget.onSortChanged,
          ),
        ],
      ),
    );
  }
}
