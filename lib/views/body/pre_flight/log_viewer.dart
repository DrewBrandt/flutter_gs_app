// device_log_viewer.dart
import 'package:flutter/material.dart';
import 'dart:collection';

// Mocked DeviceData model
class DeviceData {
  final int id;
  String name;
  Color color;

  DeviceData({required this.id, required this.name, required this.color});

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is DeviceData && other.id == id);

  @override
  int get hashCode => id.hashCode;
}

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
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ListView.builder(
            itemCount: logs.length,
            reverse: false,
            itemBuilder: (context, index) {
              final log = logs[index];
              return Container(
                margin: const EdgeInsets.symmetric(vertical: 2),
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  color: log.device.color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  '[${log.timestamp.toIso8601String().split("T").last.split(".").first}] '
                  '${log.device.name}: ${log.message}',
                ),
              );
            },
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
  final DeviceData device1 = DeviceData(
    id: 1,
    name: 'Falcon Alpha',
    color: Colors.amber,
  );
  final DeviceData device2 = DeviceData(
    id: 2,
    name: 'Bravo Node',
    color: Colors.lightBlue,
  );
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
        Row(
          children: [
            ElevatedButton(
              onPressed: () => _logTestMessage(device1),
              child: const Text('Log Falcon'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () => _logTestMessage(device2),
              child: const Text('Log Bravo'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () => _controller.setFilter({device1}),
              child: const Text('Filter Falcon'),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: () => _controller.clearFilter(),
              child: const Text('Clear Filter'),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Expanded(child: DeviceLogView(controller: _controller)),
      ],
    );
  }
}
