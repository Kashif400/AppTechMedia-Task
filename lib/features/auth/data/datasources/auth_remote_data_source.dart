import '../../../../core/network/dio_client.dart';
import '../../../../core/utils/local_storage_service.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signIn({required String email, required String password});
  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient;
  final LocalStorageService localStorage;

  AuthRemoteDataSourceImpl({
    required this.dioClient,
    required this.localStorage,
  });

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    final response = await dioClient.post(
      endPoint: 'auth/signin',
      data: {'email': email, 'password': password},
    );

    if (response.success) {
      // Handle different response structures
      Map<String, dynamic> userData = {};
      String? accessToken;
      String? refreshToken;

      final data = response.data;
      if (data is Map<String, dynamic>) {
        // Check for nested user object
        if (data.containsKey('user')) {
          userData = data['user'] as Map<String, dynamic>;
        } else {
          userData = data;
        }

        // Extract tokens
        accessToken =
            data['accessToken'] ??
            data['access_token'] ??
            data['token'] ??
            userData['accessToken'] ??
            userData['token'];
        refreshToken =
            data['refreshToken'] ??
            data['refresh_token'] ??
            userData['refreshToken'];

        // Add token to userData for UserModel
        if (accessToken != null) {
          userData['token'] = accessToken;
        }

        // Save tokens to local storage
        if (accessToken != null) {
          localStorage.accessToken = accessToken;
          print('✅ Access token saved');
        }
        if (refreshToken != null) {
          localStorage.refreshToken = refreshToken;
          print('✅ Refresh token saved');
        }

        return UserModel.fromJson(userData);
      }

      throw Exception('Invalid response format');
    } else {
      throw Exception(response.error ?? response.message ?? 'Sign in failed');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      // Clear local tokens
      await localStorage.clearTokens();
      await localStorage.clearUserData();
      print('✅ User signed out, tokens cleared');
    } catch (e) {
      print('❌ Sign out error: $e');
    }
  }
}
