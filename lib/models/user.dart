// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:app/models/customers.dart';
import 'package:app/models/setting.dart';

class User {
  String id;
  String fireStoreId;
  String name;
  String email;
  Setting settings;
  Customers customers;
  User({
    required this.id,
    required this.fireStoreId,
    required this.name,
    required this.email,
    required this.settings,
    required this.customers,
  });

  User copyWith({
    String? id,
    String? fireStoreId,
    String? name,
    String? email,
    Setting? settings,
    Customers? customers,
  }) {
    return User(
      id: id ?? this.id,
      fireStoreId: fireStoreId ?? this.fireStoreId,
      name: name ?? this.name,
      email: email ?? this.email,
      settings: settings ?? this.settings,
      customers: customers ?? this.customers,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fireStoreId': fireStoreId,
      'name': name,
      'email': email,
      'settings': settings.toMap(),
      'customers': customers.toMap(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      fireStoreId: map['fireStoreId'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      settings: Setting.fromMap(map['settings'] as Map<String,dynamic>),
      customers: Customers.fromMap(map['customers'] as Map<String,dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, fireStoreId: $fireStoreId, name: $name, email: $email, settings: $settings, customers: $customers)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.fireStoreId == fireStoreId &&
      other.name == name &&
      other.email == email &&
      other.settings == settings &&
      other.customers == customers;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      fireStoreId.hashCode ^
      name.hashCode ^
      email.hashCode ^
      settings.hashCode ^
      customers.hashCode;
  }
}
