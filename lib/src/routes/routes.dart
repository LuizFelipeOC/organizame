import 'package:go_router/go_router.dart';

import '../ui/pages/login/login_page.dart';
import '../ui/pages/register/register_page.dart';

class AppRoutes {
  static final GoRouter routes = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (_, state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: '/register',
        builder: (_, state) {
          return const RegisterPage();
        },
      ),
    ],
  );
}
