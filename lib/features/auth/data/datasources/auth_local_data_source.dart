import 'dart:convert';
import '../../../../core/utils/local_storage_service.dart';
import '../models/user_model.dart';

abstract class AuthLocalDataSource {
  Future<UserModel?> getCachedUser();
  Future<void> cacheUser(UserModel user);
  Future<void> clearCache();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final LocalStorageService localStorage;
  static const String userKey = 'cached_user';
  static const String tokenKey = 'auth_token';

  AuthLocalDataSourceImpl({required this.localStorage});

  @override
  Future<UserModel?> getCachedUser() async {
    try {
      final userJson = localStorage.getString(userKey);
      if (userJson != null) {
        return UserModel.fromJson(jsonDecode(userJson));
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> cacheUser(UserModel user) async {
    await localStorage.setString(userKey, jsonEncode(user.toJson()));
    if (user.token != null) {
      await localStorage.setString(tokenKey, user.token!);
    }
  }

  @override
  Future<void> clearCache() async {
    await localStorage.remove(userKey);
    await localStorage.remove(tokenKey);
  }
}
