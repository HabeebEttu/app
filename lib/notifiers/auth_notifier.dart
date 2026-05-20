import 'dart:async';
import 'package:app/service/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/auth_state_model.dart';

class AuthNotifier extends StateNotifier<AuthStateModel> {
  final AuthService _authService;
  StreamSubscription<AuthState>? _authSubscription;

  AuthNotifier(this._authService) : super(const AuthStateModel.initial());

  /// Call once at startup. Handles persisted sessions (app restart)
  /// and listens to all future auth events from Supabase.
  void initialize() {
    // Check for existing session immediately (app was restarted)
    final currentUser = _authService.currentUser;
    if (currentUser != null) {
      state = AuthStateModel.authenticated(currentUser);
    } else {
      state = const AuthStateModel.unauthenticated();
    }

    // Subscribe to all future auth state changes from Supabase
    _authSubscription = _authService.authStateChanges.listen(
      (authState) {
        _handleAuthEvent(authState.event, authState.session?.user);
      },
      onError: (error) {
        state = AuthStateModel.error(error.toString());
      },
    );
  }

  void _handleAuthEvent(AuthChangeEvent event, User? user) {
    switch (event) {
      case AuthChangeEvent.signedIn:
      case AuthChangeEvent.tokenRefreshed:
      case AuthChangeEvent.userUpdated:
        if (user != null) {
          state = AuthStateModel.authenticated(user);
        }
        break;
      case AuthChangeEvent.signedOut:
      case AuthChangeEvent.userDeleted:
        state = const AuthStateModel.unauthenticated();
        break;
      default:
        break;
    }
  }

  Future<void> signUp({required String email, required String password}) async {
    state = const AuthStateModel.loading();
    try {
      final response = await _authService.signUp(
        email: email,
        password: password,
      );
      // If email confirmation is disabled in Supabase,
      // user is returned immediately. Otherwise it's null until confirmed.
      if (response.user != null) {
        state = AuthStateModel.authenticated(response.user!);
      } else {
        // Email confirmation pending — send user to check their inbox
        state = const AuthStateModel.unauthenticated();
      }
    } on AuthException catch (e) {
      state = AuthStateModel.error(e.message);
    } catch (e) {
      state = AuthStateModel.error('Something went wrong. Please try again.');
    }
  }

  Future<void> signIn({required String email, required String password}) async {
    state = const AuthStateModel.loading();
    try {
      final response = await _authService.signIn(
        email: email,
        password: password,
      );
      if (response.user != null) {
        state = AuthStateModel.authenticated(response.user!);
      } else {
        state = AuthStateModel.error('Login failed. Please try again.');
      }
    } on AuthException catch (e) {
      state = AuthStateModel.error(e.message);
    } catch (e) {
      state = AuthStateModel.error('Something went wrong. Please try again.');
    }
  }

  Future<void> signOut() async {
    state = const AuthStateModel.loading();
    try {
      await _authService.signOut();
      state = const AuthStateModel.unauthenticated();
    } catch (e) {
      state = AuthStateModel.error('Sign out failed. Please try again.');
    }
  }

  Future<void> resetPassword(String email) async {
    state = const AuthStateModel.loading();
    try {
      await _authService.resetPassword(email);
      state = const AuthStateModel.unauthenticated();
    } on AuthException catch (e) {
      state = AuthStateModel.error(e.message);
    } catch (e) {
      state = AuthStateModel.error('Something went wrong. Please try again.');
    }
  }

  @override
  void dispose() {
    _authSubscription?.cancel();
    super.dispose();
  }
}
