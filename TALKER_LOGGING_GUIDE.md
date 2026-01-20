# 📋 Talker Logging Integration Guide

## Overview

This project uses **Talker** - a comprehensive logging framework that provides:
- 🎨 **Advanced logging** with colors and formatting
- 🌐 **HTTP request/response logging** via Dio interceptor
- 🎯 **BLoC state/event logging** for state management
- 📊 **Centralized log management** with history tracking
- 🔍 **In-app log viewer** for debugging

## 📦 Dependencies

```yaml
dependencies:
  talker_flutter: ^5.1.12      # Core Talker with Flutter UI
  talker_logger: ^5.1.12       # Advanced logging capabilities
  talker_dio_logger: ^5.1.12   # Dio HTTP logging interceptor
  talker_bloc_logger: ^5.1.12  # BLoC state/event logging
```

## 🚀 Quick Start

### 1. Initialization (Already Done)

The Talker service is initialized in `main_*.dart` files:

```dart
// Initialize dependencies (includes TalkerService)
await initializeDependencies(environment: 'dev');

// Setup BLoC observer for automatic state logging
final talkerService = serviceLocator<TalkerService>();
Bloc.observer = TalkerBlocObserverService(talkerService);

talkerService.info('🎯 Starting app in DEV mode');
```

### 2. Basic Usage

#### Import TalkerService

```dart
import 'package:get_it/get_it.dart';
import '../../core/utils/talker_service.dart';

class YourClass {
  final _talker = GetIt.instance<TalkerService>();
  
  void yourMethod() {
    _talker.info('Method called');
  }
}
```

## 📝 Logging Methods

### General Logging

```dart
// General log message
_talker.log('Something happened');

// Debug information (only in debug mode)
_talker.debug('Debug info', data: {'userId': 123});

// Informational message
_talker.info('✅ User logged in successfully', data: {'email': 'user@example.com'});

// Warning message
_talker.warning('⚠️ Slow network detected');

// Error with optional stack trace
_talker.error(
  exception,
  stackTrace: stackTrace,
  message: '❌ Failed to load data',
);

// Critical error
_talker.critical(
  exception,
  stackTrace: stackTrace,
  message: '🚨 Critical system failure',
);

// Verbose logging (development only)
_talker.verbose('Detailed debug information', data: variables);
```

### With Additional Data

```dart
_talker.info('User action', data: {
  'action': 'button_click',
  'screen': 'home',
  'timestamp': DateTime.now().toIso8601String(),
});
```

## 🌐 HTTP Logging (Automatic)

HTTP logging is **automatically configured** in `DioClient`:

```dart
dio.interceptors.add(
  TalkerDioLogger(
    talker: _talkerService.talker,
    settings: const TalkerDioLoggerSettings(
      printRequestHeaders: true,
      printResponseHeaders: true,
      printRequestData: true,
      printResponseData: true,
      printResponseMessage: true,
      printErrorData: true,
      printErrorHeaders: true,
      printErrorMessage: true,
    ),
  ),
);
```

**All HTTP requests automatically log:**
- ✅ Request URL, method, headers, body
- ✅ Response status, headers, body
- ✅ Errors and exceptions
- ✅ Request/response timing

## 🎯 BLoC Logging (Automatic)

BLoC logging is **automatically configured** via `TalkerBlocObserverService`:

```dart
Bloc.observer = TalkerBlocObserverService(talkerService);
```

**Automatically logs:**
- ✅ Bloc creation and closing
- ✅ Events dispatched
- ✅ State transitions
- ✅ State changes
- ✅ Errors in BLoCs

## 🏗️ Architecture Integration

### Repository Layer

Add logging in repositories to track data flow:

```dart
class AuthRepositoryImpl implements AuthRepository {
  final _talker = GetIt.instance<TalkerService>();

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

      await localDataSource.cacheUser(userModel);

      _talker.info('✅ Sign in successful', data: {'userId': userModel.id});
      return Right(userModel.toEntity());
    } catch (e, stackTrace) {
      _talker.error('❌ Sign in failed', stackTrace: stackTrace, message: e.toString());
      return Left(ServerFailure(e.toString()));
    }
  }
}
```

### Data Source Layer

Add logging in data sources for API calls:

