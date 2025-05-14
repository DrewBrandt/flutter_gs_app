import 'package:flutter/material.dart';
import 'config_view.dart'; // adjust path based on where you saved it

class PreFlightPage extends StatefulWidget {
  const PreFlightPage({super.key});

  @override
  State<PreFlightPage> createState() => _PreFlightPageState();
}

class _PreFlightPageState extends State<PreFlightPage>
    with TickerProviderStateMixin {
  final List<String> groundStations = ['GS Alpha', 'GS Beta'];
  String? selectedGS = 'GS Alpha';

  final Map<String, List<Map<String, dynamic>>> gsToFcs = {
    'GS Alpha': [
      {'name': 'FC-1', 'battery': 0.75, 'rssi': -60, 'state': 2},
      {'name': 'FC-2', 'battery': 0.90, 'rssi': -70, 'state': 1},
      {'name': 'FC-3', 'battery': 0.60, 'rssi': -80, 'state': 0},
    ],
    'GS Beta': [
      {'name': 'FC-4', 'battery': 0.85, 'rssi': -65, 'state': 2},
    ],
  };

  final List<Map<String, dynamic>> connectedFcs = [
    {'name': 'FC-1', 'battery': 0.75, 'rssi': -60, 'include': true},
    {'name': 'FC-4', 'battery': 0.85, 'rssi': -65, 'include': false},
  ];

  String selectedFcName = 'FC-1';
  late TabController _pyroTabController;
  late TabController _simTabController;

  @override
  void initState() {
    super.initState();
    _pyroTabController = TabController(length: 4, vsync: this);
    _simTabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Flash GS'),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: DropdownButtonFormField<String>(
                            value: selectedGS,
                            items:
                                groundStations
                                    .map(
                                      (gs) => DropdownMenuItem(
                                        value: gs,
                                        child: Text(gs),
                                      ),
                                    )
                                    .toList(),
                            onChanged:
                                (val) => setState(() => selectedGS = val),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Discovered FCs:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        ...(gsToFcs[selectedGS] ?? []).map(
                          (fc) => Card(
                            elevation: 2,
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            child: ListTile(
                              title: Text(fc['name']),
                              leading: const Icon(Icons.battery_full),
                              subtitle: Text(
                                'Battery: ${(fc['battery'] * 100).round()}%  |  RSSI: ${fc['rssi']} dBm',
                              ),
                              trailing: Icon(
                                [
                                  Icons.check_box_outline_blank,
                                  Icons.indeterminate_check_box,
                                  Icons.check_box,
                                ][fc['state']],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Connected FCs:',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        ...connectedFcs.map(
                          (fc) => Card(
                            elevation: 2,
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            child: ListTile(
                              title: Text(fc['name']),
                              subtitle: Text(
                                'Battery: ${(fc['battery'] * 100).round()}%  |  RSSI: ${fc['rssi']} dBm',
                              ),
                              leading: Checkbox(
                                value: fc['include'],
                                onChanged:
                                    (val) => setState(
                                      () => fc['include'] = val ?? false,
                                    ),
                              ),
                              trailing: const Icon(Icons.arrow_forward),
                              onTap:
                                  () => setState(
                                    () => selectedFcName = fc['name'],
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: 'FC Name',
                              hintText: selectedFcName,
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Icon(Icons.battery_full),
                        const Text(' 89%'),
                        const SizedBox(width: 12),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text('Flash'),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Center(child: Text('Connected via: GS Alpha')),
                const SizedBox(height: 12),
                Card(
                  child: Column(
                    children: [
                      TabBar(
                        controller: _pyroTabController,
                        labelColor: Theme.of(context).primaryColor,
                        tabs: const [
                          Tab(text: 'Apogee'),
                          Tab(text: 'Main'),
                          Tab(text: '3rd'),
                          Tab(text: '4th'),
                        ],
                      ),
                      SizedBox(
                        height: 600,
                        child: TabBarView(
                          controller: _pyroTabController,
                          children: List.generate(
                            4,
                            (index) => const LogicEditor(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Card(
                  child: Column(
                    children: [
                      TabBar(
                        controller: _simTabController,
                        labelColor: Theme.of(context).primaryColor,
                        tabs: const [
                          Tab(text: 'Sim Upload'),
                          Tab(text: 'Sim Graph'),
                        ],
                      ),
                      SizedBox(
                        height: 200,
                        child: TabBarView(
                          controller: _simTabController,
                          children: [
                            Center(
                              child: ElevatedButton(
                                onPressed: () {},
                                child: const Text('Upload Simulation'),
                              ),
                            ),
                            const Center(
                              child: Text('Graph will be shown here'),
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
        ],
      ),
    );
  }

  Widget _buildConditionEditor(int channelIndex) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Conditions for channel ${channelIndex + 1}:'),
          const SizedBox(height: 8),
          ...List.generate(3, (i) => Text('Condition ${i + 1} > Threshold')),
          const Spacer(),
          const Text('Logic: Condition 1 AND (Condition 2 OR Condition 3)'),
        ],
      ),
    );
  }
}
