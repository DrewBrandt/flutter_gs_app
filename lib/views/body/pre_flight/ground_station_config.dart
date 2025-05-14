import 'package:flutter/material.dart';
import 'package:flutter_gs_app/notifiers/ground_station_provider.dart';
import 'package:flutter_gs_app/views/common/battery_icon.dart';
import 'package:flutter_gs_app/views/common/decorated_dropdown.dart';
import 'package:flutter_gs_app/views/common/title_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroundStationConfig extends ConsumerWidget {
  const GroundStationConfig({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedId = ref.watch(activeGroundStationIdProvider);
    final gs = ref.watch(activeGroundStationProvider);
    final allGSs = ref.watch(groundStationListProvider);

    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Column(
            children: [
              TitleText(title: 'Ground Stations', theme: theme),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: 300),
                    child: LabeledDropdown<int>(
                      label: 'Select Ground Station',
                      value: selectedId,
                      items:
                          allGSs.map((gs) {
                            return DropdownMenuItem<int>(
                              value: gs.id,
                              child: Tooltip(
                                message: gs.isConnected ? '' : 'Connect',
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(gs.name, style: TextStyle(color: gs.isConnected ? null  : theme.colorScheme.primaryFixed,),),
                                    Expanded(child: Container()),
                                    Tooltip(
                                      message:
                                          !gs.isConnected
                                              ? ''
                                              : gs.conViaUSB
                                              ? 'Connected via USB'
                                              : 'Connected via Bluetooth',
                                      child: Icon(
                                        gs.conViaUSB
                                            ? Icons.usb
                                            : Icons.bluetooth_audio_rounded,
                                        color:
                                            gs.isConnected
                                                ? null
                                                : theme.disabledColor,
                                      ),
                                    ),
                                    gs.isConnected
                                        ? BatteryIcon(
                                          level: gs.batteryLevel,
                                          isFC: false,
                                        )
                                        : Tooltip(
                                          message: '',
                                          child: Icon(
                                            Icons.battery_0_bar,
                                            color: theme.disabledColor,
                                          ),
                                        ),
                                  ],
                                ),
                              ),
                            );
                          }).toList(),
                      onChanged: (id) {
                        ref
                            .read(activeGroundStationIdProvider.notifier)
                            .setActive(id);
                      },
                    ),
                  ),

                  Expanded(child: Container()),
                  Card(
                    elevation: 0,
                    shadowColor: Colors.white54,
                    color: theme.colorScheme.surface,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () => {},
                            icon: Icon(
                              Icons.edit,
                              color: theme.primaryColor,
                            ), // TODO, change to text field icon
                            tooltip: 'Rename',
                            style: ButtonStyle(
                              elevation: WidgetStatePropertyAll(3.0),
                              shadowColor: WidgetStatePropertyAll(Colors.black),
                              backgroundColor: WidgetStatePropertyAll(
                                Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 8),
                          Tooltip(
                            message:
                                gs != null && gs.conViaUSB
                                    ? ''
                                    : 'Connect via USB to upload firmware.',
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                  Colors.white,
                                ),
                              ),
                              onPressed:
                                  gs != null && gs.conViaUSB
                                      ? () {
                                        ScaffoldMessenger.of(
                                          context,
                                        ).showSnackBar(
                                          const SnackBar(
                                            content: Text('Flashing...'),
                                          ),
                                        );
                                      }
                                      : null,
                              child: const Text('Flash Firmware'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: SubTitleText(
                  subtitle: 'Available Flight Computers',
                  theme: theme,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (gs == null) return;
                  ref
                      .read(groundStationListProvider.notifier)
                      .updateGS(
                        gs.copyWith(batteryLevel: gs.batteryLevel - 0.02),
                      );
                },
                child: const Text('Drain the Battery'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
