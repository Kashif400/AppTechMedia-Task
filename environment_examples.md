# Environment Usage Examples

## Different Ways to Initialize Dependencies

### 1. Main Entry Points (Recommended for Flavors)

```dart
// lib/main_dev.dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies(environment: Env.dev);
  runApp(const MyApp());
}

// lib/main_prod.dart  
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies(environment: Env.prod);
  runApp(const MyApp());
}

// lib/main_test.dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies(environment: Env.test);
  runApp(const MyApp());
}
```

### 2. Dynamic Environment Selection

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Determine environment based on build mode or other criteria
  Env environment;
  if (kDebugMode) {
    environment = Env.dev;
  } else if (kProfileMode) {
    environment = Env.test;  
  } else {
    environment = Env.prod;
  }
  
  await initializeDependencies(environment: environment);
  runApp(const MyApp());
}
```

### 3. Environment from Configuration

```dart
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Load environment from configuration file or remote config
  final config = await loadAppConfiguration();
  final environment = config.environment;
  
  await initializeDependencies(environment: environment);
  runApp(const MyApp());
}
```

### 4. Testing Setup

```dart
// In your test files
void main() {
  setUp(() async {
    // Initialize with test environment for testing
    await initializeDependencies(environment: Env.test);
  });
  
  tearDown(() {
    // Clean up service locator
    serviceLocator.reset();
  });
}
```

## Benefits

1. **Centralized Configuration**: Environment setup is handled in one place
2. **Type Safety**: Compile-time checking of environment values
3. **Flexibility**: Easy to switch environments or add new ones
4. **Testing**: Clean setup and teardown for tests
5. **Consistency**: All services get the same environment configuration
