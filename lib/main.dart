import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'config/dependency_injection.dart';
import 'main_common.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    print('Warning: Could not load .env file: $e');
  }

  // Initialize dependencies with default development environment
  await initializeDependencies(environment: 'dev');

  runApp(const MyApp());
}

