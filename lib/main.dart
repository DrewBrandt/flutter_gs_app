import 'package:flutter/material.dart';
import 'screens/pre_flight_page.dart';
import 'screens/flight_page.dart';
import 'screens/post_flight_page.dart';

void main() {
  runApp(const RocketApp());
}

class RocketApp extends StatelessWidget {
  const RocketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rocket Ground Station',
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.light(
          primary: const Color(0xFF3B3B98), // dark purply blue
          secondary: const Color(0xFF6C63FF),
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const RocketHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RocketHomePage extends StatefulWidget {
  const RocketHomePage({super.key});

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
          const HeaderBar(),
          const Divider(height: 1),
          Expanded(
            child: Row(
              children: [
                Container(
                  width: 72,
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
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
                  child: _pages[_selectedIndex], // <-- This is correct usage
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
        color: selected ? Theme.of(context).colorScheme.primary : Colors.grey,
        onPressed: onPressed,
      ),
    );
  }
}

class HeaderBar extends StatelessWidget {
  const HeaderBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: const Text(
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
            children: const [
              _HeaderStat(
                icon: Icons.signal_cellular_alt,
                label: 'RSSI: -72 dBm',
                
              ),
              SizedBox(width: 20),
              _HeaderStat(icon: Icons.battery_full, label: 'Voltage: 11.7V', ),
              SizedBox(width: 20),
              _HeaderStat(icon: Icons.flight_takeoff, label: 'Stage: Boost'),
              SizedBox(width: 20),
              _HeaderStat(icon: Icons.trending_up, label: 'Alt: 152m'),
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
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.white)),
      ],
    );
  }
}
