import 'package:flutter/material.dart';
import 'package:flutter_gs_app/notifiers/ground_station_provider.dart';
import 'package:flutter_gs_app/views/common/fc_list_view.dart';
import 'package:flutter_gs_app/views/common/title_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConnectedFlightComputers extends ConsumerWidget {
  const ConnectedFlightComputers ({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gs = ref.watch(activeGroundStationProvider);

    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Column(
            children: [
              TitleText(title: 'Connected Flight Computers', theme: theme),
              SizedBox(height: 20),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 400),
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