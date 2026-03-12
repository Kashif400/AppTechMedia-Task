import 'package:clean_code_architecture_app/features/auth/presentation/bloc/login_bloc.dart';
import 'package:get_it/get_it.dart';
import '../utils/local_storage_service.dart';
import '../utils/talker_service.dart';
import '../constants/app_config.dart';
import '../network/dio_client.dart';
import '../network/network_info.dart';
import '../network/network_info_impl.dart';
import '../services/localization_service.dart';
import '../theme/theme_cubit.dart';

// Auth feature imports
import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/auth/data/datasources/auth_local_data_source.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/sign_in.dart';

// Chat feature imports
import '../../features/chat/data/datasources/chat_remote_data_source.dart';
import '../../features/chat/data/repositories/chat_repository_impl.dart';
import '../../features/chat/domain/repositoires/chat_repository.dart';
import '../../features/chat/domain/usecases/fetch_conversations.dart';
import '../../features/chat/domain/usecases/fetch_messages.dart';
import '../../features/chat/domain/usecases/send_message.dart';
import '../../features/chat/presentation/bloc/chat_bloc.dart';

final GetIt locator = GetIt.instance;

Future<void> initializeDependencies({String? environment}) async {
  // Initialize Talker Service first for logging
  final talkerService = TalkerService();
  talkerService.initialize();
  locator.registerLazySingleton<TalkerService>(() => talkerService);

  talkerService.info(
    '🚀 Initializing dependencies',
    data: {'environment': environment ?? 'prod'},
  );

  // Register AppConfig first with environment
  locator.registerLazySingleton<AppConfig>(
    () => AppConfig.fromString(environment ?? 'prod'),
  );

  // Core services - Initialize LocalStorageService
  final localStorageService = LocalStorageService();
  await localStorageService.init(); // Initialize SharedPreferences
  locator.registerLazySingleton<LocalStorageService>(() => localStorageService);

  // Localization Service
  locator.registerLazySingleton<LocalizationService>(
    () => LocalizationService(locator<LocalStorageService>()),
  );

  // Theme Cubit — persists light/dark preference
  locator.registerLazySingleton<ThemeCubit>(
    () => ThemeCubit(locator<LocalStorageService>()),
  );

  // Network info - connectivity checker
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  // Dio Client - uses GetIt internally to get dependencies
  locator.registerLazySingleton<DioClient>(() => DioClient());

  // Data Sources
  locator.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      dioClient: locator<DioClient>(),
      localStorage: locator<LocalStorageService>(),
    ),
  );

  locator.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(localStorage: locator<LocalStorageService>()),
  );

  // Repositories
  locator.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: locator<AuthRemoteDataSource>(),
      localDataSource: locator<AuthLocalDataSource>(),
      networkInfo: locator<NetworkInfo>(),
    ),
  );

  // Use Cases
  locator.registerLazySingleton<SignIn>(
    () => SignIn(locator<AuthRepository>()),
  );

  // Blocs
  locator.registerFactory<LoginBloc>(
    () => LoginBloc(
      signInUseCase: locator<SignIn>(),
      authRepository: locator<AuthRepository>(),
    ),
  );

  // ── Chat feature ───────────────────────────────────────────────────────────

  // Data Sources
  locator.registerLazySingleton<ChatRemoteDataSource>(
    () => ChatRemoteDataSourceImp(dioClient: locator<DioClient>()),
  );

  // Repositories
  locator.registerLazySingleton<ChatRepository>(
    () => ChatRepositoryImpl(
      remoteDataSource: locator<ChatRemoteDataSource>(),
      networkInfo: locator<NetworkInfo>(),
    ),
  );

  // Use Cases
  locator.registerLazySingleton<FetchConversationsUseCase>(
    () => FetchConversationsUseCase(locator<ChatRepository>()),
  );
  locator.registerLazySingleton<FetchMessagesUseCase>(
    () => FetchMessagesUseCase(locator<ChatRepository>()),
  );
  locator.registerLazySingleton<SendMessageUseCase>(
    () => SendMessageUseCase(locator<ChatRepository>()),
  );

  // Bloc
  locator.registerFactory<ChatBloc>(
    () => ChatBloc(
      fetchConversationsUseCase: locator<FetchConversationsUseCase>(),
      fetchMessagesUseCase: locator<FetchMessagesUseCase>(),
      sendMessageUseCase: locator<SendMessageUseCase>(),
    ),
  );
}
