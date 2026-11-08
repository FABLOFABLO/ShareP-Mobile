import 'package:share_prompt/common/networks/dio_provider.dart';
import 'package:share_prompt/services/models/post_prompt_model.dart';
import '../models/prompt_list_model.dart';

Future<PromptListModel> getPromptList(String sort) async {
  final response = await dio.get<List<dynamic>>('/prompt?sort_by=$sort');

  final data = response.data;
  if (data == null) {
    throw const FormatException('게시글 목록을 불러오지 못했습니다.');
  }

  return PromptListModel.fromJson(data);
}

Future<void> postPrompt(
  String title,
  String description,
  String tag,
  String prompt,
) async {
  final request = PostPromptModel(
    tag: tag,
    title: title,
    description: description,
    prompt: prompt,
  );
  await dio.post('/prompt', data: request.toJson());
}
