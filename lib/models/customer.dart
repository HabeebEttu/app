class Customer {
  final String id;
  final String userId;
  final String name;
  final double balance;
  final String? location;
  final String category;
  final DateTime createdAt;
  final DateTime? updatedAt;

  const Customer({
    required this.id,
    required this.userId,
    required this.name,
    required this.balance,
    this.location,
    required this.category,
    required this.createdAt,
    this.updatedAt,
  });

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      id: map['id'] as String,
      userId: map['user_id'] as String,
      name: map['name'] as String,
      balance: (map['balance'] as num).toDouble(),
      location: map['location'] as String?,
      category: map['category'] as String,
      createdAt: DateTime.parse(map['created_at'] as String),
      updatedAt: map['updated_at'] != null
          ? DateTime.parse(map['updated_at'] as String)
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'name': name,
      'balance': balance,
      'location': location,
      'category': category,
    };
  }

  // Useful for local updates without a round trip
  Customer copyWith({
    String? name,
    double? balance,
    String? location,
    String? category,
  }) {
    return Customer(
      id: id,
      userId: userId,
      name: name ?? this.name,
      balance: balance ?? this.balance,
      location: location ?? this.location,
      category: category ?? this.category,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
    );
  }
}
