import 'package:flutter/material.dart';
import 'package:flutter_gs_app/notifiers/flight_computer_notifier.dart';
import 'package:flutter_gs_app/screens/main_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math';
import 'dart:async';
import 'package:vector_math/vector_math.dart' as vm;


void main() {
  final container = ProviderContainer();
  startMockTelemetry(container);

  runApp(
    UncontrolledProviderScope(container: container, child: const RocketApp()),
  );
}


void startMockTelemetry(ProviderContainer container) {
  final rand = Random();
  final controller = container.read(flightComputerProvider.notifier);

  Timer.periodic(const Duration(seconds: 5), (_) {
    controller.updatePartial(
      position: vm.Vector3(0, 100 + rand.nextDouble() * 200, 0),
      battery: 0.5 + rand.nextDouble() * 0.5,
    );

    controller.updateFromData(
      container
          .read(flightComputerProvider)
          .copyWith(
            RSSI: (-90 + rand.nextInt(20)).toDouble(),
            stage: rand.nextInt(6),
            temperature: 20 + rand.nextDouble() * 10,
            hasGPSLock: rand.nextBool(),
          ),
    );
  });
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
    return MaterialApp(
      title: 'Rocket Ground Station',
      debugShowCheckedModeBanner: false,
      theme: _lightTheme,
      darkTheme: _darkTheme,
      themeMode: _themeMode,
      home: RocketHomePage(onToggleTheme: toggleTheme),
    );
  }
}

// Light theme
final _lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  primaryColor: const Color(0xFF000A4D),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF000A4D),
    secondary: Color(0xFFFF3B30),
    onPrimary: Colors.white,
    surface: Color(0xFFF2F2F2),
    onSurface: Colors.black,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF000A4D),
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  iconTheme: const IconThemeData(color: Colors.black87),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 16, color: Colors.black),
    labelLarge: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
    titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
  ),
  dividerColor: Colors.black54,
);

// Dark theme
final _darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF121212),
  primaryColor: const Color(0xFF000A4D),
  colorScheme: const ColorScheme.dark(
    primary: Color(0xFF000A4D),
    secondary: Color(0xFFFF3B30),
    onPrimary: Colors.white,
    surface: Color(0xFF1E1E1E),
    onSurface: Colors.white70,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFF000A4D),
    foregroundColor: Colors.white,
    elevation: 0,
  ),
  iconTheme: const IconThemeData(color: Colors.white70),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 16, color: Colors.white),
    labelLarge: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
    titleLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
  ),
  dividerColor: Colors.white24,

  // 👇 CUSTOMIZE INPUT DECORATION
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: const Color(0xFF1E1E1E),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade700),
      borderRadius: BorderRadius.circular(8),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey.shade700),
      borderRadius: BorderRadius.circular(8),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFF6C63FF), width: 2),
      borderRadius: BorderRadius.circular(8),
    ),
    labelStyle: const TextStyle(color: Colors.white70),
    hintStyle: const TextStyle(color: Colors.white38),
  ),

  cardTheme: const CardTheme(
    color: Color(0xFF1E1E1E),
    elevation: 2,
    shape: RoundedRectangleBorder(
      side: BorderSide(color: Color(0xFF2C2C2C)),
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
  ),
);




