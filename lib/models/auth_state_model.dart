import 'package:supabase_flutter/supabase_flutter.dart';

enum AuthStatus { initial, loading, authenticated, unauthenticated, error }

class AuthStateModel {
  final AuthStatus status;
  final User? user;
  final String? errorMessage;

  const AuthStateModel({
    this.status = AuthStatus.initial,
    this.user,
    this.errorMessage,
  });

  const AuthStateModel.initial()
    : status = AuthStatus.initial,
      user = null,
      errorMessage = null;

  const AuthStateModel.loading()
    : status = AuthStatus.loading,
      user = null,
      errorMessage = null;

  const AuthStateModel.authenticated(User user)
    : status = AuthStatus.authenticated,
      user = user,
      errorMessage = null;

  const AuthStateModel.unauthenticated()
    : status = AuthStatus.unauthenticated,
      user = null,
      errorMessage = null;

  const AuthStateModel.error(String message)
    : status = AuthStatus.error,
      user = null,
      errorMessage = message;

  bool get isLoading => status == AuthStatus.loading;
  bool get isAuthenticated => status == AuthStatus.authenticated;
  bool get hasError => status == AuthStatus.error;
}
