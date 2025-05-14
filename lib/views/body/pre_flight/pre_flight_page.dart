import 'package:flutter/material.dart';
import 'package:flutter_gs_app/views/body/pre_flight/ground_station_config.dart';
import 'package:flutter_gs_app/views/body/pre_flight/test.dart';
import 'package:flutter_gs_app/views/common/title_text.dart';

class PreFlightPage extends StatelessWidget {
  const PreFlightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                GroundStationConfig(),
                Spacer(),
                Container(color: Colors.blue, height: 300, width: 100),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(children: [Center(child: TitleText(title: 'Flight Computer Configuration', theme: Theme.of(context)))]),
          ),
        ],
      ),
    );
  }

// @override
//   Widget build(BuildContext context) {
//     return Test();
//   }
}