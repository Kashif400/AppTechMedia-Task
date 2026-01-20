# 🚀 Quick Logging Setup Template

This file contains ready-to-use templates for adding Talker logging to different layers of your application.

## 📋 Template Index

1. [Repository Template](#repository-template)
2. [Remote Data Source Template](#remote-data-source-template)
3. [Local Data Source Template](#local-data-source-template)
4. [Use Case Template](#use-case-template)
5. [BLoC Template](#bloc-template)
6. [UI Widget Template](#ui-widget-template)

---

## Repository Template

```dart
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/talker_service.dart';
// ... your other imports

class YourRepositoryImpl implements YourRepository {
  final YourRemoteDataSource remoteDataSource;
  final YourLocalDataSource localDataSource;
  final _talker = GetIt.instance<TalkerService>();

  YourRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, YourEntity>> yourMethod({
    required String param,
  }) async {
    try {
      _talker.info('🔄 Repository: yourMethod started', data: {'param': param});
      
      // Your implementation
      final result = await remoteDataSource.yourMethod(param: param);
      
      // Cache if needed
      await localDataSource.cache(result);

      _talker.info('✅ Repository: yourMethod successful');
      return Right(result.toEntity());
    } catch (e, stackTrace) {
      _talker.error(
        e,
        stackTrace: stackTrace,
        message: '❌ Repository: yourMethod failed',
      );
      return Left(ServerFailure(e.toString()));
    }
  }
}
```

---

## Remote Data Source Template

```dart
import 'package:get_it/get_it.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/utils/talker_service.dart';
// ... your other imports

abstract class YourRemoteDataSource {
  Future<YourModel> yourMethod({required String param});
}

class YourRemoteDataSourceImpl implements YourRemoteDataSource {
  final DioClient dioClient;
  final _talker = GetIt.instance<TalkerService>();

  YourRemoteDataSourceImpl({required this.dioClient});

  @override
  Future<YourModel> yourMethod({required String param}) async {
    _talker.debug('🌐 RemoteDataSource: yourMethod API call', data: {'param': param});
    
    final response = await dioClient.post(
      endPoint: 'your/endpoint',
      data: {'param': param},
    );

    if (response.success) {
      _talker.info('✅ RemoteDataSource: yourMethod successful');
      return YourModel.fromJson(response.data);
    } else {
      final errorMsg = response.error ?? 'Request failed';
      _talker.error(errorMsg, message: '❌ RemoteDataSource: yourMethod failed');
      throw Exception(errorMsg);
    }
  }
}
```

---

## Local Data Source Template

```dart
import 'package:get_it/get_it.dart';
import '../../../../core/utils/local_storage_service.dart';
import '../../../../core/utils/talker_service.dart';
// ... your other imports

abstract class YourLocalDataSource {
  Future<YourModel?> getCached();
  Future<void> cache(YourModel model);
  Future<void> clearCache();
}

class YourLocalDataSourceImpl implements YourLocalDataSource {
  final LocalStorageService localStorage;
  final _talker = GetIt.instance<TalkerService>();

  YourLocalDataSourceImpl({required this.localStorage});

  @override
  Future<YourModel?> getCached() async {
    try {
      _talker.debug('📱 LocalDataSource: Getting cached data');
      final jsonString = localStorage.getString('your_cache_key');
      
      if (jsonString != null) {
        _talker.debug('✅ LocalDataSource: Data found in cache');
        return YourModel.fromJson(jsonDecode(jsonString));
      }
      
      _talker.debug('ℹ️ LocalDataSource: No cached data found');
      return null;
    } catch (e, stackTrace) {
      _talker.warning('⚠️ LocalDataSource: Error getting cached data', data: e.toString());
      return null;
    }
  }

  @override
  Future<void> cache(YourModel model) async {
    _talker.debug('💾 LocalDataSource: Caching data');
    await localStorage.setString('your_cache_key', jsonEncode(model.toJson()));
    _talker.debug('✅ LocalDataSource: Data cached successfully');
  }

  @override
  Future<void> clearCache() async {
    _talker.debug('🗑️ LocalDataSource: Clearing cache');
    await localStorage.remove('your_cache_key');
    _talker.debug('✅ LocalDataSource: Cache cleared');
  }
}
```

---

## Use Case Template

```dart
import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../../core/utils/talker_service.dart';
// ... your other imports

class YourUseCase implements UseCase<YourEntity, YourParams> {
  final YourRepository repository;
  final _talker = GetIt.instance<TalkerService>();

  YourUseCase(this.repository);

  @override
  Future<Either<Failure, YourEntity>> call(YourParams params) async {
    _talker.info('🎯 UseCase: YourUseCase started', data: {
      'param': params.yourParam,
    });
    
    final result = await repository.yourMethod(
      param: params.yourParam,
    );
    
    result.fold(
      (failure) {
        _talker.warning('⚠️ UseCase: YourUseCase failed', data: failure.message);
      },
      (entity) {
        _talker.info('✅ UseCase: YourUseCase successful');
      },
    );
    
    return result;
  }
}

class YourParams extends Equatable {
  final String yourParam;

  const YourParams({required this.yourParam});

  @override
  List<Object?> get props => [yourParam];
}
```

---

## BLoC Template

**Note:** BLoC events and states are automatically logged by `TalkerBlocObserver`. 
You only need to add manual logging for specific complex operations.

```dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import '../../../../core/utils/talker_service.dart';
// ... your other imports

part 'your_event.dart';
part 'your_state.dart';

class YourBloc extends Bloc<YourEvent, YourState> {
  final YourUseCase yourUseCase;
  final _talker = GetIt.instance<TalkerService>();

  YourBloc({required this.yourUseCase}) : super(YourInitial()) {
    on<YourEventTriggered>(_onYourEventTriggered);
  }

  Future<void> _onYourEventTriggered(
    YourEventTriggered event,
    Emitter<YourState> emit,
  ) async {
    // States are automatically logged by TalkerBlocObserver
    emit(YourLoading());

    // Optional: Add custom logging for complex operations
    _talker.debug('🔄 BLoC: Processing complex operation');

    final result = await yourUseCase(
      YourParams(yourParam: event.param),
    );

    result.fold(
      (failure) => emit(YourError(failure.message)),
      (entity) => emit(YourSuccess(entity)),
    );
  }
}
```

---

## UI Widget Template

```dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../core/utils/talker_service.dart';
// ... your other imports

class YourPage extends StatelessWidget {
  final _talker = GetIt.instance<TalkerService>();

  YourPage({super.key});

  void _handleAction(BuildContext context) {
    _talker.debug('🖱️ UI: Action button pressed');
    
    context.read<YourBloc>().add(
      YourEventTriggered(param: 'value'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Page')),
      body: BlocConsumer<YourBloc, YourState>(
        listener: (context, state) {
          if (state is YourError) {
            _talker.warning('⚠️ UI: Error displayed to user', data: state.message);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is YourSuccess) {
            _talker.info('✅ UI: Operation successful, showing result');
          }
        },
        builder: (context, state) {
          if (state is YourLoading) {
            _talker.debug('🖥️ UI: Showing loading indicator');
            return const Center(child: CircularProgressIndicator());
          }

          if (state is YourError) {
            return Center(child: Text('Error: ${state.message}'));
          }

          if (state is YourSuccess) {
            return YourSuccessWidget(state.data);
          }

          return Center(
            child: ElevatedButton(
              onPressed: () => _handleAction(context),
              child: const Text('Start Action'),
            ),
          );
        },
      ),
    );
  }
}
```

---

## 🎨 Common Logging Patterns

### Pattern 1: Try-Catch with Logging

```dart
try {
  _talker.info('🔄 Starting operation', data: {'input': input});
  
  final result = await someOperation(input);
  
  _talker.info('✅ Operation completed successfully');
  return result;
} catch (e, stackTrace) {
  _talker.error(
    e,
    stackTrace: stackTrace,
    message: '❌ Operation failed',
  );
  rethrow; // or handle appropriately
}
```

### Pattern 2: Conditional Logging

```dart
if (condition) {
  _talker.debug('✅ Condition met, proceeding');
  // do something
} else {
  _talker.warning('⚠️ Condition not met, using fallback');
  // do something else
}
```

### Pattern 3: Performance Logging

```dart
final stopwatch = Stopwatch()..start();
_talker.debug('⏱️ Starting heavy operation');

await heavyOperation();

stopwatch.stop();
_talker.info('✅ Heavy operation completed', data: {
  'duration': '${stopwatch.elapsedMilliseconds}ms',
});
```

### Pattern 4: User Interaction Logging

```dart
void _onButtonPressed() {
  _talker.debug('🖱️ UI: Button pressed', data: {
    'button': 'submit',
    'screen': 'login',
    'timestamp': DateTime.now().toIso8601String(),
  });
  
  // Handle button press
}
```

### Pattern 5: Navigation Logging

```dart
void _navigateToScreen(BuildContext context) {
  _talker.info('🧭 UI: Navigating to detail screen');
  
  context.push('/detail');
}
```

---

## 📝 Quick Tips

1. **Use consistent emoji prefixes** for easy visual scanning:
   - 🔐 Authentication
   - 🌐 Network/API
   - 📱 Local Storage
   - 🎯 Use Case/Business Logic
   - 🖱️ User Interaction
   - 🧭 Navigation
   - ⏱️ Performance
   - ✅ Success
   - ❌ Error
   - ⚠️ Warning
   - ℹ️ Info

2. **Always include context data** for debugging:
   ```dart
   data: {'userId': userId, 'action': action}
   ```

3. **Log at boundaries** (entering/exiting layers)

4. **Use appropriate log levels**:
   - `debug` - Development info
   - `info` - Important events
   - `warning` - Recoverable issues
   - `error` - Failures
   - `critical` - Severe failures

5. **Keep messages clear and actionable**

---

## 🔄 Adding Logging to Existing Code

### Step 1: Add Import and Instance
```dart
import 'package:get_it/get_it.dart';
import '../../../../core/utils/talker_service.dart';

class YourClass {
  final _talker = GetIt.instance<TalkerService>();
  // ... rest of your class
}
```

### Step 2: Replace print() statements
```dart
// Before
print('User logged in');

// After
_talker.info('✅ User logged in', data: {'userId': user.id});
```

### Step 3: Add logging around operations
```dart
Future<void> yourMethod() async {
  _talker.debug('🔄 Starting yourMethod');
  
  try {
    // your code
    _talker.info('✅ yourMethod completed');
  } catch (e, stackTrace) {
    _talker.error(e, stackTrace: stackTrace, message: '❌ yourMethod failed');
    rethrow;
  }
}
```

---

## ✅ Checklist for New Features

- [ ] Add `_talker` instance to all classes that need logging
- [ ] Log at start of important operations
- [ ] Log successful completions
- [ ] Log all error cases with stack traces
- [ ] Add contextual data to logs
- [ ] Use appropriate emoji prefixes
- [ ] Test that logs appear correctly
- [ ] Remove any remaining `print()` statements

---

Copy and paste these templates when creating new features! 🚀
