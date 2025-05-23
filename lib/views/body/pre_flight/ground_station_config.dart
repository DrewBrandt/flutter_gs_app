import 'package:flutter/material.dart';
import 'package:flutter_gs_app/models/device_data.dart';
import 'package:flutter_gs_app/notifiers/ground_station_provider.dart';
import 'package:flutter_gs_app/views/common/battery_icon.dart';
import 'package:flutter_gs_app/views/common/conn_icon.dart';
import 'package:flutter_gs_app/views/common/device_card.dart';
import 'package:flutter_gs_app/views/common/fc_list_view.dart';
import 'package:flutter_gs_app/views/common/title_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GroundStationConfig extends ConsumerStatefulWidget {
  const GroundStationConfig({super.key});

  @override
  ConsumerState<GroundStationConfig> createState() =>
      _GroundStationConfigState();
}

class _GroundStationConfigState extends ConsumerState<GroundStationConfig> {
  final MenuController _controller = MenuController();
  bool _isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    final gs = ref.watch(activeGroundStationProvider);
    final allGSs = ref.watch(groundStationListProvider);
    final theme = Theme.of(context);
    const padding = 50.0;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(padding),
          child: Align(
            alignment: Alignment.topCenter,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 700),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final double width = constraints.maxWidth.clamp(0, 700);
                  return Column(
                    children: [
                      TitleText(title: 'Ground Stations', theme: theme),
                      SizedBox(height: 20),
                      MenuAnchor(
                        style: MenuStyle(
                          backgroundColor: WidgetStatePropertyAll(
                            theme.colorScheme.surfaceContainerHighest,
                          ),
                          padding: WidgetStatePropertyAll(EdgeInsets.symmetric(vertical: 8.0)),
                        ),
                        onOpen: () {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            setState(() => _isMenuOpen = true);
                          });
                        },
                        onClose: () {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            setState(() => _isMenuOpen = false);
                          });
                        },
                        consumeOutsideTap: true,
                        builder: (
                          BuildContext context,
                          MenuController controller,
                          Widget? child,
                        ) {
                          return Tooltip(
                            message: 'Select ground Station',
                            child: DeviceCard(
                              data: gs?.data ?? noDevice,
                              onTap:
                                  (_) =>
                                      controller.isOpen
                                          ? controller.close()
                                          : controller.open(),
                              icons: [
                                ConnIcon(data: gs?.data ?? noDevice),
                                BatteryIcon(data: gs?.data ?? noDevice),
                              ],
                            ),
                          );
                        },
                        controller: _controller,
                        crossAxisUnconstrained: true,
                        alignmentOffset: Offset(-padding, 0),
                        menuChildren: [
                          for (final gs in allGSs)
                            if (gs.data.conStatus != ConStatus.noCon)
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: padding),
                                child: SizedBox(
                                  width: width,
                                  
                                  child: DeviceCard(
                                    margin: 8,
                                    data: gs.data,
                                    onTap: (data) {
                                      _controller.close();
                                      ref
                                          .read(
                                            activeGroundStationIdProvider
                                                .notifier,
                                          )
                                          .setActive(gs.data.id);
                                    },
                                    icons: [
                                      ConnIcon(data: gs.data),
                                      BatteryIcon(data: gs.data),
                                    ],
                                  ),
                                ),
                              ),
                        ],
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
                                ? FlightComputerListScrollView(
                                  fcList: gs.knownFCs,
                                )
                                : Card(
                                  color: theme.colorScheme.surfaceContainerLow,
                                  child: Center(
                                    child: Text('Connect to a Ground Station'),
                                  ),
                                ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        if (_isMenuOpen)
          Positioned.fill(
            child: Container(
              margin: EdgeInsets.all(0),
              color: theme.colorScheme.surfaceContainerLowest.withAlpha(190),
            ),
          ),
      ],
    );
  }
}
