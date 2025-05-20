import 'package:flutter/material.dart';
import 'package:flutter_gs_app/models/device_data.dart';
import 'package:flutter_gs_app/notifiers/ground_station_provider.dart';
import 'package:flutter_gs_app/views/common/battery_icon.dart';
import 'package:flutter_gs_app/views/common/color_picker.dart';
import 'package:flutter_gs_app/views/common/conn_icon.dart';
import 'package:flutter_gs_app/views/common/decorated_dropdown.dart';
import 'package:flutter_gs_app/views/common/fc_list_view.dart';
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

    final gsConStatus = gs?.data.conStatus ?? ConStatus.noCon;

    return Padding(
      padding: const EdgeInsets.all(25),
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Column(
            children: [
              TitleText(title: 'Ground Stations', theme: theme),
              SizedBox(height: 20),
              SizedBox(
                height: 65,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IntrinsicWidth(
                      child: LabeledDropdown<int>(
                        
                        label: 'Select Ground Station',
                        value: selectedId,
                        items:
                            allGSs.map((gs) {
                              final gsConStatus = gs.data.conStatus;
                              return DropdownMenuItem<int>(

                                value: gs.data.id,
                                child: Tooltip(
                                  message:
                                      gsConStatus == ConStatus.noCon
                                          ? 'Offline'
                                          : gsConStatus == ConStatus.advert
                                          ? 'Connect...'
                                          : 'Connected',
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          ColorPickerButton(
                                            color:
                                                gs.data.color ?? Colors.black,
                                            onPickNewColor: (Color? c) => {},

                                          ),
                                          SizedBox(width: 10),
                                          Text(
                                            gs.data.name,
                                            style: TextStyle(
                                              color:
                                                  gsConStatus ==
                                                          ConStatus.advert
                                                      ? theme
                                                          .colorScheme
                                                          .primaryFixed
                                                      : gsConStatus ==
                                                          ConStatus.noCon
                                                      ? theme.disabledColor
                                                      : theme.colorScheme.primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(width: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          ConnIcon(data: gs.data),
                                          BatteryIcon(data: gs.data),
                                        ],
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
                    SizedBox(width: 10),
                    Expanded(child: SizedBox(width: 10)),
                    IntrinsicWidth(
                      child: InputDecorator(
                        decoration: InputDecoration(
                          labelText: 'Configure',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          labelStyle: TextStyle(
                            color: theme.colorScheme.primary,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                        ),
                        expands: true,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () => {},
                              icon: Icon(
                                Icons.edit,
                              ), // TODO, change to text field icon
                              tooltip: 'Rename',
                              style: ButtonStyle(
                                elevation: WidgetStatePropertyAll(3.0),
                              ),
                            ),
                            SizedBox(width: 8),
                            Tooltip(
                              message:
                                  gs != null && gsConStatus == ConStatus.conUSB
                                      ? ''
                                      : 'Connect via USB to upload firmware.',
                              child: ElevatedButton(
                                onPressed:
                                    gs != null &&
                                            gsConStatus == ConStatus.conUSB
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
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SubTitleText(
                      subtitle: 'Available Flight Computers',
                      theme: theme,
                    ),
                  ),
                  Expanded(child: Container()),
                  Tooltip(
                    message: 'Rediscover removed devices',
                    child: IconButton(
                      onPressed: () => {},
                      icon: Icon(Icons.refresh_rounded),
                    ),
                  ),
                ],
              ),
              Expanded(
                child:
                    gs != null && gs.knownFCs.isNotEmpty
                        ? FlightComputerListScrollView(fcList: gs.knownFCs)
                        : Card(
                          color: theme.colorScheme.surfaceContainerLow,
                          child: Center(
                            child: Text('Connect to a Ground Station'),
                          ),
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
