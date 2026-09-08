import 'package:flutter_riverpod/legacy.dart';

final List<String> tagList = [
  '그림',
  '영상',
  '글',
  '음악',
  'PPT',
  '앱',
  '웹사이트',
  '디자인',
  '기타',
];

final tagsProvider = StateNotifierProvider<TagsNotifier, List<String>>(
      (ref) => TagsNotifier(),
);

class TagsNotifier extends StateNotifier<List<String>> {
  TagsNotifier() : super(tagList);
}