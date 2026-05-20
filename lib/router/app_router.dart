import 'package:app/models/auth_state_model.dart';
import 'package:app/providers/auth_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authProvider);
  return GoRouter(
    initialLocation: '/login',
    redirect: (context, state) {
      final isLoading =
          authState.status == AuthStatus.initial ||
          authState.status == AuthStatus.loading;
      final isAuthenticated = authState.isAuthenticated;
      final isOnAuthRoute =
          state.matchedLocation == 'login' || state.matchedLocation == 'signup';
      if (isLoading) return null;
      if (!isAuthenticated && !isOnAuthRoute) return '/login';
      if (isAuthenticated && isOnAuthRoute) return '/home';
      return null;
    },
    routes: [
      //  GoRoute(path: '/login', builder: (_, __) => const LoginScreen()),
      // GoRoute(path: '/signup', builder: (_, __) => const SignupScreen()),
      // GoRoute(path: '/home', builder: (_, __) => const HomeScreen()),
    ],
  );
});
