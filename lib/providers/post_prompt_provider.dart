import 'package:flutter_riverpod/legacy.dart';
import 'package:share_prompt/services/services/prompt_service.dart'
    as prompt_service;

final postPromptProvider = StateNotifierProvider<PostPromptNotifier, bool>(
  (ref) => PostPromptNotifier(),
);

class PostPromptNotifier extends StateNotifier<bool> {
  PostPromptNotifier() : super(false);

  Future<void> postPrompt({
    required String title,
    required String tag,
    required String description,
    required String prompt,
  }) async {
    if (state) return;

    state = true;

    try {
      await prompt_service.postPrompt(title, description, tag, prompt);
    } finally {
      if (mounted) {
        state = false;
      }
    }
  }
}
