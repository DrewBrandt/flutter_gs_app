import 'package:flutter/material.dart';

class FlightPage extends StatelessWidget {
  const FlightPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          // Left: Rocket SVG / Animation area
          Expanded(
            flex: 2,
            child: Column(
              children: [
                _sectionTitle('Rocket View', theme),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: theme.dividerColor),
                      borderRadius: BorderRadius.circular(12),
                      color: theme.colorScheme.surface,
                    ),
                    child: const Center(child: Text('🚀 Placeholder SVG')),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 24),

          // Center: Altitude / Speed / Stage + Map
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Row(
                  children: [
                    _infoCard('Altitude', '1,527 m', Icons.trending_up, theme),
                    const SizedBox(width: 12),
                    _infoCard('Speed', '246 m/s', Icons.speed, theme),
                    const SizedBox(width: 12),
                    _infoCard('Stage', 'Coast', Icons.flag, theme),
                  ],
                ),
                const SizedBox(height: 24),
                _sectionTitle('Flight Data', theme),
                DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      TabBar(
                        labelColor: theme.colorScheme.primary,
                        unselectedLabelColor: Colors.black54,
                        indicatorColor: theme.colorScheme.primary,
                        tabs: const [
                          Tab(text: 'Map'),
                          Tab(text: 'Altitude/Speed'),
                        ],
                      ),
                      SizedBox(
                        height: 500,
                        child: TabBarView(
                          children: [
                            // Fake map
                            Container(
                              color: theme.colorScheme.surface,
                              child: const Center(
                                child: Text('🗺️ Fake map with path trace'),
                              ),
                            ),
                            // Fake Alt graph
                            Container(
                              color: theme.colorScheme.surface,
                              child: const Center(
                                child: Text('📈 Altitude/Speed vs Time Graph'),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 24),

          // Right: Extra Telemetry
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sectionTitle('Extra Telemetry', theme),
                Card(
                  color: theme.colorScheme.surface,
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        _TelemetryRow('Max Altitude', '1,620 m'),
                        _TelemetryRow('Max Speed', '415 m/s'),
                        _TelemetryRow('Max Acceleration', '235.4 m/s²'),
                        _TelemetryRow('Heading', '242°'),
                        _TelemetryRow('GPS Lock', 'Yes'),
                        _TelemetryRow('Temperature', '24.7 °C'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: theme.textTheme.titleLarge,
      ),
    );
  }

  Widget _infoCard(String label, String value, IconData icon, ThemeData theme) {
    return Expanded(
      child: Card(
        color: theme.colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(icon, size: 30, color: theme.colorScheme.primary),
              const SizedBox(height: 8),
              Text(
                value,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(label, style: const TextStyle(fontSize: 14)),
            ],
          ),
        ),
      ),
    );
  }
}

class _TelemetryRow extends StatelessWidget {
  final String label;
  final String value;

  const _TelemetryRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: theme.textTheme.bodyMedium),
          Text(
            value,
            style: theme.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
