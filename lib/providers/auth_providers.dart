import 'package:app/models/auth_state_model.dart';
import 'package:app/notifiers/auth_notifier.dart';
import 'package:app/service/auth_service.dart';
import 'package:app/service/user_service.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final supabaseClientProvider = Provider<SupabaseClient>((ref) {
  return Supabase.instance.client;
});

final authRepositoryProvider = Provider<AuthService>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return AuthService(client);
});

final userServiceProvider = Provider<UserService>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return UserService(client);
});

final authProvider = StateNotifierProvider<AuthNotifier, AuthStateModel>((ref) {
  final authService = ref.watch(authRepositoryProvider);
  final userService = ref.watch(userServiceProvider);
  return AuthNotifier(authService,userService)..initialize();
});

final currentUserProvider = Provider<User?>((ref) {
  return ref.watch(authProvider).user;
});
final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(authProvider).isAuthenticated;
});