```dart
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final _talker = GetIt.instance<TalkerService>();

  @override
  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    _talker.debug('🌐 Remote sign in API call', data: {'email': email});
    
    final response = await dioClient.post(
      endPoint: 'auth/signin',
      data: {'email': email, 'password': password},
    );

    if (response.success) {
      _talker.info('✅ Remote sign in successful');
      return UserModel.fromJson(response.data);
    } else {
      final errorMsg = response.error ?? 'Sign in failed';
      _talker.error('❌ Sign in failed', message: errorMsg);
      throw Exception(errorMsg);
    }
  }
}
```

### Use Case Layer

Add logging in use cases for business logic tracking:

```dart
class SignIn implements UseCase<User, SignInParams> {
  final AuthRepository repository;
  final _talker = GetIt.instance<TalkerService>();

  SignIn(this.repository);

  @override
  Future<Either<Failure, User>> call(SignInParams params) async {
    _talker.info('🎯 UseCase: SignIn started', data: {
      'email': params.email,
    });
    
    final result = await repository.signIn(
      email: params.email,
      password: params.password,
    );
    
    result.fold(
      (failure) => _talker.warning('⚠️ UseCase: SignIn failed', data: failure.message),
      (user) => _talker.info('✅ UseCase: SignIn successful', data: {'userId': user.id}),
    );
    
    return result;
  }
}
```

### Presentation Layer (UI)

Add logging for user interactions:

```dart
class LoginPage extends StatelessWidget {
  final _talker = GetIt.instance<TalkerService>();

  void _handleLogin(BuildContext context) {
    _talker.debug('🖱️ UI: Login button pressed');
    
    context.read<AuthBloc>().add(
      SignInRequested(email: emailController.text, password: passwordController.text),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          _talker.warning('⚠️ UI: Login error displayed to user', data: state.message);
        } else if (state is AuthAuthenticated) {
          _talker.info('✅ UI: User authenticated, navigating to home');
        }
      },
      child: // ... your UI
    );
  }
}
```

## 🎨 Best Practices

### 1. Use Appropriate Log Levels

```dart
// Debug - Development info
_talker.debug('Variable value', data: myVar);

// Info - Important events
_talker.info('✅ Operation completed');

// Warning - Recoverable issues
_talker.warning('⚠️ Slow response time');

// Error - Failures that need attention
_talker.error(exception, message: '❌ Failed to process');

// Critical - Severe failures
_talker.critical(exception, message: '🚨 System crash');
```

### 2. Use Emoji for Visual Clarity

```dart
_talker.info('🔐 Authentication started');
_talker.info('✅ Successfully saved');
_talker.warning('⚠️ Network unstable');
_talker.error('❌ Operation failed');
_talker.info('🌐 HTTP request');
_talker.info('📱 Cache operation');
_talker.info('🎯 UseCase executed');
_talker.info('🖱️ User interaction');
```

### 3. Include Contextual Data

```dart
// Good ✅
_talker.info('User logged in', data: {
  'userId': user.id,
  'email': user.email,
  'timestamp': DateTime.now().toIso8601String(),
});

// Bad ❌
_talker.info('User logged in');
```

### 4. Log at Key Points

- ✅ Start of important operations
- ✅ Successful completions
- ✅ Error conditions
- ✅ State transitions
- ✅ External API calls
- ✅ Cache operations
- ✅ User interactions

### 5. Don't Over-Log

```dart
// Good ✅
_talker.info('Processing batch of 100 items');

// Bad ❌
for (int i = 0; i < 100; i++) {
  _talker.debug('Processing item $i'); // Too noisy!
}
```

## 🔍 Viewing Logs

### In Development

Logs automatically appear in your IDE console with colors and formatting.

### In-App Log Viewer

You can add a route to view logs in-app:

```dart
import 'package:talker_flutter/talker_flutter.dart';
import 'package:get_it/get_it.dart';

// Add to your router
GoRoute(
  path: '/logs',
  builder: (context, state) {
    final talker = GetIt.instance<TalkerService>().talker;
    return TalkerScreen(talker: talker);
  },
),
```

### Filtering Logs

Access log history programmatically:

```dart
final talkerService = GetIt.instance<TalkerService>();

// Get all logs
final allLogs = talkerService.history;

// Clear logs
talkerService.clearHistory();

// Access raw Talker instance for advanced features
final talker = talkerService.talker;
```

## 🔧 Configuration

### Customize TalkerService

Edit `lib/core/utils/talker_service.dart`:

```dart
void initialize({
  TalkerLogger? logger,
  TalkerObserver? observer,
  TalkerSettings? settings,
}) {
  _talker = Talker(
    logger: logger ?? TalkerLogger(
      settings: TalkerLoggerSettings(
        enableColors: true,
        lineSymbol: '─',
        maxLineWidth: 110,
      ),
    ),
    settings: settings ?? TalkerSettings(
      enabled: true,
      useConsoleLogs: kDebugMode,  // Only in debug mode
      useHistory: true,
      maxHistoryItems: 1000,
    ),
  );
}
```

### Disable Logging in Production

Logging is automatically disabled in production by checking `kDebugMode` in settings.

## 📊 Example: Complete Feature Logging

```dart
// Domain Layer - Use Case
class GetUserProfile implements UseCase<User, String> {
  final UserRepository repository;
  final _talker = GetIt.instance<TalkerService>();

  @override
  Future<Either<Failure, User>> call(String userId) async {
    _talker.info('🎯 UseCase: GetUserProfile', data: {'userId': userId});
    return await repository.getUserProfile(userId);
  }
}

// Data Layer - Repository
class UserRepositoryImpl implements UserRepository {
  final _talker = GetIt.instance<TalkerService>();

  @override
  Future<Either<Failure, User>> getUserProfile(String userId) async {
    try {
      _talker.debug('📱 Repository: Fetching user profile', data: {'userId': userId});
      
      // Check cache first
      final cachedUser = await localDataSource.getCachedUser(userId);
      if (cachedUser != null) {
        _talker.info('✅ Repository: User found in cache');
        return Right(cachedUser);
      }

      // Fetch from remote
      _talker.debug('🌐 Repository: Fetching from remote');
      final remoteUser = await remoteDataSource.getUserProfile(userId);
      
      // Cache the result
      await localDataSource.cacheUser(remoteUser);
      
      _talker.info('✅ Repository: User profile fetched successfully');
      return Right(remoteUser);
    } catch (e, stackTrace) {
      _talker.error(e, stackTrace: stackTrace, message: '❌ Repository: Failed to fetch user profile');
      return Left(ServerFailure(e.toString()));
    }
  }
}

// Presentation Layer - BLoC
class UserBloc extends Bloc<UserEvent, UserState> {
  final GetUserProfile getUserProfile;

  UserBloc({required this.getUserProfile}) : super(UserInitial()) {
    on<LoadUserProfile>(_onLoadUserProfile);
  }

  // BLoC events/states are automatically logged by TalkerBlocObserver
  Future<void> _onLoadUserProfile(
    LoadUserProfile event,
    Emitter<UserState> emit,
  ) async {
    emit(UserLoading());
    
    final result = await getUserProfile(event.userId);
    
    result.fold(
      (failure) => emit(UserError(failure.message)),
      (user) => emit(UserLoaded(user)),
    );
  }
}

// UI Layer
class ProfilePage extends StatelessWidget {
  final _talker = GetIt.instance<TalkerService>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserLoading) {
          _talker.debug('🖥️ UI: Showing loading indicator');
          return CircularProgressIndicator();
        }
        
        if (state is UserError) {
          _talker.warning('⚠️ UI: Showing error to user', data: state.message);
          return ErrorWidget(state.message);
        }
        
        if (state is UserLoaded) {
          _talker.debug('✅ UI: Displaying user profile');
          return UserProfileWidget(state.user);
        }
        
        return Container();
      },
    );
  }
}
```

## 🎯 Summary

Your project now has comprehensive logging at all layers:

1. ✅ **HTTP Logging** - Automatic via `TalkerDioLogger` in `DioClient`
2. ✅ **BLoC Logging** - Automatic via `TalkerBlocObserver` in main files
3. ✅ **Repository Logging** - Manual logging added for data flow tracking
4. ✅ **Data Source Logging** - Manual logging added for API calls
5. ✅ **Centralized Service** - `TalkerService` available via GetIt anywhere

### Next Steps

- Add logging to remaining features following the examples
- View logs during development using IDE console
- Consider adding in-app log viewer for testing
- Use logs to debug issues and track user flows
- Review logs regularly to identify performance bottlenecks

## 📚 Additional Resources

- [Talker Documentation](https://pub.dev/packages/talker)
- [Talker Flutter](https://pub.dev/packages/talker_flutter)
- [Talker Dio Logger](https://pub.dev/packages/talker_dio_logger)
- [Talker BLoC Logger](https://pub.dev/packages/talker_bloc_logger)
