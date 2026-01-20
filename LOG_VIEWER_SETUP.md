# 🔍 In-App Log Viewer Setup

This guide shows you how to add an in-app log viewer to see all Talker logs while the app is running. This is useful for:
- Testing on physical devices
- Debugging in production-like environments
- Sharing logs with team members
- Quick debugging without IDE access

## 🚀 Quick Setup

### Option 1: Add to Existing Screen (Quick Debug Button)

Add a floating button to any screen to quickly access logs:

```dart
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../core/utils/talker_service.dart';

class YourPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Page')),
      body: YourContent(),
      // Add this floating button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final talker = GetIt.instance<TalkerService>().talker;
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TalkerScreen(talker: talker),
            ),
          );
        },
        child: const Icon(Icons.bug_report),
      ),
    );
  }
}
```

### Option 2: Add to Drawer Menu

Add to your app's drawer navigation:

```dart
Drawer(
  child: ListView(
    children: [
      // ... your other menu items
      
      if (kDebugMode) // Only show in debug mode
        ListTile(
          leading: const Icon(Icons.bug_report),
          title: const Text('View Logs'),
          onTap: () {
            final talker = GetIt.instance<TalkerService>().talker;
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TalkerScreen(talker: talker),
              ),
            );
          },
        ),
    ],
  ),
)
```

### Option 3: Add to Router (Recommended)

Add a route in your `go_router` configuration:

```dart
// In lib/config/router.dart

import 'package:get_it/get_it.dart';
import 'package:talker_flutter/talker_flutter.dart';
import '../core/utils/talker_service.dart';

final router = GoRouter(
  routes: [
    // ... your existing routes
    
    // Add this route
    GoRoute(
      path: '/logs',
      builder: (context, state) {
        final talker = GetIt.instance<TalkerService>().talker;
        return TalkerScreen(talker: talker);
      },
    ),
  ],
);
```

Then navigate to it from anywhere:

```dart
context.push('/logs');
```

### Option 4: Secret Gesture (Production-Safe)

Add a secret gesture that only developers know:

```dart
class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _tapCount = 0;
  DateTime? _lastTap;

  void _handleSecretTap() {
    final now = DateTime.now();
    
    // Reset if taps are more than 1 second apart
    if (_lastTap != null && now.difference(_lastTap!) > const Duration(seconds: 1)) {
      _tapCount = 0;
    }
    
    _lastTap = now;
    _tapCount++;
    
    // Open logs after 7 taps
    if (_tapCount >= 7) {
      _tapCount = 0;
      final talker = GetIt.instance<TalkerService>().talker;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => TalkerScreen(talker: talker),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: _handleSecretTap,
          child: const Text('My App'),
        ),
      ),
      body: YourContent(),
    );
  }
}
```

## 🎨 Customizing the Log Viewer

### Custom Theme

```dart
TalkerScreen(
  talker: talker,
  theme: TalkerScreenTheme(
    backgroundColor: Colors.black,
    cardColor: Colors.grey[900],
    textColor: Colors.white,
  ),
)
```

### Filter Logs

```dart
TalkerScreen(
  talker: talker,
  // Only show errors and critical logs
  filter: TalkerFilter(
    types: [
      TalkerLogType.error,
      TalkerLogType.critical,
    ],
  ),
)
```

### Custom Actions

```dart
TalkerScreen(
  talker: talker,
  actions: [
    // Add custom action button
    TalkerAction(
      title: 'Share Logs',
      icon: Icons.share,
      onTap: (context) {
        final logs = talker.history;
        // Share logs (implement your sharing logic)
      },
    ),
    TalkerAction(
      title: 'Clear All',
      icon: Icons.delete_forever,
      onTap: (context) {
        talker.cleanHistory();
        Navigator.of(context).pop();
      },
    ),
  ],
)
```

## 📱 Log Viewer Features

The built-in `TalkerScreen` provides:

- ✅ **Color-coded logs** by type (error, warning, info, etc.)
- ✅ **Search and filter** functionality
- ✅ **Copy logs** to clipboard
- ✅ **View stack traces** for errors
- ✅ **Timeline view** with timestamps
- ✅ **Expandable log details**
- ✅ **Export logs** to file
- ✅ **Real-time updates** as new logs come in

