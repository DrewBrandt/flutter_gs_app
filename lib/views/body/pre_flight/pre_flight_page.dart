import 'package:flutter/material.dart';
import 'package:flutter_gs_app/notifiers/theme_provider.dart';
import 'package:flutter_gs_app/views/body/pre_flight/config_view_test.dart';
import 'package:split_view/split_view.dart';

import 'package:flutter_gs_app/views/body/pre_flight/log_viewer.dart';
import 'package:flutter_gs_app/views/body/pre_flight/ground_station_config.dart';
import 'package:flutter_gs_app/views/body/pre_flight/simulation_view.dart';
import 'package:flutter_gs_app/views/common/title_text.dart';

class PreFlightPage extends StatefulWidget {
  const PreFlightPage({super.key});

  @override
  State<PreFlightPage> createState() => _PreFlightPageState();
}

class _PreFlightPageState extends State<PreFlightPage> {
  bool _isGSDrawerOpen = false;

  void _toggleDrawer() {
    setState(() {
      _isGSDrawerOpen = !_isGSDrawerOpen;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final gsPanelWidth = getAdjustedSizeFromContext(
      context,
      baseSize: 600,
      maxSize: 750,
    );
    final configPercentWidth = getAdjustedSizeFromContext(
      context,
      baseSize: .65,
      maxSize: .7,
      ratioMultiplier: 1.35,
    );
    final titlePadding = getAdjustedSizeFromContext(
      context,
      baseSize: 20,
      maxSize: 60,
      ratioMultiplier: 1.1,
    );

    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(25),
          child: SplitView(
            viewMode: SplitViewMode.Horizontal,
            gripSize: 4,
            gripColor: theme.colorScheme.secondary,
            gripColorActive: theme.colorScheme.primary,
            controller: SplitViewController(
              weights: [1 - configPercentWidth, configPercentWidth],
            ),
            children: [
              // Logs panel now takes full left side
              SizedBox(
                width: 700,
                child: Padding(
                  padding: EdgeInsets.only(right: titlePadding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 56,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Device Logs',
                            style: theme.textTheme.titleLarge,
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      Expanded(child: DeviceLogDemo()),
                    ],
                  ),
                ),
              ),

              // Right panel remains unchanged
              Container(
                color: theme.scaffoldBackgroundColor,
                child: Column(
                  children: [
                    SizedBox(
                      height: 56,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: titlePadding),
                          child: Text(
                            'Flight Computer Configuration',
                            style: theme.textTheme.titleLarge,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: Text(
                        '${MediaQuery.of(context).size.width}x${MediaQuery.of(context).size.height} | ${MediaQuery.of(context).devicePixelRatio}',
                      ),
                    ),
                    const Spacer(),
                    Center(
                      child: TitleText(
                        theme: theme,
                        title: 'Flight Simulation',
                      ),
                    ),
                    const SimulationView(),
                  ],
                ),
              ),
            ],
          ),
        ),

        if (_isGSDrawerOpen)
          TapRegion(
            onTapInside: (event) => _toggleDrawer(),
            child: Container(
              color: theme.colorScheme.surfaceContainerLowest.withAlpha(190),
            ),
          ),
        // Sliding Drawer
        AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          top: 0,
          bottom: 0,
          left: _isGSDrawerOpen ? 0 : -gsPanelWidth,
          width: gsPanelWidth,
          child: Material(
            elevation: 8,
            color: theme.colorScheme.surfaceContainer,
            child: GroundStationConfig(),
          ),
        ),
        // Floating Button in Top Left
        Positioned(
          top: 25,
          left: 25,
          child: FloatingActionButton.extended(
            label: Text('Ground Stations'),
            onPressed: _toggleDrawer,
            tooltip: 'See all ground Stations',

            icon: Icon(
              _isGSDrawerOpen
                  ? Icons.keyboard_double_arrow_left_rounded
                  : Icons.keyboard_double_arrow_right_rounded,
            ),
          ),
        ),
      ],
    );
  }
}
