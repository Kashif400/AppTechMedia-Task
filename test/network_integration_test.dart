import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

// Import your network services
import '../lib/core/network/api_service_interface.dart';
import '../lib/core/network/cache_service.dart';
import '../lib/core/network/enhanced_api_service.dart';
import '../lib/core/network/network_client.dart';
import '../lib/core/network/network_exceptions.dart';
import '../lib/config/dependency_injection.dart';

void main() {
  group('Network Service Integration Tests', () {
    setUp(() async {
      // Clean up GetIt before each test
      await GetIt.instance.reset();

      // Initialize dependencies with test environment
      await initializeDependencies(environment: 'test');
    });

    tearDown(() async {
      // Clean up after each test
      await GetIt.instance.reset();
    });

    test('should initialize all network services correctly', () async {
      // Verify all services are registered
      expect(GetIt.instance.isRegistered<NetworkClient>(), true);
      expect(GetIt.instance.isRegistered<IApiService>(), true);
      expect(GetIt.instance.isRegistered<CacheService>(), true);

      // Verify services can be retrieved
      final networkClient = GetIt.instance<NetworkClient>();
      final apiService = GetIt.instance<IApiService>();
      final cacheService = GetIt.instance<CacheService>();

      expect(networkClient, isNotNull);
      expect(apiService, isNotNull);
      expect(cacheService, isNotNull);
      expect(apiService, isA<ApiServiceImpl>());
    });

    test('cache service should store and retrieve data', () async {
      final cacheService = GetIt.instance<CacheService>();

      const testKey = 'test_key';
      const testData = {'message': 'Hello World', 'timestamp': 12345};

      // Store data
      final stored = await cacheService.store(testKey, testData);
      expect(stored, true);

      // Retrieve data
      final retrieved = await cacheService.retrieve(testKey);
      expect(retrieved, isNotNull);
      expect(retrieved!['message'], testData['message']);
      expect(retrieved['timestamp'], testData['timestamp']);

      // Check existence
      final exists = await cacheService.exists(testKey);
      expect(exists, true);

      // Remove data
      final removed = await cacheService.remove(testKey);
      expect(removed, true);

      // Verify removal
      final retrievedAfterRemoval = await cacheService.retrieve(testKey);
      expect(retrievedAfterRemoval, isNull);
    });

    test('api service should check connectivity', () async {
      final apiService = GetIt.instance<IApiService>();

      // This test assumes device has internet connection
      // In a real test environment, you might want to mock this
      final hasConnection = await apiService.hasInternetConnection();
      expect(hasConnection, isA<bool>());
    });

    test('cache service should handle expired entries', () async {
      final cacheService = GetIt.instance<CacheService>();

      const testKey = 'expiry_test';
      const testData = {'message': 'This will expire'};

      // Store with very short expiry
      await cacheService.store(
        testKey,
        testData,
        expiry: const Duration(milliseconds: 100),
      );

      // Immediate retrieval should work
      var retrieved = await cacheService.retrieve(testKey);
      expect(retrieved, isNotNull);

      // Wait for expiry
      await Future.delayed(const Duration(milliseconds: 150));

      // Retrieval after expiry should return null
      retrieved = await cacheService.retrieve(testKey);
      expect(retrieved, isNull);
    });

    test('cache service should clear all data', () async {
      final cacheService = GetIt.instance<CacheService>();

      // Store multiple items
      await cacheService.store('key1', {'data': 'value1'});
      await cacheService.store('key2', {'data': 'value2'});
      await cacheService.store('key3', {'data': 'value3'});

      // Verify items exist
      expect(await cacheService.exists('key1'), true);
      expect(await cacheService.exists('key2'), true);
      expect(await cacheService.exists('key3'), true);

      // Clear all
      final cleared = await cacheService.clearAll();
      expect(cleared, true);

      // Verify items are gone
      expect(await cacheService.exists('key1'), false);
      expect(await cacheService.exists('key2'), false);
      expect(await cacheService.exists('key3'), false);
    });
  });

  group('Network Error Handling Tests', () {
    test('should handle network exceptions correctly', () {
      // These are unit tests for exception types
      expect(
        const NoInternetConnectionException().message,
        'No internet connection available',
      );

      expect(const UnauthorizedException().statusCode, 401);

      expect(const NotFoundException().statusCode, 404);

      expect(const ValidationException('Invalid input').statusCode, 422);

      expect(const ServerException('Internal error', 500).statusCode, 500);
    });
  });
}

// Mock classes if needed for testing
// You can create these to test without making real network calls

/*
class MockApiService implements IApiService {
  @override
  Future<T> get<T>(String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    T Function(dynamic data)? fromJson,
  }) async {
    // Return mock data
    if (fromJson != null) {
      return fromJson({'mock': 'data'});
    }
    return {'mock': 'data'} as T;
  }

  // Implement other required methods...
  @override
  Future<T> post<T>(String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    T Function(dynamic data)? fromJson,
  }) async => throw UnimplementedError();

  // ... other methods
}
*/
