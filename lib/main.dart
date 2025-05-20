import 'package:flutter/material.dart';
import 'package:flutter_gs_app/notifiers/theme_provider.dart';
import 'package:flutter_gs_app/views/main_screen.dart';
import 'package:flutter_gs_app/views/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: RocketApp()));
}

class RocketApp extends ConsumerWidget {
  const RocketApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final iconSize = getAdjustedSize(
      screenWidth,
      baseSize: minIconSize,
      maxSize: maxIconSize,
    );
    final titleSize = getAdjustedSize(
      screenWidth,
      baseSize: 20,
      maxSize: 28,
      ratioMultiplier: 1.2
    );

    final light = lightTheme.copyWith(
      iconTheme: lightTheme.iconTheme.copyWith(size: iconSize),
      textTheme: lightTheme.textTheme.copyWith(
        titleLarge: lightTheme.textTheme.titleLarge?.copyWith(
          fontSize: titleSize,
        ),
      ),
    );
    final dark = darkTheme.copyWith(
      iconTheme: darkTheme.iconTheme.copyWith(size: iconSize),
      textTheme: darkTheme.textTheme.copyWith(
        titleLarge: darkTheme.textTheme.titleLarge?.copyWith(
          fontSize: titleSize,
        ),
      ),
    );

    return MaterialApp(
      title: 'Rocket Ground Station',
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: light,
      darkTheme: dark,
      home: RocketHomePage(),
    );
  }
}
