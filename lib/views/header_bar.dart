import 'package:flutter/material.dart';
import 'package:flutter_gs_app/notifiers/theme_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HeaderBar extends ConsumerWidget {

  const HeaderBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: getAdjustedSizeFromContext(context, baseSize: 50, maxSize: 70),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      color: isDark ? Theme.of(context).colorScheme.onPrimary: Theme.of(context).colorScheme.primary,
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
                  isDark ? Icons.light_mode_outlined : Icons.nightlight_round,
                  color: Colors.white,
                ),
                tooltip: 'Toggle Theme',
                onPressed: ref.read(themeProvider.notifier).toggleTheme,
                style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.onPrimaryContainer.withAlpha(50))),
              ),
              const SizedBox(width: 20),
              _HeaderStat(
                icon: Icons.signal_cellular_alt,
                label: 'RSSI: ${0} dBm',
              ),
              const SizedBox(width: 20),
              _HeaderStat(
                icon: Icons.battery_full,
                label:
                    'Battery: ${0}%',
              ),
              const SizedBox(width: 20),
              _HeaderStat(
                icon: Icons.flight_takeoff,
                label: 'Stage: ${_stageName(0)}',
              ),
              const SizedBox(width: 20),
              _HeaderStat(
                icon: Icons.trending_up,
                label: 'Alt: ${0} m',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String _stageName(int stage) {
  switch (stage) {
    case 0:
      return 'Pad';
    case 1:
      return 'Boost';
    case 2:
      return 'Coast';
    case 3:
      return 'Drogue';
    case 4:
      return 'Main';
    case 5:
      return 'Landed';
    default:
      return 'Unknown';
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