import 'package:flutter/material.dart';
import 'package:flutter_gs_app/notifiers/theme_provider.dart';
import 'package:flutter_gs_app/views/body/flight_page.dart';
import 'package:flutter_gs_app/views/body/post_flight_page.dart';
import 'package:flutter_gs_app/views/body/pre_flight/pre_flight_page.dart';
import 'package:flutter_gs_app/views/header_bar.dart';

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
      body: Stack(
        children: [
          Column(
            children: [
              HeaderBar(),
              const Divider(height: 1),
              Expanded(
                child: Row(
                  children: [
                    Container(
                      width: getAdjustedSizeFromContext(
                        context,
                        baseSize: 50,
                        maxSize: 70,
                      ),
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withAlpha(25),
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
          Positioned(
            top: 15,
            left: 25,
            child: Text(
              '${MediaQuery.of(context).size.width} x ${MediaQuery.of(context).size.height} | ${MediaQuery.of(context).size.aspectRatio.toStringAsFixed(2)}',
              style: TextStyle(color: Theme.of(context).colorScheme.onSecondaryContainer),
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
        iconSize: getAdjustedSizeFromContext(
          context,
          baseSize: 30,
          maxSize: 50,
        ),
        icon: Icon(icon),
        color:
            selected
                ? Theme.of(context).colorScheme.primary
                : Colors.grey.shade600,
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.transparent),
        ),
      ),
    );
  }
}
