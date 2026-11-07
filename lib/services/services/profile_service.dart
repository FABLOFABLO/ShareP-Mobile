import 'package:share_prompt/services/models/my_profile_model.dart';
import 'package:share_prompt/common/networks/dio_provider.dart';

Future<MyProfileModel> getMyProfile() async {
  final response = await dio.get<Map<String, dynamic>>('/user/mypage');

  final data = response.data;

  if (data == null) {
    throw const FormatException('마이페이지가 비어있습니다.');
  }

  return MyProfileModel.fromJson(data);
}
