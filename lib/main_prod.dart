import 'package:flutter/material.dart';
import 'config/dependency_injection.dart';
import 'main_common.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependencies with production environment
  await initializeDependencies(environment: 'prod');

  runApp(const MyApp());
}
