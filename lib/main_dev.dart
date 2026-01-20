import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/dependency_injection.dart';
import 'core/utils/talker_bloc_observer.dart';
import 'core/utils/talker_service.dart';
import 'main_common.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  try {
    await dotenv.load(fileName: ".env");
  } catch (e) {
    print('Warning: Could not load .env file: $e');
  }

  // Initialize dependencies for development environment
  await initializeDependencies(environment: 'dev');

  // Get TalkerService and setup BLoC observer
  final talkerService = serviceLocator<TalkerService>();
  Bloc.observer = TalkerBlocObserverService(talkerService);

  talkerService.info('🎯 Starting app in DEV mode');

  runApp(const MyApp());
}
