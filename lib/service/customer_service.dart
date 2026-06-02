
import 'package:app/models/customer.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CustomerService {
  final SupabaseClient _client;

  CustomerService(this._client);

  String get _userId {
    final user = _client.auth.currentUser;
    if (user == null) throw Exception('User not authenticated');
    return user.id;
  }

  Future<Customer> createCustomer({
    required String name,
    required double balance,
    String? location,
    required String category,
  }) async {
    final response = await _client
        .from('customers')
        .insert({
          'user_id': _userId,
          'name': name,
          'location': location,
          'category': category,
          'balance': balance,
        })
        .select()
        .single();

    return Customer.fromMap(response);
  }

  Future<List<Customer>> getAllCustomers() async {
    final response = await _client
        .from('customers')
        .select()
        .eq('user_id', _userId)
        .order('name', ascending: true);

    return response.map((row) => Customer.fromMap(row)).toList();
  }

  Future<Customer> getCustomerById({required String id}) async {
    final response = await _client
        .from('customers')
        .select()
        .eq('id', id)
        .eq('user_id', _userId)
        .single();

    return Customer.fromMap(response);
  }

  Future<List<Customer>> searchCustomersByName({required String name}) async {
    final response = await _client
        .from('customers')
        .select()
        .eq('user_id', _userId)
        .ilike('name', '%$name%') 
        .order('name', ascending: true);

    return response.map((row) => Customer.fromMap(row)).toList();
  }

  Future<List<Customer>> getCustomersByCategory({
    required String category,
  }) async {
    final response = await _client
        .from('customers')
        .select()
        .eq('user_id', _userId)
        .eq('category', category)
        .order('name', ascending: true);

    return response.map((row) => Customer.fromMap(row)).toList();
  }

  // UPDATE — update any fields
  Future<Customer> updateCustomer({
    required String id,
    String? name,
    double? balance,
    String? location,
    String? category,
  }) async {
    // Only include fields that were actually passed
    final updates = <String, dynamic>{
      if (name != null) 'name': name,
      if (balance != null) 'balance': balance,
      if (location != null) 'location': location,
      if (category != null) 'category': category,
      'updated_at': DateTime.now().toIso8601String(),
    };

    final response = await _client
        .from('customers')
        .update(updates)
        .eq('id', id)
        .eq('user_id', _userId) // security: only update own records
        .select()
        .single();

    return Customer.fromMap(response);
  }

  // UPDATE — adjust balance specifically (common operation for your app)
  Future<Customer> updateBalance({
    required String id,
    required double newBalance,
  }) async {
    final response = await _client
        .from('customers')
        .update({
          'balance': newBalance,
          'updated_at': DateTime.now().toIso8601String(),
        })
        .eq('id', id)
        .eq('user_id', _userId)
        .select()
        .single();

    return Customer.fromMap(response);
  }

  // DELETE
  Future<void> deleteCustomer({required String id}) async {
    await _client
        .from('customers')
        .delete()
        .eq('id', id)
        .eq('user_id', _userId); // security: only delete own records
  }

  // STREAM — live updates (use with StreamProvider in Riverpod)
  Stream<List<Customer>> streamCustomers() {
    return _client
        .from('customers')
        .stream(primaryKey: ['id'])
        .eq('user_id', _userId)
        .order('name', ascending: true)
        .map((rows) => rows.map((row) => Customer.fromMap(row)).toList());
  }
}