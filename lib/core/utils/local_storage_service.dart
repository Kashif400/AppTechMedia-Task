import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../data/models/user_profile.dart';
import '../constants/app_config.dart';

class LocalStorageService {
  static SharedPreferences? _preferences;

  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static SharedPreferences get preferences {
    if (_preferences == null) {
      throw Exception('LocalStorageService not initialized');
    }
    return _preferences!;
  }

  // Authentication token management
  String? get accessToken => getString(AppConfig.accessTokenKey);
  set accessToken(String? value) => value != null
      ? setString(AppConfig.accessTokenKey, value)
      : remove(AppConfig.accessTokenKey);

  String? get refreshToken => getString(AppConfig.refreshTokenKey);
  set refreshToken(String? value) => value != null
      ? setString(AppConfig.refreshTokenKey, value)
      : remove(AppConfig.refreshTokenKey);

  String? get accessTokenExpiry =>
      getString('${AppConfig.accessTokenKey}_expiry');
  set accessTokenExpiry(String? value) => value != null
      ? setString('${AppConfig.accessTokenKey}_expiry', value)
      : remove('${AppConfig.accessTokenKey}_expiry');

  String? get refreshTokenExpiry =>
      getString('${AppConfig.refreshTokenKey}_expiry');
  set refreshTokenExpiry(String? value) => value != null
      ? setString('${AppConfig.refreshTokenKey}_expiry', value)
      : remove('${AppConfig.refreshTokenKey}_expiry');

  String? get role => getString('user_role');
  set role(String? value) =>
      value != null ? setString('user_role', value) : remove('user_role');

  // User data management
  UserProfile? get userData {
    final userDataString = getString(AppConfig.userDataKey);
    if (userDataString != null) {
      try {
        final Map<String, dynamic> userMap = json.decode(userDataString);
        return UserProfile.fromJson(userMap);
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  set userData(UserProfile? user) {
    if (user != null) {
      setString(AppConfig.userDataKey, json.encode(user.toJson()));
    } else {
      remove(AppConfig.userDataKey);
    }
  }

  // Legacy methods for compatibility
  Future<String?> getAccessToken() async => accessToken;
  Future<String?> getRefreshToken() async => refreshToken;
  Future<Map<String, dynamic>?> getUserData() async {
    final user = userData;
    return user?.toJson();
  }

  Future<void> saveAccessToken(String token) async {
    accessToken = token;
  }

  Future<void> saveRefreshToken(String token) async {
    refreshToken = token;
  }

  Future<void> saveUserData(Map<String, dynamic> data) async {
    try {
      userData = UserProfile.fromJson(data);
    } catch (e) {
      // Fallback to storing as JSON string
      setString(AppConfig.userDataKey, json.encode(data));
    }
  }

  Future<void> clearTokens() async {
    accessToken = null;
    refreshToken = null;
    accessTokenExpiry = null;
    refreshTokenExpiry = null;
  }

  Future<void> clearUserData() async {
    userData = null;
    role = null;
  }

  // String operations
  Future<bool> setString(String key, String value) async {
    return await preferences.setString(key, value);
  }

  String? getString(String key) {
    return preferences.getString(key);
  }

  // Int operations
  Future<bool> setInt(String key, int value) async {
    return await preferences.setInt(key, value);
  }

  int? getInt(String key) {
    return preferences.getInt(key);
  }

  // Bool operations
  Future<bool> setBool(String key, bool value) async {
    return await preferences.setBool(key, value);
  }

  bool? getBool(String key) {
    return preferences.getBool(key);
  }

  // Double operations
  Future<bool> setDouble(String key, double value) async {
    return await preferences.setDouble(key, value);
  }

  double? getDouble(String key) {
    return preferences.getDouble(key);
  }

  // Remove operations
  Future<bool> remove(String key) async {
    return await preferences.remove(key);
  }

  // Clear all
  Future<bool> clear() async {
    return await preferences.clear();
  }

  // Check if key exists
  bool containsKey(String key) {
    return preferences.containsKey(key);
  }
}
