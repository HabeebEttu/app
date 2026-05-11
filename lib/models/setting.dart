// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Setting {
  Map<String, double> defaultPrices;
  bool isDarkMode;
  String userName;
  Setting({
    required this.defaultPrices,
    required this.isDarkMode,
    required this.userName,
  });

  Setting copyWith({
    Map<String, double>? defaultPrices,
    bool? isDarkMode,
    String? userName,
  }) {
    return Setting(
      defaultPrices: defaultPrices ?? this.defaultPrices,
      isDarkMode: isDarkMode ?? this.isDarkMode,
      userName: userName ?? this.userName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'defaultPrices': defaultPrices,
      'isDarkMode': isDarkMode,
      'userName': userName,
    };
  }

  factory Setting.fromMap(Map<String, dynamic> map) {
    return Setting(
      defaultPrices: Map<String, double>.from((map['defaultPrices'] as Map<String, double>)),
      isDarkMode: map['isDarkMode'] as bool,
      userName: map['userName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Setting.fromJson(String source) => Setting.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Setting(defaultPrices: $defaultPrices, isDarkMode: $isDarkMode, userName: $userName)';

  @override
  bool operator ==(covariant Setting other) {
    if (identical(this, other)) return true;
  
    return 
      mapEquals(other.defaultPrices, defaultPrices) &&
      other.isDarkMode == isDarkMode &&
      other.userName == userName;
  }

  @override
  int get hashCode => defaultPrices.hashCode ^ isDarkMode.hashCode ^ userName.hashCode;
}
