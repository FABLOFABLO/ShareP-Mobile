import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenStorage {
  static const _storage = FlutterSecureStorage();
  static const _key = 'auth_tokens';

  static Future<void> save({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _storage.write(
      key: _key,
      value: jsonEncode({
        'access-token': accessToken,
        'refresh-token': refreshToken,
      }),
    );
  }

  static Future<String?> _readToken(String name) async {
    final value = await _storage.read(key: _key);
    if (value == null) return null;

    final tokens = jsonDecode(value) as Map<String, dynamic>;
    return tokens[name] as String?;
  }

  static Future<String?> getAccessToken() {
    return _readToken('access-token');
  }

  static Future<String?> getRefreshToken() {
    return _readToken('refresh-token');
  }

  static Future<void> clear() async {
    await _storage.delete(key: _key);
  }
}
