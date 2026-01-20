import 'dart:async';
import '../models/user_profile.dart' as local_user;
import '../models/login_response.dart';
import '../../core/utils/app_logger.dart';
import '../../core/utils/local_storage_service.dart';
import '../../core/network/dio_client.dart';
import '../../core/network/request_response.dart';

/// Service for handling authentication-related operations
class AuthenticationService {
  final DioClient _dioClient;
  final LocalStorageService _localStorage;
  final log = getLogger('AuthenticationService');

  // Stream controller for authentication state
  final StreamController<bool> _authStateController =
      StreamController<bool>.broadcast();

  // Stream controller for user profile changes
  final StreamController<local_user.UserProfile?> _userProfileController =
      StreamController<local_user.UserProfile?>.broadcast();

  AuthenticationService({
    required DioClient dioClient,
    required LocalStorageService localStorage,
  }) : _dioClient = dioClient,
       _localStorage = localStorage;

  /// Stream of authentication state changes
  Stream<bool> get authStateStream => _authStateController.stream;

  /// Stream of user profile changes
  Stream<local_user.UserProfile?> get userProfileStream =>
      _userProfileController.stream;

  /// Get current access token
  String? get currentToken => _localStorage.accessToken;

  /// Get current token type (user or guest)
  String get tokenType =>
      _localStorage.accessToken != null ? 'User Token' : 'No Token';

  /// Check current authentication status
  Future<bool> isAuthenticated() async {
    final token = _localStorage.accessToken;
    final expiry = _localStorage.accessTokenExpiry;

    if (token == null || token.isEmpty) {
      log.i('🔍 No access token found');
      return false;
    }

    if (expiry != null && expiry.isNotEmpty) {
      try {
        final expiryDate = DateTime.parse(expiry);
        if (expiryDate.isBefore(DateTime.now())) {
          log.i('🔍 Access token expired');
          return false;
        }
      } catch (e) {
        log.e('❌ Error parsing token expiry: $e');
        return false;
      }
    }

    log.i('✅ User is authenticated');
    return true;
  }

  /// Sign in with email and password
  Future<LoginResponse> signIn({
    required String email,
    required String password,
  }) async {
    try {
      log.i('🔐 Attempting sign in for: $email');

      final response = await _dioClient.post(
        endPoint: '/auth/signin',
        data: {'email': email, 'password': password},
      );

      if (response.success && response.data != null) {
        final loginResponse = LoginResponse.fromJson(response.data!);

        if (loginResponse.success && loginResponse.data != null) {
          log.i('✅ Sign in successful');

          final loginData = loginResponse.data!;

          // Save tokens with expiry dates
          _localStorage.accessToken = loginData.accessToken;
          _localStorage.accessTokenExpiry = loginData.accessTokenExpiry
              .toIso8601String();
          _localStorage.refreshToken = loginData.refreshToken;
          _localStorage.refreshTokenExpiry = loginData.refreshTokenExpiry
              .toIso8601String();

          // Save user profile
          _localStorage.userData = local_user.UserProfile(
            id: loginData.user.id,
            email: loginData.user.email,
            role: loginData.user.role,
            name: loginData.user.name,
            profileImage: loginData.user.profileImage,
            phone: loginData.user.phone,
          );

          // Save additional auth info
          _localStorage.role = loginData.role;

          // Notify listeners
          _authStateController.add(true);
          _userProfileController.add(_localStorage.userData);

          log.i('💾 Tokens and user data saved successfully');
          return loginResponse;
        } else {
          log.e('❌ Sign in failed: ${loginResponse.message}');
          return loginResponse;
        }
      }

      log.e('❌ Sign in failed: Invalid response');
      return LoginResponse(
        success: false,
        statusCode: 500,
        message: 'Sign in failed: Invalid response',
      );
    } catch (e, stackTrace) {
      log.e('❌ Sign in error: $e\n$stackTrace');
      return LoginResponse(
        success: false,
        statusCode: 500,
        message: 'Sign in failed: $e',
      );
    }
  }

