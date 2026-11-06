import 'package:dio/dio.dart';
import 'package:share_prompt/common/networks/dio_provider.dart';
import 'package:share_prompt/common/router/router.dart';
import 'package:share_prompt/common/storage/token_storage.dart';

Future<void> signUp({required String id, required String password}) async {
  await dio.post<void>(
    '/user/signup',
    data: {'loginId': id, 'password': password},
  );
}

Future<void> login({required String id, required String password}) async {
  final response = await dio.post<Map<String, dynamic>>(
    '/user/login',
    data: {'loginId': id, 'password': password},
  );

  await TokenStorage.save(
    accessToken: response.data?['accessToken'],
    refreshToken: response.data?['refreshToken'],
  );
}

Future<void> reissue({required String refreshToken}) async {
  try {
    final response = await refreshDio.post<Map<String, dynamic>>(
      '/user/reissue',
      data: {'refresh_token': refreshToken},
    );

    final accessToken = response.data?['access_token'];
    final newRefreshToken = response.data?['refresh_token'];

    if (accessToken is! String ||
        accessToken.isEmpty ||
        newRefreshToken is! String ||
        newRefreshToken.isEmpty) {
      throw const FormatException('재발급 응답에 유효한 토큰이 없습니다.');
    }

    await TokenStorage.save(
      accessToken: accessToken,
      refreshToken: newRefreshToken,
    );
  } on DioException catch (e) {
    if (e.response?.statusCode == 401) {
      await TokenStorage.clear();
      router.go('/login');
    }
    rethrow;
  }
}

Future<void> logout() async {
  await dio.post<void>('/user/logout');
  await TokenStorage.clear();
}