import 'package:flutter/material.dart';

class PreFlightPage extends StatefulWidget {
  const PreFlightPage({super.key});

  @override
  State<PreFlightPage> createState() => _PreFlightPageState();
}

class GroundStation {
  final String name;
  final List<FlightComputer> connectedFCs;
  final bool isConnected;

  GroundStation({
    required this.name,
    required this.connectedFCs,
    this.isConnected = false,
  });
}

class FlightComputer {
  final String name;
  final double batteryLevel;
  final int rssi;
  final bool isConnected;

  FlightComputer({
    required this.name,
    this.batteryLevel = 1.0,
    this.rssi = -50,
    this.isConnected = false,
  });
}

class _PreFlightPageState extends State<PreFlightPage> {
  final List<GroundStation> groundStations = [
    GroundStation(
      name: 'BT: GroundStation-X',
      isConnected: true,
      connectedFCs: [
        FlightComputer(name: 'BT: RocketFC-001', batteryLevel: 0.89, rssi: -64),
        FlightComputer(name: 'USB: /dev/ttyUSB0', batteryLevel: 0.92, rssi: -70),
      ],
    ),
  ];

  GroundStation? _selectedGS;
  FlightComputer? _selectedFC;

  final _apogeeAltController = TextEditingController(text: '1200');
  final _mainAltController = TextEditingController(text: '300');
  final _chutesController = TextEditingController(text: '2');
  bool _useDrogue = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // LEFT PANEL: GS
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _sectionTitle('Ground Station'),
                DropdownButtonFormField<GroundStation>(
                  value: _selectedGS,
                  hint: const Text('Select GS'),
                  items: groundStations.map((gs) {
                    return DropdownMenuItem(
                      value: gs,
                      child: Text(gs.name),
                    );
                  }).toList(),
                  onChanged: (gs) => setState(() {
                    _selectedGS = gs;
                    _selectedFC = null;
                  }),
                ),
                const SizedBox(height: 12),
                Text('Status: ${_selectedGS?.isConnected == true ? 'Connected' : 'Disconnected'}'),
                const SizedBox(height: 12),
                const Text('Available FCs:'),
                if (_selectedGS != null)
                  ..._selectedGS!.connectedFCs.map((fc) => ListTile(
                        title: Text(fc.name),
                        subtitle: Text('Battery: ${(fc.batteryLevel * 100).round()}%'),
                        onTap: () => setState(() => _selectedFC = fc),
                        selected: _selectedFC == fc,
                      )),
              ],
            ),
          ),

          const SizedBox(width: 24),

          // RIGHT PANEL: FC
          Expanded(
            flex: 3,
            child: _selectedFC == null
                ? const Center(child: Text('Select a Flight Computer'))
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _sectionTitle('Flight Computer: ${_selectedFC!.name}'),
                      _statusRow(Icons.battery_full, 'Battery', '${(_selectedFC!.batteryLevel * 100).round()}%'),
                      _statusRow(Icons.network_cell, 'Signal', 'RSSI: ${_selectedFC!.rssi} dBm'),
                      const SizedBox(height: 16),
                      _sectionTitle('Flight Configuration'),
                      _buildNumberField('Apogee Deploy Altitude (m)', _apogeeAltController),
                      _buildNumberField('Main Deploy Altitude (m)', _mainAltController),
                      _buildNumberField('Number of Parachutes', _chutesController),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: _useDrogue,
                            onChanged: (val) => setState(() => _useDrogue = val ?? false),
                          ),
                          const Text('Use Drogue Chute'),
                        ],
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.upload),
                        label: const Text('Upload Config'),
                        onPressed: _uploadConfig,
                      ),
                      const SizedBox(height: 24),
                      _sectionTitle('Firmware'),
                      ElevatedButton.icon(
                        icon: const Icon(Icons.flash_on),
                        label: const Text('Flash Latest Firmware'),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
                        onPressed: _flashFirmware,
                      ),
                      const SizedBox(height: 24),
                      _sectionTitle('Logs / Output'),
                      Card(
                        child: Container(
                          height: 150,
                          padding: const EdgeInsets.all(12),
                          child: const Text('TODO: Show connection logs or upload status here'),
                        ),
                      ),
                    ],
                  ),
          ),
        ],
      ),
    );
  }

  void _uploadConfig() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Configuration uploaded')),
    );
  }

  void _flashFirmware() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Flashing firmware...')),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(title, style: Theme.of(context).textTheme.titleLarge),
    );
  }

  Widget _statusRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 24),
          const SizedBox(width: 8),
          Text('$label: $value', style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget _buildNumberField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: SizedBox(
        width: 300,
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: label,
            border: const OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}