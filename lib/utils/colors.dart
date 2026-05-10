import 'package:flutter/material.dart';

Color adjustColor(Color color, {double amount = 0.1}) {
  final hsl = HSLColor.fromColor(color);
  final adjusted = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));
  return adjusted.toColor();
}
