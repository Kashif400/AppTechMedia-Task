import 'package:clean_code_architecture_app/features/chat/presentation/view/message_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/bloc/login_bloc.dart';
import '../../features/auth/presentation/view/login_view.dart';
import '../../features/auth/presentation/view/splash_view.dart';
import '../../features/chat/presentation/bloc/chat_bloc.dart';
import '../di/dependency_injection.dart';
import 'app_routes.dart';
import 'custom_page_builder_widget.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true, // Enable debug logging to diagnose URL issues

  initialLocation: AppRoutes.splashView,

  routes: <RouteBase>[
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: AppRoutes.splashView,
      pageBuilder: (context, state) =>
          customPageBuilderWidget(context, state, const SplashView()),
    ),
    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: AppRoutes.signInView,
      pageBuilder: (context, state) => customPageBuilderWidget(
        context,
        state,
        BlocProvider(create: (_) => locator<LoginBloc>(), child: LoginView()),
      ),
    ),

    GoRoute(
      parentNavigatorKey: _rootNavigatorKey,
      path: AppRoutes.messageView,
      pageBuilder: (context, state) => customPageBuilderWidget(
        context,
        state,
        BlocProvider(
          create: (_) =>
              locator<ChatBloc>()..add(const FetchConversationsRequested()),
          child: const MessageView(),
        ),
      ),
    ),
  ],
);

GoRouter get router => _router;
get getContext => _router.routerDelegate.navigatorKey.currentContext;
