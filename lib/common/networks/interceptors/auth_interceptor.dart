import 'package:dio/dio.dart';
import 'package:share_prompt/services/services/auth_service.dart';
import 'package:share_prompt/common/storage/token_storage.dart';

class AuthInterceptor extends Interceptor {
  final Dio dio;

  AuthInterceptor(this.dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers.remove('Authorization');

    final path = options.uri.path;

    if (path.endsWith('/user/login') || path.endsWith('/user/signup')) {
      handler.next(options);
      return;
    }

    try {
      final token = await TokenStorage.getAccessToken();

      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $token';
      }

      handler.next(options);
    } catch (error) {
      handler.reject(DioException(requestOptions: options, error: error));
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final path = err.requestOptions.path;

    if (path.endsWith('/user/login') ||
        path.endsWith('/user/signup') ||
        path.endsWith('/user/reissue')) {
      handler.next(err);
      return;
    }

    final request = err.requestOptions;
    final retryCount = (request.extra['authRetryCount'] as int?) ?? 0;

    if (err.response?.statusCode != 401 || retryCount >= 1) {
      handler.next(err);
      return;
    }

    try {
      final refreshToken = await TokenStorage.getRefreshToken();

      if (refreshToken == null || refreshToken.isEmpty) {
        handler.next(err);
        return;
      }

      await reissue(refreshToken: refreshToken);

      final accessToken = await TokenStorage.getAccessToken();

      if (accessToken == null || accessToken.isEmpty) {
        handler.next(err);
        return;
      }

      request.extra['authRetryCount'] = retryCount + 1;
      request.headers['Authorization'] = 'Bearer $accessToken';

      final response = await dio.fetch<dynamic>(request);
      handler.resolve(response);
    } catch (_) {
      handler.next(err);
    }
  }
}
