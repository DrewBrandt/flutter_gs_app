import 'package:flutter/material.dart';
import 'package:flutter_gs_app/models/device_data.dart';

class ConnIcon extends StatelessWidget {
  final DeviceData data;
  final double? iconSize;

  const ConnIcon({super.key, required this.data, this.iconSize});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: data.conStatus == ConStatus.noCon ? 'Offline' : '${data.rssi} dbm',
      child: Stack(
        alignment: Alignment.center,
        children: [
          Icon(
            Icons.signal_cellular_alt_rounded,
            color: Theme.of(context).disabledColor.withAlpha(40),
          ),
          data.conStatus != ConStatus.noCon
              ? Icon(
                _getSignalStrengthIcon(),
                color: Theme.of(context).iconTheme.color,
              )
              : Icon(null),
        ],
      ),
    );
  }

  IconData? _getSignalStrengthIcon() {
    if (data.rssi >= -80) return Icons.signal_cellular_alt_rounded;
    if (data.rssi >= -100) return Icons.signal_cellular_alt_2_bar_rounded;
    if (data.rssi >= -115) return Icons.signal_cellular_alt_1_bar_rounded;
    return null;
  }
}
