import 'package:flutter/material.dart';

final lightTheme = ThemeData.from(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 21, 19, 158),
    brightness: Brightness.light,
    dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
    contrastLevel: .5,
  ),
);

final darkTheme = ThemeData.from(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 21, 19, 158),
    brightness: Brightness.dark,
    dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
    contrastLevel: -.5,
  ),
);
