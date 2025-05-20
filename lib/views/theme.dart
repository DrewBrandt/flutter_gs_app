import 'package:flutter/material.dart';
import 'package:flutter_gs_app/notifiers/theme_provider.dart';

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
  iconTheme: IconThemeData(size: minIconSize, color: schemeLight.primary),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(schemeLight.surfaceContainer),
    ),
  ),
);

final darkTheme = ThemeData.from(colorScheme: schemeDark).copyWith(
  iconTheme: IconThemeData(size: minIconSize, color: schemeDark.primary),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(schemeDark.surfaceContainer),

    ),
  ),
);
