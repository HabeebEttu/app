import 'package:app/models/customer.dart';
import 'package:app/providers/auth_providers.dart';
import 'package:app/service/customer_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final customerServiceProvider = Provider<CustomerService>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return CustomerService(client);
});

final customersStreamProvider = StreamProvider<List<Customer>>((ref) {
  return ref.watch(customerServiceProvider).streamCustomers();
});

final customersProvider = FutureProvider<List<Customer>>((ref) {
  return ref.watch(customerServiceProvider).getAllCustomers();
});
