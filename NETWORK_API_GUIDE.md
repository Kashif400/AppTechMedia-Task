# Network & API Service Documentation

This document explains how to use the comprehensive network and API services implemented in your Flutter clean code architecture app.

## Overview

The network layer is built with the following components:

- **NetworkClient**: Enhanced Dio-based HTTP client with connectivity checking
- **ApiServiceImpl**: High-level API service implementing clean architecture principles
- **CacheService**: Offline support and performance optimization through caching
- **BaseRepository**: Repository pattern with automatic caching and error handling
- **Network Exceptions**: Comprehensive error handling system

## Features

✅ **Automatic connectivity checking**  
✅ **Request/Response logging (debug mode)**  
✅ **Automatic token management**  
✅ **Comprehensive error handling**  
✅ **Offline caching support**  
✅ **File upload/download capabilities**  
✅ **Pagination support**  
✅ **Request cancellation**  
✅ **Retry mechanism**  

## Quick Setup

### 1. Dependencies

Make sure you have these dependencies in your `pubspec.yaml`:

```yaml
dependencies:
  dio: ^5.6.0
  connectivity_plus: ^6.0.0
  shared_preferences: ^2.5.3
  path_provider: ^2.1.4
  get_it: ^9.2.0
```

### 2. Initialize Services

The services are automatically registered in your dependency injection container:

```dart
// This is already done in config/dependency_injection.dart
await initializeDependencies(environment: 'dev');
```

## Usage Examples

### Basic API Calls

```dart
import 'package:get_it/get_it.dart';

final apiService = GetIt.instance<IApiService>();

// GET request
final response = await apiService.get<Map<String, dynamic>>(
  '/api/users/123',
  fromJson: (data) => data as Map<String, dynamic>,
);

// POST request  
final createResponse = await apiService.post<Map<String, dynamic>>(
  '/api/users',
  data: {
    'name': 'John Doe',
    'email': 'john@example.com',
  },
  fromJson: (data) => data as Map<String, dynamic>,
);

// PUT request
final updateResponse = await apiService.put<Map<String, dynamic>>(
  '/api/users/123',
  data: {'name': 'Jane Doe'},
  fromJson: (data) => data as Map<String, dynamic>,
);

// DELETE request
await apiService.delete<Map<String, dynamic>>(
  '/api/users/123',
  fromJson: (data) => data as Map<String, dynamic>,
);
```

### File Upload

```dart
// Upload a file
final file = File('/path/to/file.jpg');
final response = await apiService.uploadFile<Map<String, dynamic>>(
  '/api/upload',
  file,
  fileFieldName: 'image',
  additionalData: {'description': 'Profile photo'},
  onSendProgress: (sent, total) {
    print('Upload progress: ${(sent / total * 100).toStringAsFixed(1)}%');
  },
  fromJson: (data) => data as Map<String, dynamic>,
);
```

### File Download

```dart
// Download a file
await apiService.downloadFile(
  'https://example.com/file.pdf',
  '/local/path/file.pdf',
  onReceiveProgress: (received, total) {
    if (total != -1) {
      print('Download progress: ${(received / total * 100).toStringAsFixed(1)}%');
    }
  },
);
```

### Using Repository Pattern

Create a repository for your domain entities:

```dart
class UserRepository extends BaseRepository {
  UserRepository({
    required IApiService apiService,
    required CacheService cacheService,
  }) : super(apiService: apiService, cacheService: cacheService);

  // GET with caching
  Future<User> getUserById(int id, {bool forceRefresh = false}) async {
    return await getWithCache<User>(
      '/api/users/$id',
      User.fromJson,
      forceRefresh: forceRefresh,
      cacheExpiry: const Duration(minutes: 30),
    );
  }

  // GET list with caching
  Future<List<User>> getAllUsers({bool forceRefresh = false}) async {
    return await getListWithCache<User>(
      '/api/users',
      User.fromJson,
      forceRefresh: forceRefresh,
      cacheExpiry: const Duration(minutes: 15),
    );
  }

  // Pagination
  Future<PaginatedResult<User>> getUsersPaginated({
    int page = 1,
    int limit = 20,
    String? search,
  }) async {
    final params = <String, dynamic>{};
    if (search != null) params['search'] = search;

    return await getPaginated<User>(
      '/api/users',
      User.fromJson,
      page: page,
      limit: limit,
      additionalParams: params,
    );
  }

  // Create
  Future<User> createUser(Map<String, dynamic> userData) async {
    return await post<User>(
      '/api/users',
      userData,
      User.fromJson,
    );
  }

  // Update
  Future<User> updateUser(int id, Map<String, dynamic> userData) async {
    return await put<User>(
      '/api/users/$id',
      userData,
      User.fromJson,
    );
  }

  // Delete
  Future<void> deleteUser(int id) async {
    await delete<Map<String, dynamic>>(
      '/api/users/$id',
      (json) => json,
    );
  }
}
```

