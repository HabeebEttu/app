import 'package:supabase_flutter/supabase_flutter.dart';

class UserService {
  final SupabaseClient _client;
  UserService(this._client);
  User? get currentUser => _client.auth.currentUser;

  Future<User> createUser({
    String username = '',
    required String email,
    String? userId,
  }) async {
    final response = await _client
        .from('users')
        .insert({'userId': userId, 'username': username, 'email': email})
        .select()
        .single();
    return User.fromJson(response)!;
  }
}
