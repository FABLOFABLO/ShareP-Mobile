import 'package:share_prompt/common/networks/dio_provider.dart';
import '../models/prompt_list_model.dart';

Future<PromptListModel> getPromptList(String sort) async {
  final response = await dio.get<List<dynamic>>('/prompt?sort_by=$sort');

  final data = response.data;

  if (data == null) {
    throw const FormatException('게시글 목록을 불러오지 못했습니다.');
  }

  return PromptListModel.fromJson(data);
}
