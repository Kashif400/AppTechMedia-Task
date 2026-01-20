# Clean Code Architecture Flutter App

A production-ready Flutter application implementing Clean Architecture with BLoC pattern, dependency injection, and multi-environment support.

## 📋 Table of Contents
- [Architecture Overview](#-architecture-overview)
- [Getting Started](#-getting-started)
- [Project Structure](#-project-structure)
- [Adding New Features](#-adding-new-features)
- [Network Layer](#-network-layer)
- [Authentication](#-authentication)
- [Environment Configuration](#-environment-configuration)
- [Best Practices](#-best-practices)

## 🏗️ Architecture Overview

This project follows **Clean Architecture** principles with clear separation of concerns across three main layers:

### Layers

1. **Presentation Layer** (`lib/features/*/presentation/`)
   - UI Components (Pages/Widgets)
   - BLoC (Business Logic Components)
   - State Management

2. **Domain Layer** (`lib/features/*/domain/`)
   - Entities (Business Models)
   - Repository Interfaces
   - Use Cases (Business Logic)

3. **Data Layer** (`lib/features/*/data/`)
   - Repository Implementations
   - Data Sources (Remote/Local)
   - Data Models (DTOs)

### Core Principles
- ✅ Dependency Rule: Dependencies point inward (Presentation → Domain ← Data)
- ✅ Single Responsibility Principle
- ✅ Dependency Inversion
- ✅ Interface Segregation

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK: >=3.10.0 <4.0.0
- Dart SDK: >=3.10.0 <4.0.0
- Android Studio / Xcode (for mobile development)

### Installation

1. **Clone the repository**
```bash
git clone <repository-url>
cd clean_code_architecture_app
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run the app with environment flavor**
```bash
# Development
flutter run --flavor dev -t lib/main_dev.dart

# Production
flutter run --flavor prod -t lib/main_prod.dart

# Testing
flutter run --flavor staging -t lib/main_test.dart
```

---

## 📁 Project Structure

```
lib/
├── config/                          # App-wide configuration
│   ├── dependency_injection.dart    # GetIt setup
│   └── router.dart                  # GoRouter configuration
│
├── core/                            # Shared across all features
│   ├── constants/
│   │   ├── app_config.dart         # Environment config
│   │   ├── app_constants.dart      # App constants
│   │   ├── endpoint.dart           # API endpoints
│   │   └── env.dart                # Environment enum
│   ├── errors/
│   │   └── failures.dart           # Error types
│   ├── network/
│   │   ├── dio_client.dart         # HTTP client
│   │   ├── interceptors.dart       # Token & retry interceptors
│   │   ├── request_response.dart   # Response wrapper
│   │   └── network_exceptions.dart # Exception handling
│   ├── usecases/
│   │   └── usecase.dart            # Base UseCase interface
│   └── utils/
│       ├── local_storage_service.dart
│       └── app_logger.dart
│
├── data/
│   ├── datasources/                # Additional data sources
│   └── models/                     # Shared models
│       ├── user_profile.dart
│       └── login_response.dart
│
├── features/                        # Feature modules
│   └── auth/                       # Authentication feature
│       ├── data/
│       │   ├── datasources/
│       │   │   ├── auth_remote_data_source.dart
│       │   │   └── auth_local_data_source.dart
│       │   ├── models/
│       │   │   └── user_model.dart
│       │   └── repositories/
│       │       └── auth_repository_impl.dart
│       ├── domain/
│       │   ├── entities/
│       │   │   └── user.dart
│       │   ├── repositories/
│       │   │   └── auth_repository.dart
│       │   └── usecases/
│       │       └── sign_in.dart
│       └── presentation/
│           ├── bloc/
│           │   ├── auth_bloc.dart
│           │   ├── auth_event.dart
│           │   └── auth_state.dart
│           └── pages/
│               └── login_page.dart
│
├── presentation/                    # Shared UI components
│   └── pages/
│       └── home_page.dart
│
└── main_*.dart                     # Environment entry points
```

---

## ✨ Adding New Features

Follow these steps to add a new feature while maintaining clean architecture:

### Step 1: Create Feature Structure

Create the following directory structure under `lib/features/`:

```bash
lib/features/your_feature/
├── data/
│   ├── datasources/
│   ├── models/
│   └── repositories/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
└── presentation/
    ├── bloc/
    ├── pages/
    └── widgets/
```

### Step 2: Domain Layer (Business Logic)

#### 2.1 Create Entity
```dart
// lib/features/your_feature/domain/entities/your_entity.dart
import 'package:equatable/equatable.dart';

class YourEntity extends Equatable {
  final String id;
  final String name;
  
  const YourEntity({
    required this.id,
    required this.name,
  });
  
  @override
  List<Object?> get props => [id, name];
}
```

#### 2.2 Create Repository Interface
```dart
// lib/features/your_feature/domain/repositories/your_repository.dart
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../entities/your_entity.dart';

abstract class YourRepository {
  Future<Either<Failure, YourEntity>> getItem(String id);
  Future<Either<Failure, List<YourEntity>>> getList();
  Future<Either<Failure, void>> createItem(YourEntity entity);
}
```

#### 2.3 Create Use Case
```dart
// lib/features/your_feature/domain/usecases/get_item.dart
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/your_entity.dart';
import '../repositories/your_repository.dart';

class GetItem implements UseCase<YourEntity, String> {
  final YourRepository repository;
  
  GetItem(this.repository);
  
  @override
  Future<Either<Failure, YourEntity>> call(String id) async {
    return await repository.getItem(id);
  }
}
```

### Step 3: Data Layer (Implementation)

#### 3.1 Create Data Model
```dart
// lib/features/your_feature/data/models/your_model.dart
import '../../domain/entities/your_entity.dart';

class YourModel extends YourEntity {
  const YourModel({
    required super.id,
    required super.name,
  });
  
  factory YourModel.fromJson(Map<String, dynamic> json) {
    return YourModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
```

#### 3.2 Create Remote Data Source
```dart
// lib/features/your_feature/data/datasources/your_remote_data_source.dart
import '../../../../core/network/dio_client.dart';
import '../models/your_model.dart';

abstract class YourRemoteDataSource {
  Future<YourModel> getItem(String id);
  Future<List<YourModel>> getList();
}

class YourRemoteDataSourceImpl implements YourRemoteDataSource {
  final DioClient dioClient;
  
  YourRemoteDataSourceImpl({required this.dioClient});
  
  @override
  Future<YourModel> getItem(String id) async {
    final response = await dioClient.get(
      endPoint: 'your-endpoint/$id',
    );
    
    if (response.success && response.data != null) {
      return YourModel.fromJson(response.data);
    } else {
      throw Exception(response.error ?? 'Failed to fetch item');
    }
  }
  
  @override
  Future<List<YourModel>> getList() async {
    final response = await dioClient.get(
      endPoint: 'your-endpoint',
    );
    
    if (response.success && response.data != null) {
      final List<dynamic> items = response.data;
      return items.map((json) => YourModel.fromJson(json)).toList();
    } else {
      throw Exception(response.error ?? 'Failed to fetch list');
    }
  }
}
```

#### 3.3 Create Repository Implementation
```dart
// lib/features/your_feature/data/repositories/your_repository_impl.dart
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/your_entity.dart';
import '../../domain/repositories/your_repository.dart';
import '../datasources/your_remote_data_source.dart';

class YourRepositoryImpl implements YourRepository {
  final YourRemoteDataSource remoteDataSource;
  
  YourRepositoryImpl({required this.remoteDataSource});
  
  @override
  Future<Either<Failure, YourEntity>> getItem(String id) async {
    try {
      final result = await remoteDataSource.getItem(id);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<YourEntity>>> getList() async {
    try {
      final result = await remoteDataSource.getList();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, void>> createItem(YourEntity entity) async {
    try {
      // Implementation
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
```

### Step 4: Presentation Layer (UI & State Management)

#### 4.1 Create BLoC Events
```dart
// lib/features/your_feature/presentation/bloc/your_event.dart
part of 'your_bloc.dart';

abstract class YourEvent extends Equatable {
  const YourEvent();
  
  @override
  List<Object?> get props => [];
}

class LoadItem extends YourEvent {
  final String id;
  
  const LoadItem(this.id);
  
  @override
  List<Object?> get props => [id];
}

class LoadList extends YourEvent {
  const LoadList();
}
```

#### 4.2 Create BLoC States
```dart
// lib/features/your_feature/presentation/bloc/your_state.dart
part of 'your_bloc.dart';

abstract class YourState extends Equatable {
  const YourState();
  
  @override
  List<Object?> get props => [];
}

class YourInitial extends YourState {
  const YourInitial();
}

class YourLoading extends YourState {
  const YourLoading();
}

class YourLoaded extends YourState {
  final YourEntity item;
  
  const YourLoaded(this.item);
  
  @override
  List<Object?> get props => [item];
}

class YourListLoaded extends YourState {
  final List<YourEntity> items;
  
  const YourListLoaded(this.items);
  
  @override
  List<Object?> get props => [items];
}

class YourError extends YourState {
  final String message;
  
  const YourError(this.message);
  
  @override
  List<Object?> get props => [message];
}
```

#### 4.3 Create BLoC
```dart
// lib/features/your_feature/presentation/bloc/your_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/your_entity.dart';
import '../../domain/usecases/get_item.dart';

part 'your_event.dart';
part 'your_state.dart';

class YourBloc extends Bloc<YourEvent, YourState> {
  final GetItem getItem;
  
  YourBloc({required this.getItem}) : super(const YourInitial()) {
    on<LoadItem>(_onLoadItem);
    on<LoadList>(_onLoadList);
  }
  
  Future<void> _onLoadItem(LoadItem event, Emitter<YourState> emit) async {
    emit(const YourLoading());
    
    final result = await getItem(event.id);
    
    result.fold(
      (failure) => emit(YourError(failure.message)),
      (item) => emit(YourLoaded(item)),
    );
  }
  
  Future<void> _onLoadList(LoadList event, Emitter<YourState> emit) async {
    emit(const YourLoading());
    // Implementation
  }
}
```

#### 4.4 Create Page/Widget
```dart
// lib/features/your_feature/presentation/pages/your_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/your_bloc.dart';

class YourPage extends StatelessWidget {
  const YourPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Feature')),
      body: BlocBuilder<YourBloc, YourState>(
        builder: (context, state) {
          if (state is YourLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          
          if (state is YourError) {
            return Center(child: Text(state.message));
          }
          
          if (state is YourLoaded) {
            return Center(child: Text(state.item.name));
          }
          
          return const Center(child: Text('Initial State'));
        },
      ),
    );
  }
}
```

### Step 5: Dependency Injection

Register your feature dependencies in `lib/config/dependency_injection.dart`:

```dart
// Add to initializeDependencies() function

// Data sources
sl.registerLazySingleton<YourRemoteDataSource>(
  () => YourRemoteDataSourceImpl(dioClient: sl()),
);

// Repositories
sl.registerLazySingleton<YourRepository>(
  () => YourRepositoryImpl(remoteDataSource: sl()),
);

// Use cases
sl.registerLazySingleton(() => GetItem(sl()));

// BLoC
sl.registerFactory(
  () => YourBloc(getItem: sl()),
);
```

### Step 6: Add Route

Add your route in `lib/config/router.dart`:

```dart
class AppRouter {
  static const String yourFeature = '/your-feature';
  
  static final router = GoRouter(
    routes: [
      // Existing routes...
      GoRoute(
        path: yourFeature,
        builder: (context, state) => BlocProvider(
          create: (context) => GetIt.instance<YourBloc>(),
          child: const YourPage(),
        ),
      ),
    ],
  );
}
```

---

## 🌐 Network Layer

### DioClient Usage

The app uses a custom `DioClient` wrapper for all HTTP requests:

```dart
// GET request
final response = await dioClient.get(
  endPoint: 'users/123',
);

// POST request
final response = await dioClient.post(
  endPoint: 'users',
  data: {'name': 'John', 'email': 'john@example.com'},
);

// PUT request
final response = await dioClient.put(
  endPoint: 'users/123',
  data: {'name': 'Jane'},
);

// DELETE request
final response = await dioClient.delete(
  endPoint: 'users/123',
);
```

### Interceptors

The network layer includes automatic:
- **Token Injection**: Automatically adds bearer token to requests
- **Token Refresh**: Automatically refreshes expired tokens on 401 errors
- **Retry Logic**: Retries failed requests (connection errors)
- **Logging**: Logs all requests and responses

---

## 🔐 Authentication

### Sign In Flow

```dart
// Trigger sign in
context.read<AuthBloc>().add(
  SignInRequested(
    email: 'user@example.com',
    password: 'password123',
  ),
);

// Listen to state changes
BlocListener<AuthBloc, AuthState>(
  listener: (context, state) {
    if (state is AuthAuthenticated) {
      // Navigate to home
    } else if (state is AuthError) {
      // Show error
    }
  },
  child: YourWidget(),
);
```

### Token Management

Tokens are automatically:
- Saved to local storage on login
- Added to API requests via interceptor
- Refreshed when expired
- Cleared on logout

---

## 🔧 Environment Configuration

### Supported Environments

- **dev**: Development environment
- **prod**: Production environment
- **staging**: Testing environment

### Environment Files

Configure base URLs in `lib/core/constants/app_config.dart`:

```dart
class AppConfig {
  static const String devBaseUrl = 'https://gateway.ashtra.ai';
  static const String prodBaseUrl = 'https://api.ashtra.ai';
  static const String stagingBaseUrl = 'https://staging.ashtra.ai';
}
```

### Running Different Environments

```bash
# Development
flutter run --flavor dev -t lib/main_dev.dart

# Production
flutter run --flavor prod -t lib/main_prod.dart

# Staging
flutter run --flavor staging -t lib/main_test.dart
```

---

## 📝 Best Practices

### 1. **Always Use Clean Architecture Layers**
   - Keep business logic in domain layer
   - Keep UI logic in presentation layer
   - Keep data fetching in data layer

### 2. **Use BLoC for State Management**
   - One BLoC per feature
   - Events trigger actions
   - States represent UI states
   - Use Equatable for value equality

### 3. **Handle Errors Properly**
   - Use Either<Failure, Success> pattern
   - Create specific failure types
   - Show user-friendly error messages

### 4. **Dependency Injection**
   - Register all dependencies in dependency_injection.dart
   - Use lazy singletons for services
   - Use factories for BLoCs

### 5. **Network Requests**
   - Always use DioClient
   - Handle success and error responses
   - Implement proper error handling

### 6. **Code Organization**
   - Group by feature, not by layer
   - Keep files small and focused
   - Use meaningful names

### 7. **Testing**
   - Write unit tests for use cases
   - Write widget tests for UI
   - Mock dependencies properly

---

## 🛠️ Common Commands

```bash
# Get dependencies
flutter pub get

# Run code generation (if using build_runner)
flutter pub run build_runner build --delete-conflicting-outputs

# Run tests
flutter test

# Analyze code
flutter analyze

# Format code
flutter format lib/

# Clean build
flutter clean

# Build APK
flutter build apk --flavor prod -t lib/main_prod.dart

# Build iOS
flutter build ios --flavor prod -t lib/main_prod.dart
```

---

## 📦 Key Dependencies

- **flutter_bloc**: State management
- **get_it**: Dependency injection
- **dio**: HTTP client
- **dartz**: Functional programming (Either)
- **equatable**: Value equality
- **go_router**: Navigation
- **shared_preferences**: Local storage

---

## 🤝 Contributing

1. Follow the clean architecture structure
2. Write clean, readable code
3. Add comments for complex logic
4. Follow the existing naming conventions
5. Test your code before committing

---

## 📄 License

[Your License Here]

---

## 👨‍💻 Author

[Your Name/Team]

---

## 🆘 Support

For issues and feature requests, please create an issue in the repository.
│   │   └── usecase.dart
│   └── utils/                  # Utility classes
│       └── local_storage_service.dart
├── data/                       # Data layer
│   ├── datasources/            # Remote and local data sources
│   ├── models/                 # Data models with JSON serialization
│   └── repositories/           # Repository implementations
├── domain/                     # Business logic layer
│   ├── entities/               # Core business entities
│   ├── repositories/           # Repository contracts
│   └── usecases/               # Business use cases
├── features/                   # Feature-based organization
│   └── auth/                   # Example auth feature
│       ├── data/
│       ├── domain/
│       └── presentation/
└── presentation/               # UI layer
    ├── bloc/                   # State management with flutter_bloc
    ├── pages/                  # App screens
    └── widgets/                # Reusable UI components
```

## 🌍 Environment Flavors

The project supports three environment flavors:

```dart
enum Env {
  dev,    // Development environment
  prod,   // Production environment
  test,   // Testing environment
}
```

Each environment can have different:
- API base URLs
- App names
- Debug configurations
- Feature flags

## 📦 Packages Used

### State Management
- `flutter_bloc: ^9.1.1` - BLoC pattern for state management
- `equatable: ^2.0.5` - Equality comparison for objects

### Storage & Persistence
- `shared_preferences: ^2.5.3` - Local key-value storage

### Navigation
- `go_router: ^17.0.1` - Declarative routing

### Dependency Injection
- `get_it: ^9.2.0` - Service locator for dependency injection

### Functional Programming
- `dartz: ^0.10.1` - Functional programming utilities (Either, Option, etc.)

### Networking
- `http: ^1.2.0` - Basic HTTP client
- `dio: ^5.6.0` - Advanced HTTP client with interceptors
- `connectivity_plus: ^6.0.0` - Network connectivity detection

### Authentication
- `local_auth: ^2.1.8` - Biometric authentication

### UI & Design
- `flutter_svg: ^2.2.3` - SVG support
- `flutter_screenutil: ^5.9.3` - Screen adaptation utility
- `get: ^4.7.3` - Additional utilities

### Localization
- `flutter_localizations` - Internationalization support
- `intl: any` - Internationalization utilities

### Logging & Debugging
- `talker_logger: ^5.1.12` - Advanced logging
- `talker_dio_logger: ^5.1.12` - Dio HTTP logging
- `talker_bloc_logger: ^5.1.12` - BLoC state logging

### Media & Files
- `device_info_plus: ^10.1.2` - Device information
- `flutter_image_compress: ^2.3.0` - Image compression
- `file_picker: ^8.1.6` - File picking functionality
- `image_picker: ^1.1.2` - Image picking from camera/gallery
- `path: ^1.9.1` - File path utilities

### Firebase & Notifications
- `firebase_messaging: ^15.1.6` - Push notifications
- `flutter_local_notifications: ^18.0.1` - Local notifications
- `rxdart: ^0.28.0` - Reactive extensions

### Payments
- `flutter_stripe: ^11.3.0` - Stripe payment integration

### Code Generation
- `freezed_annotation: ^2.4.4` - Code generation annotations
- `build_runner: ^2.5.4` - Code generation runner
- `json_serializable: ^6.8.0` - JSON serialization
- `freezed: ^2.4.7` - Data classes and unions

## 🚀 Getting Started

### Prerequisites
- Flutter SDK
- Dart SDK

### Installation

1. Clone the repository
2. Install dependencies:
```bash
flutter pub get
```

3. Generate code (if needed):
```bash
flutter packages pub run build_runner build
```

4. Run the app:
```bash
# Development environment
flutter run --flavor dev -t lib/main_dev.dart

# Production environment  
flutter run --flavor prod -t lib/main_prod.dart

# Test environment
flutter run --flavor test -t lib/main_test.dart
```

### Build for different environments:
```bash
# Android APK
flutter build apk --flavor dev -t lib/main_dev.dart
flutter build apk --flavor prod -t lib/main_prod.dart
flutter build apk --flavor test -t lib/main_test.dart

# iOS
flutter build ios --flavor dev -t lib/main_dev.dart
flutter build ios --flavor prod -t lib/main_prod.dart
flutter build ios --flavor test -t lib/main_test.dart
```

## � Authentication Service

The project includes a comprehensive authentication service with the following features:

### Features
- **Token Management**: Automatic access and refresh token handling
- **Session Management**: Persistent authentication state across app restarts
- **Stream-based State**: Real-time authentication status updates
- **Error Handling**: Robust error handling with detailed logging
- **Local Storage**: Secure token and user data storage

### Usage Example
```dart
// Get authentication service
final authService = serviceLocator<AuthenticationService>();

// Sign in
final result = await authService.signIn(
  email: 'user@example.com',
  password: 'password123',
);

if (result.success) {
  // Handle successful login
  final user = result.data?.user;
  print('Welcome ${user?.fullName}');
} else {
  // Handle error
  print('Login failed: ${result.message}');
}

// Listen to authentication state changes
authService.authStateStream.listen((isAuthenticated) {
  if (isAuthenticated) {
    // User is logged in
    Navigator.pushReplacementNamed(context, '/dashboard');
  } else {
    // User is logged out
    Navigator.pushReplacementNamed(context, '/login');
  }
});

// Sign out
await authService.signOut();
```

### Available Methods
- `signIn()` - User authentication
- `signUp()` - User registration  
- `signOut()` - Logout user
- `refreshToken()` - Refresh access token
- `forgotPassword()` - Password recovery
- `resetPassword()` - Reset password with token
- `verifyOtp()` - OTP verification
- `isAuthenticated()` - Check auth status
- `getCurrentUser()` - Get current user data

## �🔧 Configuration

### Environment Setup

Set the environment using dependency injection:

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize dependencies with your desired environment
  await initializeDependencies(environment: Env.dev);    // Development
  await initializeDependencies(environment: Env.prod);   // Production
  await initializeDependencies(environment: Env.test);   // Testing
  
  runApp(const MyApp());
}
```

The `initializeDependencies` function now accepts an optional `environment` parameter that automatically configures the app for the specified environment. This pattern ensures that:

- Environment configuration is centralized
- Dependencies are properly initialized with the correct environment
- All services receive the appropriate configuration

### Adding New Features

1. Create feature directory in `lib/features/`
2. Implement the three layers:
   - **Domain**: Entities, repository contracts, use cases
   - **Data**: Models, data sources, repository implementations
   - **Presentation**: BLoC, pages, widgets

3. Register dependencies in `dependency_injection.dart`
4. Add routes in `router.dart`

### Adding New Dependencies

1. Add to `pubspec.yaml`
2. Run `flutter pub get`
3. Register in service locator if needed

## 🧪 Testing

This project structure supports:
- Unit tests for business logic (domain layer)
- Widget tests for UI components
- Integration tests for full features

## 📱 Assets

The project is configured to support:
- Icons: `assets/icons/`
- Images: `assets/static_images/`
- Animations: `assets/animations/`
- Fonts: `assets/fonts/` (Poppins, Inter, Source Sans Pro, Roboto)
- Configuration files: `assets/config/`

## 🎨 Theming

The app supports:
- Material Design 3
- Custom font families
- Color scheme configuration
- Responsive design with ScreenUtil

## 📄 License

This project is licensed under the MIT License.

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch
3. Follow the clean architecture principles
4. Write tests for new features
5. Submit a pull request

## 📞 Support

For questions or support, please contact the development team.
