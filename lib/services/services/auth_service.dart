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

void checkToken({required String? accessToken, required String? refreshToken}) {
  if (accessToken is! String ||
      accessToken.isEmpty ||
      refreshToken is! String ||
      refreshToken.isEmpty) {
    throw const FormatException('재발급 응답에 유효한 토큰이 없습니다.');
  }
}

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

    checkToken(accessToken: accessToken, refreshToken: refreshToken);

    await TokenStorage.save(
      accessToken: response.data?['access_token'],
      refreshToken: response.data?['refresh_token'],
    );
  }();

  return _loginFuture!.whenComplete(() {
    _loginFuture = null;
  });
}

Future<void> reissue({required String refreshToken}) async {
  if (_reissueFuture != null) {
    return _reissueFuture;
  }

  _reissueFuture = () async {
    try {
      final response = await refreshDio.post<Map<String, dynamic>>(
        '/user/reissue',
        data: {'refresh_token': refreshToken},
      );

      final accessToken = response.data?['access_token'];
      final newRefreshToken = response.data?['refresh_token'];

      checkToken(accessToken: accessToken, refreshToken: newRefreshToken);

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
    try {
      await dio.post<void>('/user/logout');
    } finally {
      await TokenStorage.clear();
    }
  }();

  return _logoutFuture!.whenComplete(() {
    _logoutFuture = null;
  });
}

Future<void> changeNickName({required String nickName}) async {
  if (_changeNickNameFuture != null) {
    return _changeNickNameFuture;
  }

  _changeNickNameFuture = () async {
    await dio.patch<void>('/user/nickname', data: {'nickname': nickName});
  }();

  return _changeNickNameFuture!.whenComplete(() {
    _changeNickNameFuture = null;
  });
}

Future<void> changeId({required String newId, required String password}) async {
  if (_changeIdFuture != null) {
    return _changeIdFuture;
  }

  _changeIdFuture = () async {
    final response = await dio.patch<Map<String, dynamic>>(
      '/user/id',
      data: {'password': password, 'new_id': newId},
    );

    final accessToken = response.data?['access_token'];
    final newRefreshToken = response.data?['refresh_token'];

    checkToken(accessToken: accessToken, refreshToken: newRefreshToken);

    await TokenStorage.save(
      accessToken: accessToken,
      refreshToken: newRefreshToken,
    );
  }();

  return _changeIdFuture!.whenComplete(() {
    _changeIdFuture = null;
  });
}

Future<void> changePassword({
  required String currentPassword,
  required String newPassword,
}) async {
  if (_changePasswordFuture != null) {
    return _changePasswordFuture;
  }

  _changePasswordFuture = () async {
    final response = await dio.patch<Map<String, dynamic>>(
      '/user/password',
      data: {'current_password': currentPassword, 'new_password': newPassword},
    );

    final accessToken = response.data?['access_token'];
    final newRefreshToken = response.data?['refresh_token'];

    checkToken(accessToken: accessToken, refreshToken: newRefreshToken);

    await TokenStorage.save(
      accessToken: accessToken,
      refreshToken: newRefreshToken,
    );
  }();

  return _changePasswordFuture!.whenComplete(() {
    _changePasswordFuture = null;
  });
}