  /// Refresh access token using refresh token
  Future<LoginResponse> refreshAccessToken() async {
    try {
      final refreshToken = _localStorage.refreshToken;
      final refreshExpiry = _localStorage.refreshTokenExpiry;

      if (refreshToken == null || refreshToken.isEmpty) {
        log.e('❌ No refresh token available');
        return LoginResponse(
          success: false,
          statusCode: 401,
          message: 'No refresh token available',
        );
      }

      // Check if refresh token is expired
      if (refreshExpiry != null && refreshExpiry.isNotEmpty) {
        try {
          final expiry = DateTime.parse(refreshExpiry);
          if (expiry.isBefore(DateTime.now())) {
            log.e('❌ Refresh token expired');
            await localSignOut();
            return LoginResponse(
              success: false,
              statusCode: 401,
              message: 'Refresh token expired',
            );
          }
        } catch (e) {
          log.e('❌ Error parsing refresh token expiry: $e');
        }
      }

      log.i('🔄 Attempting token refresh');

      final response = await _dioClient.post(
        endPoint: '/auth/refresh-token',
        data: {'refreshToken': refreshToken},
      );

      if (response.success && response.data != null) {
        final loginResponse = LoginResponse.fromJson(response.data!);

        if (loginResponse.success && loginResponse.data != null) {
          log.i('✅ Token refresh successful');

          final loginData = loginResponse.data!;

          // Update tokens
          _localStorage.accessToken = loginData.accessToken;
          _localStorage.accessTokenExpiry = loginData.accessTokenExpiry
              .toIso8601String();
          _localStorage.refreshToken = loginData.refreshToken;
          _localStorage.refreshTokenExpiry = loginData.refreshTokenExpiry
              .toIso8601String();

          // Update user profile if provided
          _localStorage.userData = local_user.UserProfile(
            id: loginData.user.id,
            email: loginData.user.email,
            role: loginData.user.role,
            name: loginData.user.name,
            profileImage: loginData.user.profileImage,
            phone: loginData.user.phone,
          );

          log.i('💾 New tokens saved successfully');
          return loginResponse;
        }
      }

      log.e('❌ Token refresh failed');
      await localSignOut();
      return LoginResponse(
        success: false,
        statusCode: 401,
        message: 'Token refresh failed',
      );
    } catch (e, stackTrace) {
      log.e('❌ Token refresh error: $e\n$stackTrace');
      await localSignOut();
      return LoginResponse(
        success: false,
        statusCode: 500,
        message: 'Token refresh error: $e',
      );
    }
  }

