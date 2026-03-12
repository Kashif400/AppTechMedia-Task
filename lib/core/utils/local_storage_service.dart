import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../../data/models/user_profile.dart' as local_user;

class LocalStorageService {
  static SharedPreferences? _preferences;

  ///
  /// List of const keys
  ///
  static const String onboardingCountKey = 'onBoardingCount';
  static const String notificationsCountKey = 'notificationsCount';
  static const String accessTokenKey = 'accessToken';
  static const String refreshTokenKey = 'refreshToken';
  static const String accessTokenExpiryKey = 'accessTokenExpiry';
  static const String refreshTokenExpiryKey = 'refreshTokenExpiry';
  static const String userDataKey = 'userData';
  static const String roleKey = 'role';
  static const String activeAddressIdKey = 'activeAddressId';
  static const String localeKey = 'locale';
  static const String themeModeKey = 'themeMode';
  //getNotificationsStatus
  static const String notificationsStatusKey = 'notificationsStatus';

  ///
  /// Setters and getters
  ///
  ///
  dynamic get getLocale => _getFromDisk(localeKey);
  set setLocale(String locale) => _saveToDisk(localeKey, locale);

  String? get themeMode => _getFromDisk(themeModeKey);
  set themeMode(String? mode) => _saveToDisk(themeModeKey, mode);

  int get onBoardingPageCount => _getFromDisk(onboardingCountKey) ?? 0;
  set onBoardingPageCount(int count) => _saveToDisk(onboardingCountKey, count);

  int get getNotificationsCount => _getFromDisk(notificationsCountKey) ?? 0;

  set setNotificationsCount(int count) =>
      _saveToDisk(notificationsCountKey, count);

  int get activeAddressId => _getFromDisk(activeAddressIdKey) ?? 0;
  set activeAddressId(int id) => _saveToDisk(activeAddressIdKey, id);

  dynamic get accessToken => _getFromDisk(accessTokenKey);
  set accessToken(dynamic token) => _saveToDisk(accessTokenKey, token);

  dynamic get refreshToken => _getFromDisk(refreshTokenKey);
  set refreshToken(dynamic token) => _saveToDisk(refreshTokenKey, token);

  String? get accessTokenExpiry => _getFromDisk(accessTokenExpiryKey);
  set accessTokenExpiry(String? expiry) =>
      _saveToDisk(accessTokenExpiryKey, expiry);

  String? get refreshTokenExpiry => _getFromDisk(refreshTokenExpiryKey);
  set refreshTokenExpiry(String? expiry) =>
      _saveToDisk(refreshTokenExpiryKey, expiry);

  String? get role => _getFromDisk(roleKey);
  set role(String? roleValue) => _saveToDisk(roleKey, roleValue);

  local_user.UserProfile? get userData {
    final jsonString = _getFromDisk(userDataKey);
    if (jsonString == null) return null;
    try {
      return local_user.UserProfile.fromJson(jsonDecode(jsonString));
    } catch (e) {
      return null;
    }
  }

  set userData(local_user.UserProfile? profile) {
    if (profile == null) {
      _saveToDisk(userDataKey, null);
    } else {
      _saveToDisk(userDataKey, jsonEncode(profile.toJson()));
    }
  }

  Future<Map<String, dynamic>?> getUserData() async {
    final jsonString = _getFromDisk(userDataKey);
    if (jsonString == null) return null;
    try {
      return jsonDecode(jsonString);
    } catch (e) {
      return null;
    }
  }

  ///
  /// Generic methods for getting and setting values
  ///
  String? getString(String key) => _getFromDisk(key);
  Future<void> setString(String key, String value) async {
    _saveToDisk(key, value);
  }

  /// Remove a value from storage
  Future<void> remove(String key) async {
    await _preferences?.remove(key);
  }

  /// Clear tokens
  Future<void> clearTokens() async {
    await _preferences?.remove(accessTokenKey);
    await _preferences?.remove(refreshTokenKey);
    await _preferences?.remove(accessTokenExpiryKey);
    await _preferences?.remove(refreshTokenExpiryKey);
  }

  /// Clear user data
  Future<void> clearUserData() async {
    // Remove all user-related data except app settings
    await _preferences?.remove('user');
    await _preferences?.remove('userKey');
    await _preferences?.remove(userDataKey);
    await _preferences?.remove(roleKey);
    await clearTokens();
  }

  ///
  ///initializing instance
  ///
  Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  dynamic _getFromDisk(String key) {
    if (_preferences == null) return null;
    var value = _preferences!.get(key);
    return value;
  }

  void _saveToDisk<T>(String key, T? content) {
    if (_preferences == null) return;

    if (content is String) {
      _preferences!.setString(key, content);
    }
    if (content is bool) {
      _preferences!.setBool(key, content);
    }
    if (content is int) {
      _preferences!.setInt(key, content);
    }
    if (content is double) {
      _preferences!.setDouble(key, content);
    }
    if (content is List<String>) {
      _preferences!.setStringList(key, content);
    }

    if (content == null) {
      _preferences!.remove(key);
    }
  }
}
