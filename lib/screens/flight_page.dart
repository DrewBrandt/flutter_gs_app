import 'package:flutter/material.dart';

class FlightPage extends StatelessWidget {
  const FlightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          // Left: Rocket SVG / Animation area
          Expanded(
            flex: 2,
            child: Column(
              children: [
                _sectionTitle('Rocket View'),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey.shade100,
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
                    _infoCard('Altitude', '1,527 m', Icons.trending_up),
                    const SizedBox(width: 12),
                    _infoCard('Speed', '246 m/s', Icons.speed),
                    const SizedBox(width: 12),
                    _infoCard('Stage', 'Coast', Icons.flag),
                  ],
                ),
                const SizedBox(height: 24),
                _sectionTitle('Flight Data'),
                DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      const TabBar(
                        labelColor: Colors.blue,
                        unselectedLabelColor: Colors.black54,
                        indicatorColor: Colors.blue,
                        tabs: [
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
                              color: Colors.grey.shade200,
                              child: const Center(
                                child: Text('🗺️ Fake map with path trace'),
                              ),
                            ),
                            // Fake Alt graph
                            Container(
                              color: Colors.grey.shade100,
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
                _sectionTitle('Extra Telemetry'),
                Card(
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

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _infoCard(String label, String value, IconData icon) {
    return Expanded(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(icon, size: 30, color: Colors.blue),
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
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16)),
          Text(
            value,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
