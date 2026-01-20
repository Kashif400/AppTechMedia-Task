import 'package:get_it/get_it.dart';
import '../core/utils/local_storage_service.dart';
import '../core/utils/talker_service.dart';
import '../core/constants/app_config.dart';
import '../core/network/dio_client.dart';

// Auth feature imports
import '../features/auth/data/datasources/auth_remote_data_source.dart';
import '../features/auth/data/datasources/auth_local_data_source.dart';
import '../features/auth/data/repositories/auth_repository_impl.dart';
import '../features/auth/domain/repositories/auth_repository.dart';
import '../features/auth/domain/usecases/sign_in.dart';
import '../features/auth/presentation/bloc/auth_bloc.dart';

final GetIt serviceLocator = GetIt.instance;

Future<void> initializeDependencies({String? environment}) async {
  // Initialize Talker Service first for logging
  final talkerService = TalkerService();
  talkerService.initialize();
  serviceLocator.registerLazySingleton<TalkerService>(() => talkerService);

  talkerService.info(
    '🚀 Initializing dependencies',
    data: {'environment': environment ?? 'prod'},
  );

  // Register AppConfig first with environment
  serviceLocator.registerLazySingleton<AppConfig>(
    () => AppConfig.fromString(environment ?? 'prod'),
  );

  // Initialize local storage first
  await LocalStorageService.init();

  // Core services
  serviceLocator.registerLazySingleton<LocalStorageService>(
    () => LocalStorageService(),
  );

  // Dio Client - uses GetIt internally to get dependencies
  serviceLocator.registerLazySingleton<DioClient>(() => DioClient());

  // Data Sources
  serviceLocator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      dioClient: serviceLocator<DioClient>(),
      localStorage: serviceLocator<LocalStorageService>(),
    ),
  );

  serviceLocator.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(
      localStorage: serviceLocator<LocalStorageService>(),
    ),
  );

  // Repositories
  serviceLocator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: serviceLocator<AuthRemoteDataSource>(),
      localDataSource: serviceLocator<AuthLocalDataSource>(),
    ),
  );

  // Use Cases
  serviceLocator.registerLazySingleton<SignIn>(
    () => SignIn(serviceLocator<AuthRepository>()),
  );

  // Blocs
  serviceLocator.registerFactory<AuthBloc>(
    () => AuthBloc(
      signInUseCase: serviceLocator<SignIn>(),
      authRepository: serviceLocator<AuthRepository>(),
    ),
  );
}
