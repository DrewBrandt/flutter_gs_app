import 'package:flutter/material.dart';
import 'package:flutter_gs_app/models/flight_computer_model.dart';
import 'package:flutter_gs_app/models/ground_station_model.dart';
import 'package:flutter_gs_app/views/common/color_picker.dart';
import 'battery_icon.dart';

class FlightComputerListScrollView extends StatefulWidget {
  final Map<FlightComputerModel, Relationship> fcList;
  final void Function(FlightComputerModel fc)? onTap;
  final void Function(FlightComputerModel fc)? onDelete;

  const FlightComputerListScrollView({
    super.key,
    required this.fcList,
    this.onTap,
    this.onDelete,
  });

  @override
  _FlightComputerListScrollViewState createState() =>
      _FlightComputerListScrollViewState();
}

class _FlightComputerListScrollViewState
    extends State<FlightComputerListScrollView> {
  late final ScrollController _sc;

  @override
  void initState() {
    super.initState();
    _sc = ScrollController();
  }

  @override
  void dispose() {
    _sc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Convert the map into a List of MapEntry so we can index it
    final entries = widget.fcList.entries.toList();
    return Scrollbar(
      controller: _sc,
      thumbVisibility: true,
      child: ListView.builder(
        controller: _sc,
        itemCount: entries.length,
        itemBuilder: (context, idx) {
          final entry = entries[idx];
          final fc = entry.key;
          final rel = entry.value;

          return Card(
            color: fc.color?.withAlpha(40),
            margin: const EdgeInsets.symmetric(vertical: 6),
            child: ListTile(
              onTap: () => widget.onTap?.call(fc),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 8,
              ),
              title: Text(
                fc.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('ID: ${fc.id}'),
              leading: ColorPickerButton(
                color: fc.color ?? Colors.black,
                onPickNewColor: (Color? c) => {},
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Tooltip(
                    message: '${fc.RSSI} dbm',
                    child: Icon(
                      Icons.signal_cellular_alt_rounded,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(width: 10),
                  BatteryIcon(level: fc.batteryLevel, isFC: true),
                  const SizedBox(width: 10),
                  _buildRelationshipIcon(rel),
                  const SizedBox(width: 10),
                  Tooltip(
                    message: 'Delete/Ignore this FC',
                    child: IconButton(
                      icon: Icon(
                        Icons.delete_outline_rounded,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () => widget.onDelete?.call(fc),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRelationshipIcon(Relationship rel) {
    switch (rel) {
      case Relationship.connected:
        return Tooltip(
          message: 'Connected',
          child: const Icon(Icons.check_circle, color: Colors.green),
        );
      case Relationship.tryConnect:
        return Tooltip(
          message: 'Connecting...',
          child: const Icon(Icons.radio_button_unchecked, color: Colors.grey),
        );
      case Relationship.doNotConnect:
        return Tooltip(
          message: 'Will not Connect',
          child: const Icon(Icons.block, color: Colors.red),
        );
    }
  }
}
