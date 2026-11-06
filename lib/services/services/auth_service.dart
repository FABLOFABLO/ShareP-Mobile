import 'package:dio/dio.dart';
import 'package:share_prompt/common/networks/dio_provider.dart';
import 'package:share_prompt/common/router/router.dart';
import 'package:share_prompt/common/storage/token_storage.dart';

Future<void>? _signUpFuture;
Future<void>? _loginFuture;
Future<void>? _reissueFuture;
Future<void>? _logoutFuture;
Future<void>? _changeNickNameFuture;
Future<void>? _changeIdFuture;
Future<void>? _changePasswordFuture;

Future<void> signUp({required String id, required String password}) async {
  if (_signUpFuture != null) {
    return _signUpFuture!;
  }

  _signUpFuture = dio.post<void>(
    '/user/signup',
    data: {'login_id': id, 'password': password},
  );

  return _signUpFuture!.whenComplete(() {
    _signUpFuture = null;
  });
}

Future<void> login({required String id, required String password}) async {
  if (_loginFuture != null) {
    return _loginFuture!;
  }

  _loginFuture = () async {
    final response = await dio.post<Map<String, dynamic>>(
      '/user/login',
      data: {'login_id': id, 'password': password},
    );

    final accessToken = response.data?['access_token'];
    final refreshToken = response.data?['refresh_token'];

    if (accessToken is! String ||
        accessToken.isEmpty ||
        refreshToken is! String ||
        refreshToken.isEmpty) {
      throw const FormatException('로그인 응답에 유효한 토큰이 없습니다.');
    }

    await TokenStorage.save(
      accessToken: response.data?['access_token'],
      refreshToken: response.data?['refresh_token'],
    );
  }();

  return _loginFuture!.whenComplete(() {
    _loginFuture = null;
  });
}
  }

  _reissueFuture = () async {
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
  }();

  return _reissueFuture!.whenComplete(() {
    _reissueFuture = null;
  });
}

Future<void> logout() async {
  if (_logoutFuture != null) {
    return _logoutFuture;
  }
  _logoutFuture = () async {
    await dio.post<void>('/user/logout');
    await TokenStorage.clear();
  }();

  return _logoutFuture!.whenComplete(() {
    _logoutFuture = null;
  });
}
