import 'package:flutter_riverpod/legacy.dart';
import 'package:share_prompt/services/models/prompt_list_model.dart';
import 'package:share_prompt/services/services/prompt_service.dart'
  as prompt_service;


final promptListProvider =
    StateNotifierProvider<PromptListNotifier, PromptListModel?>(
      (ref) => PromptListNotifier(),
    );

class PromptListNotifier extends StateNotifier<PromptListModel?> {
  PromptListNotifier() : super(null);

  Future<void> getPromptList(String sort) async {
    final profile = await prompt_service.getPromptList(sort);

    if (!mounted) return;
    state = profile;
  }
}