  /// Sign up with user details
  Future<RequestResponse> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    String? phone,
  }) async {
    try {
      final response = await _dioClient.post(
        endPoint: '/auth/register',
        data: {
          'email': email,
          'password': password,
          'firstName': firstName,
          'lastName': lastName,
          if (phone != null) 'phone': phone,
        },
      );

      if (response.success && response.data != null) {
        // Optionally save tokens if auto-login after signup
        final accessToken = response.data['access_token'] as String?;
        final refreshToken = response.data['refresh_token'] as String?;
        final userData = response.data['user'] as Map<String, dynamic>?;

        if (accessToken != null) {
          _localStorage.accessToken = accessToken;
          if (refreshToken != null) {
            _localStorage.refreshToken = refreshToken;
          }
          if (userData != null) {
            final userProfile = UserProfile.fromJson(userData);
            // Convert to local_user.UserProfile if needed by LocalStorageService
            _localStorage.userData = local_user.UserProfile(
              id: userProfile.id,
              email: userProfile.email,
              role: userProfile.role,
              name: userProfile.name,
              profileImage: userProfile.profileImage,
              phone: userProfile.phone,
            );
          }
          _authStateController.add(true);
        }
      }

      return response;
    } catch (e) {
      return RequestResponse.error(message: 'Registration failed: $e');
    }
  }

  /// Sign out
  Future<RequestResponse> signOut() async {
    try {
      // Call logout endpoint
      final response = await _dioClient.post(
        endPoint: '/auth/logout',
        data: {},
      );

      // Clear local storage regardless of API response
      await _clearLocalData();

      // Notify authentication state change
      _authStateController.add(false);

      return response.success
          ? response
          : RequestResponse.success(message: 'Logged out locally');
    } catch (e) {
      // Still clear local data even if API call fails
      await _clearLocalData();
      _authStateController.add(false);
      return RequestResponse.success(message: 'Logged out locally');
    }
  }

  /// Local sign out (clear data without API call)
  Future<void> localSignOut() async {
    await _clearLocalData();
    _authStateController.add(false);
    _userProfileController.add(null);
  }

  /// Refresh access token (legacy method for compatibility)
  Future<RequestResponse> refreshToken() async {
    try {
      final refreshToken = _localStorage.refreshToken;

      if (refreshToken == null) {
        await _clearLocalData();
        _authStateController.add(false);
        return RequestResponse.error(message: 'No refresh token available');
      }

      final response = await _dioClient.post(
        endPoint: '/auth/refresh',
        data: {'refresh_token': refreshToken},
      );

      if (response.success && response.data != null) {
        final newAccessToken = response.data['access_token'] as String?;
        final newRefreshToken = response.data['refresh_token'] as String?;

        if (newAccessToken != null) {
          _localStorage.accessToken = newAccessToken;
        }
        if (newRefreshToken != null) {
          _localStorage.refreshToken = newRefreshToken;
        }

        return response;
      } else {
        // Invalid refresh token, sign out
        await _clearLocalData();
        _authStateController.add(false);
        return RequestResponse.error(message: 'Session expired');
      }
    } catch (e) {
      await _clearLocalData();
      _authStateController.add(false);
      return RequestResponse.error(message: 'Token refresh failed: $e');
    }
  }

  /// Forgot password
  Future<RequestResponse> forgotPassword(String email) async {
    try {
      return await _dioClient.post(
        endPoint: '/auth/forgot-password',
        data: {'email': email},
      );
    } catch (e) {
      return RequestResponse.error(message: 'Forgot password failed: $e');
    }
  }

  /// Reset password
  Future<RequestResponse> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    try {
      return await _dioClient.post(
        endPoint: '/auth/reset-password',
        data: {'token': token, 'password': newPassword},
      );
    } catch (e) {
      return RequestResponse.error(message: 'Password reset failed: $e');
    }
  }

  /// Verify OTP
  Future<RequestResponse> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      return await _dioClient.post(
        endPoint: '/auth/verify-otp',
        data: {'email': email, 'otp': otp},
      );
    } catch (e) {
      return RequestResponse.error(message: 'OTP verification failed: $e');
    }
  }

  /// Get current user data
  Future<Map<String, dynamic>?> getCurrentUser() async {
    return await _localStorage.getUserData();
  }

  /// Get current user profile
  local_user.UserProfile? getCurrentUserProfile() {
    return _localStorage.userData;
  }

  /// Clear local authentication data
  Future<void> _clearLocalData() async {
    await _localStorage.clearTokens();
    await _localStorage.clearUserData();
  }

  /// Initialize authentication state on app start
  Future<void> initializeAuthState() async {
    final isAuth = await isAuthenticated();
    _authStateController.add(isAuth);

    // Load current user if authenticated
    if (isAuth) {
      final currentUser = getCurrentUserProfile();
      _userProfileController.add(currentUser);

      // Verify token validity by making a test request
      final refreshResult = await refreshToken();
      if (!refreshResult.success) {
        await _clearLocalData();
        _authStateController.add(false);
        _userProfileController.add(null);
      }
    }
  }

  /// Dispose resources
  void dispose() {
    _authStateController.close();
    _userProfileController.close();
  }
}
