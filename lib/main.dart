import 'package:flutter/material.dart';
import 'screens/pre_flight_page.dart';
import 'screens/flight_page.dart';
import 'screens/post_flight_page.dart';

void main() {
  runApp(const RocketApp());
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
    titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
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



class RocketHomePage extends StatefulWidget {
  final VoidCallback onToggleTheme;

  const RocketHomePage({super.key, required this.onToggleTheme});

  @override
  State<RocketHomePage> createState() => _RocketHomePageState();
}

class _RocketHomePageState extends State<RocketHomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    PreFlightPage(),
    FlightPage(),
    PostFlightPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderBar(onToggleTheme: widget.onToggleTheme),
          const Divider(height: 1),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 72,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  child: Column(
                    children: [
                      MenuButton(
                        icon: Icons.settings,
                        selected: _selectedIndex == 0,
                        onPressed: () => setState(() => _selectedIndex = 0),
                      ),
                      MenuButton(
                        icon: Icons.rocket_launch_rounded,
                        selected: _selectedIndex == 1,
                        onPressed: () => setState(() => _selectedIndex = 1),
                      ),
                      MenuButton(
                        icon: Icons.download,
                        selected: _selectedIndex == 2,
                        onPressed: () => setState(() => _selectedIndex = 2),
                      ),
                    ],
                  ),
                ),
                const VerticalDivider(thickness: 1, width: 1),
                Expanded(
                  child: _pages[_selectedIndex],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final VoidCallback onPressed;

  const MenuButton({
    super.key,
    required this.icon,
    required this.selected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
        iconSize: 50,
        icon: Icon(icon),
        color: selected
            ? Theme.of(context).colorScheme.primary
            : Colors.grey.shade600,
        onPressed: onPressed,
      ),
    );
  }
}

class HeaderBar extends StatelessWidget {
  final VoidCallback onToggleTheme;

  const HeaderBar({super.key, required this.onToggleTheme});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Theme.of(context).colorScheme.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Center(
              child: Text(
                'Flight: Test Flight 001',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: Icon(
                  isDark ? Icons.wb_sunny_outlined : Icons.nightlight_round,
                  color: Colors.white,
                ),
                tooltip: 'Toggle Theme',
                onPressed: onToggleTheme,
              ),
              const SizedBox(width: 20),
              const _HeaderStat(
                icon: Icons.signal_cellular_alt,
                label: 'RSSI: -72 dBm',
              ),
              const SizedBox(width: 20),
              const _HeaderStat(
                icon: Icons.battery_full,
                label: 'Voltage: 11.7V',
              ),
              const SizedBox(width: 20),
              const _HeaderStat(
                icon: Icons.flight_takeoff,
                label: 'Stage: Boost',
              ),
              const SizedBox(width: 20),
              const _HeaderStat(
                icon: Icons.trending_up,
                label: 'Alt: 152m',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HeaderStat extends StatelessWidget {
  final IconData icon;
  final String label;

  const _HeaderStat({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.white),
        const SizedBox(width: 4),
        Text(
          label,
          style: const TextStyle(fontSize: 14, color: Colors.white),
        ),
      ],
    );
  }
}
