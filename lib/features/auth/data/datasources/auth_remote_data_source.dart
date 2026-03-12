import 'package:get_it/get_it.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/utils/local_storage_service.dart';
import '../../../../core/utils/talker_service.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> signIn({required String email, required String password});
  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient;
  final LocalStorageService localStorage;
  final _talker = GetIt.instance<TalkerService>();

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
      final data = response.data as Map<String, dynamic>;
      final accessToken = data['accessToken'] as String;
      final refreshToken = data['refreshToken'] as String?;

      // Save tokens to local storage
      localStorage.accessToken = accessToken;
      if (refreshToken != null) localStorage.refreshToken = refreshToken;
      _talker.debug('✅ Tokens saved to storage');

      // Merge user object with token fields so UserModel.fromJson has everything
      final userMap = {
        ...(data['user'] as Map<String, dynamic>),
        'token': accessToken,
        'refreshToken': refreshToken,
      };

      _talker.info('✅ Remote sign in successful');
      return UserModel.fromJson(userMap);
    }

    final errorMsg = response.error ?? response.message ?? 'Sign in failed';
    _talker.error('❌ Sign in failed', message: errorMsg);
    throw Exception(errorMsg);
  }

  @override
  Future<void> signOut() async {
    try {
      _talker.debug('🚪 Remote sign out - clearing local data');
      // Clear local tokens
      await localStorage.clearTokens();
      await localStorage.clearUserData();
      _talker.info('✅ User signed out, tokens cleared');
    } catch (e, stackTrace) {
      _talker.error(
        '❌ Sign out error',
        stackTrace: stackTrace,
        message: e.toString(),
      );
      rethrow;
    }
  }
}
