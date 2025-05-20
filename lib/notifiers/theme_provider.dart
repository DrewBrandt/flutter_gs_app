import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const double minIconSize = 22.0;
const double maxIconSize = 30.0;
const double baseWidth = 1280.0;
const double maxWidth = 2560.0;

final themeProvider = NotifierProvider<ThemeNotifier, ThemeMode>(
  () => ThemeNotifier(),
);

double getAdjustedSize(
  double screenWidth, {
  required double baseSize,
  required double maxSize,
  double baseWidth = 1280,
  double maxWidth = 2560,
  double ratioMultiplier = 1.0, // >1 = slower curve, <1 = faster
}) {
  if (screenWidth <= baseWidth) return baseSize;
  if (screenWidth >= maxWidth) return maxSize;

  final normalized = (screenWidth - baseWidth) / (maxWidth - baseWidth);
  final curved = pow(normalized, ratioMultiplier).toDouble();
  final interpolated = baseSize + (maxSize - baseSize) * curved;

  return interpolated;
}

double getAdjustedSizeFromContext(
  BuildContext context, {
  required double baseSize,
  required double maxSize,
  double ratioMultiplier = 1,
}) {
  return getAdjustedSize(MediaQuery.of(context).size.width, baseSize: baseSize, maxSize: maxSize, ratioMultiplier: ratioMultiplier);
}


class ThemeNotifier extends Notifier<ThemeMode> {
  @override
  ThemeMode build() => ThemeMode.dark;

  void toggleTheme() {
    state = state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}