## 🔐 Production Considerations

### Option 1: Disable in Production

```dart
// Only add route in debug mode
if (kDebugMode) {
  GoRoute(
    path: '/logs',
    builder: (context, state) {
      final talker = GetIt.instance<TalkerService>().talker;
      return TalkerScreen(talker: talker);
    },
  ),
}
```

### Option 2: Add Authentication

```dart
GoRoute(
  path: '/logs',
  builder: (context, state) {
    // Check if user is admin/developer
    final isAdmin = GetIt.instance<AuthService>().isAdmin;
    
    if (!isAdmin) {
      return const UnauthorizedScreen();
    }
    
    final talker = GetIt.instance<TalkerService>().talker;
    return TalkerScreen(talker: talker);
  },
)
```

### Option 3: Feature Flag

```dart
GoRoute(
  path: '/logs',
  builder: (context, state) {
    final config = GetIt.instance<AppConfig>();
    
    if (!config.enableLogViewer) {
      return const NotFoundScreen();
    }
    
    final talker = GetIt.instance<TalkerService>().talker;
    return TalkerScreen(talker: talker);
  },
)
```

## 🔧 Advanced: Custom Log Viewer

If you need more control, create a custom log viewer:

```dart
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../core/utils/talker_service.dart';

class CustomLogViewer extends StatefulWidget {
  @override
  State<CustomLogViewer> createState() => _CustomLogViewerState();
}

class _CustomLogViewerState extends State<CustomLogViewer> {
  final talkerService = GetIt.instance<TalkerService>();
  String _filter = '';

  @override
  Widget build(BuildContext context) {
    final logs = talkerService.history.where((log) {
      if (_filter.isEmpty) return true;
      return log.message.toLowerCase().contains(_filter.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Logs'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              setState(() {
                talkerService.clearHistory();
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Search logs...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  _filter = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: logs.length,
              itemBuilder: (context, index) {
                final log = logs[index];
                return ListTile(
                  title: Text(log.message),
                  subtitle: Text(log.time.toString()),
                  leading: Icon(_getIconForLog(log)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  IconData _getIconForLog(dynamic log) {
    // Customize based on log type
    return Icons.info;
  }
}
```

## 📤 Exporting Logs

### Save to File

```dart
import 'dart:io';
import 'package:path_provider/path_provider.dart';

Future<void> exportLogs() async {
  final talker = GetIt.instance<TalkerService>().talker;
  final logs = talker.history;
  
  final dir = await getApplicationDocumentsDirectory();
  final file = File('${dir.path}/logs_${DateTime.now().millisecondsSinceEpoch}.txt');
  
  final logText = logs.map((log) => '${log.time}: ${log.message}').join('\n');
  await file.writeAsString(logText);
  
  print('Logs exported to: ${file.path}');
}
```

### Share Logs

```dart
import 'package:share_plus/share_plus.dart';

Future<void> shareLogs() async {
  final talker = GetIt.instance<TalkerService>().talker;
  final logs = talker.history;
  
  final logText = logs.map((log) => '${log.time}: ${log.message}').join('\n');
  
  await Share.share(
    logText,
    subject: 'App Logs - ${DateTime.now()}',
  );
}
```

## 🎯 Best Practices

1. **Always add authentication** for production log viewers
2. **Use feature flags** to enable/disable log viewer
3. **Limit log history** to prevent memory issues
4. **Add export functionality** for debugging sessions
5. **Include filtering** for large log volumes
6. **Use secret gestures** for production-safe access
7. **Clear sensitive data** before sharing logs

## 🚀 Quick Start Recommendation

For most apps, add this to your home screen during development:

```dart
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: YourContent(),
      
      // Only show in debug mode
      floatingActionButton: kDebugMode
          ? FloatingActionButton(
              mini: true,
              child: const Icon(Icons.bug_report),
              onPressed: () {
                final talker = GetIt.instance<TalkerService>().talker;
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => TalkerScreen(talker: talker),
                  ),
                );
              },
            )
          : null,
    );
  }
}
```

Then for production, use a secret gesture or remove it entirely! 🎉
