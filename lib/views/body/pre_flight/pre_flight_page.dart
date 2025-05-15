import 'package:flutter/material.dart';
import 'package:split_view/split_view.dart';

import 'package:flutter_gs_app/views/body/pre_flight/connected_flight_computers.dart';
import 'package:flutter_gs_app/views/body/pre_flight/ground_station_config.dart';
import 'package:flutter_gs_app/views/body/pre_flight/simulation_view.dart';
import 'package:flutter_gs_app/views/common/title_text.dart';

class PreFlightPage extends StatelessWidget {
  const PreFlightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: SplitView(
        viewMode: SplitViewMode.Horizontal,
        indicator: SplitIndicator(viewMode: SplitViewMode.Horizontal),
        activeIndicator: SplitIndicator(
          viewMode: SplitViewMode.Horizontal,
          isActive: true,
        ),
        gripSize: 4,
        gripColor: Theme.of(context).colorScheme.secondary,
        gripColorActive: Theme.of(context).colorScheme.primary,
        controller: SplitViewController(weights: [.35, .65]),
      
        children: [
          // LEFT PANEL with internal vertical split between GS and FCs
          Padding(
            padding: const EdgeInsets.only(right: 25),
            child: SplitView(
              viewMode: SplitViewMode.Vertical,
              indicator: SplitIndicator(viewMode: SplitViewMode.Vertical),
              activeIndicator: SplitIndicator(
                viewMode: SplitViewMode.Vertical,
                isActive: true,
              ),
              gripSize: 4,
              gripColor: Theme.of(context).colorScheme.secondary,
              gripColorActive: Theme.of(context).colorScheme.primary,
              controller: SplitViewController(weights: [0.5, 0.5]),
              children: const [GroundStationConfig(), ConnectedFlightComputers()],
            ),
          ),
      
          // RIGHT PANEL – unchanged layout
          Column(
            children: [
              Center(
                child: TitleText(
                  title: 'Flight Computer Configuration',
                  theme: Theme.of(context),
                ),
              ),
              const Spacer(),
              Center(
                child: TitleText(
                  theme: Theme.of(context),
                  title: 'Flight Simulation',
                ),
              ),
              const SimulationView(),
            ],
          ),
        ],
      ),
    );
  }
}
