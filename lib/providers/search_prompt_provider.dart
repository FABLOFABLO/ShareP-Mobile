import 'package:flutter_riverpod/legacy.dart';
import 'package:share_prompt/services/models/prompt_list_model.dart';
import 'package:share_prompt/services/services/prompt_service.dart'
    as prompt_service;

final searchPromptProvider =
    StateNotifierProvider<SearchPromptNotifier, PromptListModel?>(
      (ref) => SearchPromptNotifier(),
    );

class SearchPromptNotifier extends StateNotifier<PromptListModel?> {
  SearchPromptNotifier() : super(null);

  Future<void> searchPrompt(String text, String filter) async {
    final searchedList = await prompt_service.searchPrompt(text, filter);

    if (!mounted) return;
    state = searchedList;
  }
}
