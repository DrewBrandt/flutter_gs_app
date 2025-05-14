import 'package:flutter/material.dart';
import 'package:flutter_gs_app/models/flight_computer_model.dart';
import 'package:flutter_gs_app/models/ground_station_model.dart';
import 'battery_icon.dart';

class FlightComputerListView extends StatelessWidget {
  final Map<FlightComputerModel, Relationship> knownFCs;
  final void Function(FlightComputerModel fc)? onDelete;
  final void Function(FlightComputerModel fc)? onTap;

  const FlightComputerListView({
    super.key,
    required this.knownFCs,
    this.onDelete,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final fcList = knownFCs.entries.toList();

    return Column(
      children:
          fcList.map((entry) {
            final fc = entry.key;
            final rel = entry.value;
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 6),
              child: ListTile(
                onTap: () => onTap?.call(fc),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                title: Text(
                  fc.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('ID: ${fc.id}'),
                leading: BatteryIcon(level: fc.batteryLevel, isFC: true),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${fc.RSSI} dBm',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(width: 8),
                    _buildRelationshipIcon(rel),
                    IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () => onDelete?.call(fc),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
    );
  }

  Widget _buildRelationshipIcon(Relationship rel) {
    switch (rel) {
      case Relationship.connected:
        return const Icon(Icons.check_circle, color: Colors.green);
      case Relationship.tryConnect:
        return const Icon(Icons.radio_button_unchecked, color: Colors.grey);
      case Relationship.doNotConnect:
        return const Icon(Icons.block, color: Colors.red);
    }
  }
}
