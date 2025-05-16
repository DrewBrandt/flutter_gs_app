import 'package:flutter/material.dart';
import 'package:flutter_gs_app/models/device_data.dart';

class BatteryIcon extends StatelessWidget {
  final DeviceData data; // 0.0 to 1.0
  final double? iconSize;
  BatteryIcon({super.key, required this.data, this.iconSize});

final List<(double, IconData)> fcBatteryIcons = [
    (0.89, Icons.battery_full_rounded),
    (0.74, Icons.battery_6_bar_rounded),
    (0.49, Icons.battery_4_bar_rounded),
    (0.39, Icons.battery_2_bar_rounded),
    (0.34, Icons.battery_1_bar_rounded),
    (0.00, Icons.battery_alert_rounded),
  ];

  final List<(double, IconData)> gsBatteryIcons = [
    (0.89, Icons.battery_full_rounded),
    (0.66, Icons.battery_6_bar_rounded),
    (0.34, Icons.battery_4_bar_rounded),
    (0.24, Icons.battery_2_bar_rounded),
    (0.1, Icons.battery_1_bar_rounded),
    (0.00, Icons.battery_alert_rounded),
  ];

  IconData _getBatteryIcon() {
    final curve = data.type == DeviceType.fc ? fcBatteryIcons : gsBatteryIcons;
    for (final (threshold, icon) in curve) {
      if (data.batteryLevel >= threshold) return icon;
    }
    return Icons.battery_alert;
  }

  Color _getBatteryColor() {
    if ((data.type == DeviceType.fc && data.batteryLevel >= 0.74) || data.batteryLevel >= .49) return Colors.green;
    if ((data.type == DeviceType.fc && data.batteryLevel >= 0.49) || data.batteryLevel >=.24) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final size = iconSize ?? Theme.of(context).iconTheme.size;

    return data.conStatus == ConStatus.noCon ?
    Tooltip(
      message: 'Offline',
      child: Icon(Icons.battery_unknown_rounded,
      size: size,
      color: Theme.of(context).disabledColor,
          )
    )
    :
    Tooltip(
      message: '${(data.batteryLevel * 100).round()}%',
      child: Icon(
        _getBatteryIcon(),
        size: size,
        color: _getBatteryColor(),
      ),
    );
  }
}

class BatteryIconPercentage extends BatteryIcon {
  BatteryIconPercentage({
    super.key,
    required super.data,
    super.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return data.conStatus == ConStatus.noCon
        ? Tooltip(
          message: 'Offline',
          child: Icon(
            Icons.battery_unknown_rounded,
            size: iconSize ?? Theme.of(context).iconTheme.size,
            color: Theme.of(context).disabledColor,
          ),
        )
        : SizedBox(
      width: 40,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _getBatteryIcon(),
            size: iconSize ?? Theme.of(context).iconTheme.size! - 8.0,
            color: _getBatteryColor(),
          ),
          Text(
            '${(data.batteryLevel * 100).round()}%',
            style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
