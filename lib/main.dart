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

    final fontSizeDelta = getAdjustedSize(screenWidth, baseSize: 0.8, maxSize: 1.15);

    return MaterialApp(
      title: 'Rocket Ground Station',
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: lightTheme.copyWith(
        iconTheme: lightTheme.iconTheme.copyWith(size: iconSize),
      ),
      darkTheme: darkTheme.copyWith(
        iconTheme: darkTheme.iconTheme.copyWith(size: iconSize),
      ),
      home: Builder(
        builder: (context) {
          return Theme(
            data: Theme.of(context).copyWith(
              textTheme: Theme.of(
                context,
              ).textTheme.apply(fontSizeFactor: fontSizeDelta, fontSizeDelta: 0),
            ),
            child: RocketHomePage(),
          );
        }
      ),
    );
  }
}
