import 'package:app/models/auth_state_model.dart';
import 'package:app/pages/add_customer_page.dart';
import 'package:app/pages/home_page.dart';
import 'package:app/pages/login_screen.dart';
import 'package:app/pages/setting_page.dart';
import 'package:app/pages/signup_screen.dart';
import 'package:app/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);
  List<String> publicRoutes = ['/login', '/signup'];

  // Create a notifier that updates whenever auth state changes
  final routerStateNotifier = ValueNotifier(authState);
  ref.listen<AuthStateModel>(authProvider, (previous, next) {
    routerStateNotifier.value = next;
  });

  return GoRouter(
    initialLocation: '/login',
    refreshListenable: routerStateNotifier,
    redirect: (context, state) {
      // Use the authState from the closure, NOT ref.watch() to avoid Riverpod errors
      final isLoading =
          authState.status == AuthStatus.initial ||
          authState.status == AuthStatus.loading;
      final isAuthenticated = authState.isAuthenticated;
      final isOnAuthRoute =
          state.matchedLocation == '/login' ||
          state.matchedLocation == '/signup';
      final status = authState.status;
      final isPublicRoute = publicRoutes.contains(state.matchedLocation);
      if (isLoading) return null;
      if (status == AuthStatus.initial || status == AuthStatus.loading) {
        return null;
      }
      if (!isAuthenticated && !isPublicRoute) return '/login';
      if (!isAuthenticated && !isOnAuthRoute) return '/login';
      if (isAuthenticated && isOnAuthRoute) return '/home';
      if (isAuthenticated && isPublicRoute) return '/home';

      return null;
    },
    routes: [
      GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
      GoRoute(path: '/signup', builder: (_, __) => const SignupScreen()),
      GoRoute(path: '/home', builder: (_, __) => const HomePage()),
      GoRoute(path: '/settings', builder: (_, __) => const SettingPage()),
      GoRoute(
        path: '/customer/new',
        builder: (_, __) => const AddCustomerPage(),
      ),
    ],
  );
});
