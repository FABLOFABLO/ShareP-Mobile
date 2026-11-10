import 'package:flutter_riverpod/legacy.dart';
import 'package:share_prompt/services/models/prompt_detail_model.dart';
import 'package:share_prompt/services/services/prompt_service.dart'
    as prompt_service;

final promptDetailProvider =
    StateNotifierProvider.family<PromptDetailNotifier, PromptDetailModel?, int>(
            (ref, promptId) => PromptDetailNotifier()
    );

class PromptDetailNotifier extends StateNotifier<PromptDetailModel?> {
  PromptDetailNotifier() : super(null);

  Future<void> getPromptDetail(int promptId) async {
    final prompt = await prompt_service.getPromptDetail(promptId);

    if (!mounted) return;
    state = prompt;
  }
}
