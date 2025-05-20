import 'package:flutter/material.dart';

final baseSeed = const Color(0xFF15139E);

final schemeLight = ColorScheme.fromSeed(
  seedColor: baseSeed,
  brightness: Brightness.light,
  dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
  contrastLevel: 0.5,
);

final schemeDark = ColorScheme.fromSeed(
  seedColor: baseSeed,
  brightness: Brightness.dark,
  dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
  contrastLevel: -0.5,
);

final lightTheme = ThemeData.from(colorScheme: schemeLight).copyWith(
  iconTheme: IconThemeData(size: 30, color: schemeLight.primary),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(schemeLight.surfaceContainer),
    ),
  ),
);

final darkTheme = ThemeData.from(colorScheme: schemeDark).copyWith(
  iconTheme: IconThemeData(size: 30, color: schemeDark.primary),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(schemeDark.surfaceContainer),

    ),
  ),
);
