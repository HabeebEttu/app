// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Settings {
  Map<String, double> defaultPrices;
  bool isDarkMode;
  String userName;
  Settings({
    required this.defaultPrices,
    required this.isDarkMode,
    required this.userName,
  });

  Settings copyWith({
    Map<String, double>? defaultPrices,
    bool? isDarkMode,
    String? userName,
  }) {
    return Settings(
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

  factory Settings.fromMap(Map<String, dynamic> map) {
    return Settings(
      defaultPrices: Map<String, double>.from(
        (map['defaultPrices'] as Map<String, double>),
      ),
      isDarkMode: map['isDarkMode'] as bool,
      userName: map['userName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Settings.fromJson(String source) =>
      Settings.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Setting(defaultPrices: $defaultPrices, isDarkMode: $isDarkMode, userName: $userName)';

  @override
  bool operator ==(covariant Settings other) {
    if (identical(this, other)) return true;

    return mapEquals(other.defaultPrices, defaultPrices) &&
        other.isDarkMode == isDarkMode &&
        other.userName == userName;
  }

  @override
  int get hashCode =>
      defaultPrices.hashCode ^ isDarkMode.hashCode ^ userName.hashCode;
}