### Error Handling

The network layer provides comprehensive error handling:

```dart
try {
  final user = await userRepository.getUserById(123);
  print('User: ${user.name}');
} on NoInternetConnectionException {
  print('No internet connection');
} on UnauthorizedException {
  print('User not authorized');
} on NotFoundException {
  print('User not found');
} on ServerException catch (e) {
  print('Server error: ${e.message}');
} on NetworkException catch (e) {
  print('Network error: ${e.message}');
}
```

### Caching

The cache service provides automatic offline support:

```dart
final cacheService = GetIt.instance<CacheService>();

// Manual cache operations
await cacheService.store('key', {'data': 'value'});
final cachedData = await cacheService.retrieve('key');
await cacheService.remove('key');
await cacheService.clearAll();

// Repository automatically handles caching
final users = await userRepository.getAllUsers(); // From cache if available
final freshUsers = await userRepository.getAllUsers(forceRefresh: true); // Fresh from API
```

### Connectivity Checking

```dart
final apiService = GetIt.instance<IApiService>();

if (await apiService.hasInternetConnection()) {
  // Make API calls
  final data = await apiService.get('/api/data');
} else {
  // Handle offline state
  print('Device is offline');
}
```

### Request Cancellation

```dart
final cancelToken = CancelToken();

// Start a request
final request = apiService.get(
  '/api/large-data',
  cancelToken: cancelToken,
  fromJson: (data) => data,
);

// Cancel if needed
cancelToken.cancel('User cancelled');

try {
  await request;
} catch (e) {
  if (e is DioException && e.type == DioExceptionType.cancel) {
    print('Request was cancelled');
  }
}
```

## Configuration

### Environment Configuration

Update your `AppConfig` to customize network settings:

```dart
class AppConfig {
  // Network timeouts
  int get connectionTimeout => 30000; // 30 seconds
  int get receiveTimeout => 30000;    // 30 seconds
  
  // Base URLs for different environments
  String get baseUrl {
    switch (currentEnv) {
      case Env.dev:
        return 'https://api-dev.yourapp.com';
      case Env.test:
        return 'https://api-test.yourapp.com';
      case Env.prod:
        return 'https://api.yourapp.com';
    }
  }
}
```

### Custom Headers

Add custom headers globally or per request:

```dart
// Global headers (in NetworkClient)
dio.options.headers['Custom-Header'] = 'value';

// Per request
await apiService.get(
  '/api/endpoint',
  options: Options(headers: {'Special-Header': 'value'}),
  fromJson: (data) => data,
);
```

## Best Practices

### 1. Use Repository Pattern
Always use repositories for data access to get automatic caching and error handling.

### 2. Handle Offline States
Check connectivity and provide offline fallbacks:

```dart
try {
  final data = await repository.getData();
  return data;
} on NoInternetConnectionException {
  // Return cached data or show offline message
  final cachedData = await cacheService.retrieve('data_key');
  if (cachedData != null) {
    return DataModel.fromJson(cachedData);
  }
  throw const NoInternetConnectionException();
}
```

### 3. Implement Proper Models
Create proper data models with fromJson/toJson methods:

```dart
class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
    };
  }
}
```

### 4. Use Proper Error Handling
Always wrap API calls in try-catch blocks and handle specific exceptions.

### 5. Optimize Cache Usage
Set appropriate cache expiry times based on data volatility:

```dart
// Frequently changing data
cacheExpiry: const Duration(minutes: 5)

// Relatively stable data
cacheExpiry: const Duration(hours: 1)

// Static data
cacheExpiry: const Duration(days: 1)
```

## Troubleshooting

### Common Issues

1. **Connectivity Issues**: Check device internet connection and API endpoint availability
2. **SSL Certificate Errors**: Ensure proper certificate validation for production URLs  
3. **Timeout Errors**: Adjust timeout values in AppConfig for slow networks
4. **Cache Issues**: Clear cache if data seems stale: `await cacheService.clearAll()`

### Debug Mode

Enable detailed logging in debug mode by setting `isDebug = true` in your AppConfig.

## Migration from Legacy API Service

If you were using the old ApiService, here's how to migrate:

```dart
// Old way
final apiService = GetIt.instance<ApiService>();
final dio = await apiService.launchDio();
final response = await dio.get('/api/endpoint');

// New way
final apiService = GetIt.instance<IApiService>();
final response = await apiService.get<Map<String, dynamic>>(
  '/api/endpoint',
  fromJson: (data) => data as Map<String, dynamic>,
);
```

Both services coexist, so you can migrate gradually.

## Contributing

When adding new API endpoints:

1. Create appropriate repository methods
2. Add proper error handling
3. Set reasonable cache expiry times
4. Write tests for your endpoints
5. Update this documentation

For questions or issues, please refer to the project's issue tracker.
