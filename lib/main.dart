import 'package:flutter/material.dart';
import 'package:flutter_gs_app/views/main_screen.dart';
import 'package:flutter_gs_app/views/theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: const RocketApp()));
}

class RocketApp extends StatefulWidget {
  const RocketApp({super.key});

  @override
  State<RocketApp> createState() => _RocketAppState();
}

class _RocketAppState extends State<RocketApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(darkTheme.colorScheme.toString());
    print(lightTheme.colorScheme.toString());
    return MaterialApp(
      title: 'Rocket Ground Station',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeMode,
      home: RocketHomePage(onToggleTheme: toggleTheme),
    );
  }
}