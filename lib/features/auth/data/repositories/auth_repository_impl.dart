import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/talker_service.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final _talker = GetIt.instance<TalkerService>();

  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, User>> signIn({
    required String email,
    required String password,
  }) async {
    try {
      _talker.info('🔐 Attempting sign in', data: {'email': email});

      final userModel = await remoteDataSource.signIn(
        email: email,
        password: password,
      );

      // Cache the user
      await localDataSource.cacheUser(userModel);

      _talker.info('✅ Sign in successful', data: {'userId': userModel.id});
      return Right(userModel.toEntity());
    } catch (e, stackTrace) {
      _talker.error(
        '❌ Sign in failed',
        stackTrace: stackTrace,
        message: e.toString(),
      );
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    try {
      _talker.info('🚪 Attempting sign out');
      await remoteDataSource.signOut();
      await localDataSource.clearCache();
      _talker.info('✅ Sign out successful');
      return const Right(null);
    } catch (e, stackTrace) {
      _talker.error(
        '❌ Sign out failed',
        stackTrace: stackTrace,
        message: e.toString(),
      );
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<User?> getCurrentUser() async {
    try {
      _talker.debug('📱 Getting current user from cache');
      final userModel = await localDataSource.getCachedUser();
      if (userModel != null) {
        _talker.debug('✅ User found in cache', data: {'userId': userModel.id});
      } else {
        _talker.debug('ℹ️ No user found in cache');
      }
      return userModel?.toEntity();
    } catch (e, stackTrace) {
      _talker.warning('⚠️ Error getting current user', data: e.toString());
      return null;
    }
  }

  @override
  Future<void> saveUser(User user) async {
    _talker.debug('💾 Saving user to cache', data: {'userId': user.id});
    final userModel = UserModel(
      id: user.id,
      email: user.email,
      name: user.name,
      profileImage: user.profileImage,
      token: user.token,
      createdAt: user.createdAt,
      updatedAt: user.updatedAt,
    );
    await localDataSource.cacheUser(userModel);
    _talker.debug('✅ User saved to cache');
  }
}
