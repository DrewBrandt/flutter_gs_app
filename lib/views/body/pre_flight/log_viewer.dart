// device_log_viewer.dart
import 'package:flutter/material.dart';
import 'package:flutter_gs_app/models/device_data.dart';
import 'dart:collection';

import 'package:flutter_gs_app/notifiers/ground_station_provider.dart';

// Device log entry
class DeviceLogEntry {
  final DeviceData device;
  final String message;
  final DateTime timestamp;

  DeviceLogEntry({
    required this.device,
    required this.message,
    required this.timestamp,
  });
}

// Centralized controller
class DeviceLogController extends ChangeNotifier {
  final List<DeviceLogEntry> _logs = [];
  Set<DeviceData> _filters = {};

  UnmodifiableListView<DeviceLogEntry> get logs => UnmodifiableListView(
    _filters.isEmpty ? _logs : _logs.where((e) => _filters.contains(e.device)),
  );

  void addLog(DeviceLogEntry entry) {
    _logs.add(entry);
    notifyListeners();
  }

  void clear() {
    _logs.clear();
    notifyListeners();
  }

  void setFilter(Set<DeviceData> devices) {
    _filters = devices;
    notifyListeners();
  }

  void clearFilter() {
    _filters.clear();
    notifyListeners();
  }
}

// Log display widget
class DeviceLogView extends StatelessWidget {
  final DeviceLogController controller;

  const DeviceLogView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final logs = controller.logs;
        return Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).disabledColor),
            borderRadius: BorderRadius.circular(8),
          ),
          child: SelectionArea(
            child: ListView.builder(
              itemCount: logs.length,

              reverse: false,
              itemBuilder: (context, index) {
                final log = logs[logs.length - index - 1];
                return Container(
                  color: log.device.color,
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  margin: const EdgeInsets.symmetric(vertical: 1).copyWith(right: 12),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(
                        context,
                      ).scaffoldBackgroundColor.withAlpha(180),
                    ),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text:
                                '${log.timestamp.toIso8601String().split("T").last.split(".").first} | ',
                          ),
                          TextSpan(
                            text: log.device.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: ': ${log.message}'),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}

// Sample usage widget with test button
class DeviceLogDemo extends StatefulWidget {
  const DeviceLogDemo({super.key});

  @override
  State<DeviceLogDemo> createState() => _DeviceLogDemoState();
}

class _DeviceLogDemoState extends State<DeviceLogDemo> {
  final DeviceData device1 =
      knownFCs.keys.firstWhere((fc) => fc.data.id == 102).data;
  final DeviceData device2 =
      knownFCs.keys.firstWhere((fc) => fc.data.id == 103).data;

  late final DeviceLogController _controller;

  @override
  void initState() {
    super.initState();
    _controller = DeviceLogController();
  }

  void _logTestMessage(DeviceData device) {
    _controller.addLog(
      DeviceLogEntry(
        device: device,
        message: 'Telemetry update received',
        timestamp: DateTime.now(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          runSpacing: 10,
          children: [
            ElevatedButton(
              onPressed: () => _logTestMessage(device1),
              child: const Text('Bravo'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () => _logTestMessage(device2),
              child: const Text('Charlie'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () => _controller.setFilter({device1}),
              child: const Text('Bravo Only'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () => _controller.clearFilter(),
              child: const Text('All'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Expanded(child: DeviceLogView(controller: _controller)),
      ],
    );
  }
}
