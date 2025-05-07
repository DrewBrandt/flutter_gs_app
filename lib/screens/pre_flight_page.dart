import 'package:flutter/material.dart';

class PreFlightPage extends StatefulWidget {
  const PreFlightPage({super.key});

  @override
  State<PreFlightPage> createState() => _PreFlightPageState();
}

class _PreFlightPageState extends State<PreFlightPage> {
  String _connection = 'Not connected';
  double _battery = 0.89;
  int _rssi = -64;

  final _apogeeAltController = TextEditingController(text: '1200');
  final _mainAltController = TextEditingController(text: '300');
  final _chutesController = TextEditingController(text: '2');
  bool _useDrogue = true;

  final List<String> _availableConnections = [
    'USB: /dev/ttyUSB0',
    'BT: RocketFC-001',
    'BT: GroundStation-X',
  ];
  String? _selectedConnection;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // LEFT PANEL: Connection + Status
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sectionTitle('Connection'),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        DropdownButtonFormField<String>(
                          value: _selectedConnection,
                          hint: const Text('Select Connection'),
                          items:
                              _availableConnections.map((c) {
                                return DropdownMenuItem(
                                  value: c,
                                  child: Text(c),
                                );
                              }).toList(),
                          onChanged:
                              (val) =>
                                  setState(() => _selectedConnection = val),
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton(
                          onPressed: () {
                            setState(
                              () =>
                                  _connection =
                                      'Connected via ${_selectedConnection ?? '??'}',
                            );
                          },
                          child: const Text('Connect'),
                        ),
                        const SizedBox(height: 8),
                        Text('Status: $_connection'),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                _sectionTitle('Status'),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        _statusRow(
                          Icons.battery_full,
                          'Battery',
                          '${(_battery * 100).round()}%',
                        ),
                        const SizedBox(height: 8),
                        _statusRow(
                          Icons.network_cell,
                          'Signal',
                          'RSSI: $_rssi dBm',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 24),

          // MIDDLE PANEL: Flight Config
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sectionTitle('Flight Configuration'),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        _buildNumberField(
                          'Apogee Deploy Altitude (m)',
                          _apogeeAltController,
                        ),
                        _buildNumberField(
                          'Main Deploy Altitude (m)',
                          _mainAltController,
                        ),
                        _buildNumberField(
                          'Number of Parachutes',
                          _chutesController,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              value: _useDrogue,
                              onChanged:
                                  (val) =>
                                      setState(() => _useDrogue = val ?? false),
                            ),
                            const Text('Use Drogue Chute'),
                          ],
                        ),
                        const SizedBox(height: 12),
                        ElevatedButton.icon(
                          icon: const Icon(Icons.upload),
                          label: const Text('Upload Config'),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Configuration uploaded'),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 24),

          // RIGHT PANEL: Firmware Flash + Placeholder
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _sectionTitle('Firmware'),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.flash_on),
                      label: const Text('Flash Latest Firmware'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Flashing firmware...')),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                _sectionTitle('Logs / Output'),
                Card(
                  child: Container(
                    height: 150,
                    padding: const EdgeInsets.all(12),
                    child: const Text(
                      'TODO: Show connection logs or upload status here',
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
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(title, style: Theme.of(context).textTheme.titleLarge),
    );
  }

  Widget _statusRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 24),
        const SizedBox(width: 8),
        Text('$label: $value', style: const TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget _buildNumberField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
