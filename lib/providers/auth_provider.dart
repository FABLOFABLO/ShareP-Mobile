import 'package:flutter_riverpod/legacy.dart';
import 'package:share_prompt/services/services/auth_service.dart'
    as auth_service;

final authProvider = StateNotifierProvider<AuthNotifier, bool>(
  (ref) => AuthNotifier(),
);

class AuthNotifier extends StateNotifier<bool> {
  AuthNotifier() : super(false);

  Future<void> login({required String id, required String password}) async {
    if (state) return;

    state = true;

    try {
      await auth_service.login(id: id, password: password);
    } finally {
      if (mounted) {
        state = false;
      }
    }
  }

  Future<void> signUp({required String id, required String password}) async {
    if (state) return;

    state = true;

    try {
      await auth_service.signUp(id: id, password: password);
    } finally {
      if (mounted) {
        state = false;
      }
    }
  }

  Future<void> logout() async {
    if (state) return;

    state = true;

    try {
      await auth_service.logout();
    } finally {
      if (mounted) {
        state = false;
      }
    }
  }

  Future<void> changeNickName({required String nickName}) async {
    if (state) return;

    state = true;

    try {
      await auth_service.changeNickName(nickName: nickName);
    } finally {
      if (mounted) {
        state = false;
      }
    }
  }

  Future<void> changeId({
    required String password,
    required String newId,
  }) async {
    if (state) return;

    state = true;

    try {
      await auth_service.changeId(newId: newId, password: password);
    } finally {
      if (mounted) {
        state = false;
      }
    }
  }

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    if (state) return;

    state = true;

    try {
      await auth_service.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );
    } finally {
      if (mounted) {
        state = false;
      }
    }
  }
}
