import 'package:flutter/material.dart';
import 'package:flutter_gs_app/models/device_data.dart';
import 'package:flutter_gs_app/models/flight_computer_model.dart';
import 'package:flutter_gs_app/models/ground_station_model.dart';
import 'package:flutter_gs_app/views/common/color_picker.dart';
import 'package:flutter_gs_app/views/common/conn_icon.dart';
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
          final isNotCon = fc.data.conStatus == ConStatus.noCon;
          return rel == Relationship.hidden
              ? null
              : Tooltip(
                message: isNotCon ? 'Offline' : '',
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 100),
                  child: Card(
                    color: fc.data.color?.withAlpha(150),
                    margin: EdgeInsets.all(6),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Card(
                            elevation: 0,
                            child: _buildFlightComputerTile(
                              fc: fc,
                              rel: rel,
                              disabled: false,
                            ),
                          ),
                        ),
                        if (isNotCon)
                          Card(
                            elevation: 0,
                            margin: EdgeInsets.all(0),
                            color: Theme.of(
                              context,
                            ).colorScheme.surfaceContainerLowest.withAlpha(130),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Card(
                                elevation: 0,
                                color: Colors.transparent,
                                child: _buildFlightComputerTile(
                                  fc: fc,
                                  rel: rel,
                                  disabled: true,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              );
        },
      ),
    );
  }

  Widget _buildFlightComputerTile({
    required FlightComputerModel fc,
    required Relationship rel,
    required bool disabled,
  }) {
    return ListTile(
      onTap: disabled ? null : () => widget.onTap?.call(fc),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      minVerticalPadding: 0,
      minLeadingWidth: 0,
      title: Text(
        disabled ? '' : fc.data.name,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        disabled ? '' : 'ID: ${fc.data.id}',
        style: Theme.of(context).textTheme.bodySmall,
      ),
      leading: ColorPickerButton(
        color: fc.data.color ?? Colors.black,
        onPickNewColor: (_) {}, // disabled anyway
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!disabled) ConnIcon(data: fc.data),
          if (!disabled) const SizedBox(width: 10),
          if (!disabled) BatteryIcon(data: fc.data),
          if (!disabled) const SizedBox(width: 10),
          if (!disabled) _buildRelationshipIcon(rel),
          if (!disabled) const SizedBox(width: 10),
          Tooltip(
            message: 'Delete/Ignore this FC',
            child: IconButton(
              icon: Icon(
                Icons.delete_outline_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
              style: Theme.of(context).iconButtonTheme.style,
              onPressed: () => widget.onDelete?.call(fc),
            ),
          ),
        ],
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
      default:
        return Tooltip(
          message: 'You shouldn\'t see this',
          child: const Icon(Icons.block, color: Colors.red),
        );
    }
  }
}
