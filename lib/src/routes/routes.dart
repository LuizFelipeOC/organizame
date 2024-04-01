import 'package:go_router/go_router.dart';

import '../ui/pages/forgot_password/forgot_password_page.dart';
import '../ui/pages/home/home_page.dart';
import '../ui/pages/login/login_page.dart';
import '../ui/pages/register/register_page.dart';
import '../ui/pages/splash/splash_page.dart';

class AppRoutes {
  static final GoRouter routes = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (_, state) {
          return const SplashPage();
        },
      ),
      GoRoute(
        path: '/login',
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
      GoRoute(
        path: '/forgot-password',
        builder: (_, state) {
          return const ForgotPassword();
        },
      ),
      GoRoute(
        path: '/home',
        builder: (_, state) {
          return const HomePage();
        },
      ),
    ],
  );
}
