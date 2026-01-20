import 'package:go_router/go_router.dart';
import '../presentation/pages/home_page.dart';
import '../features/auth/presentation/pages/login_page.dart';

class AppRouter {
  static const String login = '/login';
  static const String home = '/home';

  static final router = GoRouter(
    initialLocation: login,
    routes: [
      GoRoute(path: login, builder: (context, state) => const LoginPage()),
      GoRoute(path: home, builder: (context, state) => const HomePage()),
    ],
  );
}
