import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/dependency_injection.dart';
import 'core/utils/talker_bloc_observer.dart';
import 'core/utils/talker_service.dart';
import 'main_common.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependencies with production environment
  await initializeDependencies(environment: 'prod');

  // Get TalkerService and setup BLoC observer
  final talkerService = serviceLocator<TalkerService>();
  Bloc.observer = TalkerBlocObserverService(talkerService);

  talkerService.info('🚀 Starting app in PROD mode');

  runApp(const MyApp());
}
