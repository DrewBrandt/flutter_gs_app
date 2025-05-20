import 'package:flutter/material.dart';
import 'package:flutter_gs_app/views/body/flight_page.dart';
import 'package:flutter_gs_app/views/body/post_flight_page.dart';
import 'package:flutter_gs_app/views/body/pre_flight/pre_flight_page.dart';
import 'package:flutter_gs_app/views/header_bar.dart';

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
                Expanded(child: _pages[_selectedIndex]),
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
        color:
            selected
                ? Theme.of(context).colorScheme.primary
                : Colors.grey.shade600,
        onPressed: onPressed,
        style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.transparent)),
      ),
    );
  }
}
