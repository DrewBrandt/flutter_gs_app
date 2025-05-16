import 'package:flutter/material.dart';
import 'package:split_view/split_view.dart';

import 'package:flutter_gs_app/views/body/pre_flight/log_viewer.dart';
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
        gripSize: 4,
        gripColor: Theme.of(context).colorScheme.secondary,
        gripColorActive: Theme.of(context).colorScheme.primary,
        controller: SplitViewController(weights: [.35, .65]),
      
        children: [
          // LEFT PANEL with internal vertical split between GS and FCs
          SizedBox(
            width: 400,
            child: Padding(
              padding: const EdgeInsets.only(right: 25),
              
              child: SplitView(
                viewMode: SplitViewMode.Vertical,
                gripSize: 4,
                gripColor: Theme.of(context).colorScheme.secondary,
                gripColorActive: Theme.of(context).colorScheme.primary,
                controller: SplitViewController(weights: [0.5, 0.5]),
                children: [GroundStationConfig(), DeviceLogDemo()],
              ),
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
              SizedBox(height: 100,),
              Center(child: Text('We don''t do that here'),),
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
