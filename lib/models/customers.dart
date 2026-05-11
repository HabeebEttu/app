// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:app/models/category.dart';

class Customers {
  String id;
  String name;
  double balance;
  String location;
  Category category;
  Customers({
    required this.id,
    required this.name,
    required this.balance,
    required this.location,
    required this.category,
  });

  Customers copyWith({
    String? id,
    String? name,
    double? balance,
    String? location,
    Category? category,
  }) {
    return Customers(
      id: id ?? this.id,
      name: name ?? this.name,
      balance: balance ?? this.balance,
      location: location ?? this.location,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'balance': balance,
      'location': location,
      'category': category.name,
    };
  }

  factory Customers.fromMap(Map<String, dynamic> map) {
    return Customers(
      id: map['id'] as String,
      name: map['name'] as String,
      balance: map['balance'] as double,
      location: map['location'] as String,
      category: Category.values.byName(map['category'] as String),
    );
  }

  String toJson() => json.encode(toMap());

  factory Customers.fromJson(String source) => Customers.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Customers(id: $id, name: $name, balance: $balance, location: $location, category: $category)';
  }

  @override
  bool operator ==(covariant Customers other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.balance == balance &&
      other.location == location &&
      other.category == category;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      balance.hashCode ^
      location.hashCode ^
      category.hashCode;
  }
}
