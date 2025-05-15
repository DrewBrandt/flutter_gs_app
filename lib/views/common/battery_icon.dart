import 'package:flutter/material.dart';

class BatteryIcon extends StatelessWidget {
  final double level; // 0.0 to 1.0
  final double? iconSize;
  final bool isFC;
  BatteryIcon({super.key, required this.level, this.iconSize, this.isFC = true});

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
    final curve = isFC ? fcBatteryIcons : gsBatteryIcons;
    for (final (threshold, icon) in curve) {
      if (level >= threshold) return icon;
    }
    return Icons.battery_alert;
  }

  Color _getBatteryColor() {
    if ((isFC && level >= 0.74) || level >= .49) return Colors.green;
    if ((isFC && level >= 0.49) || level >=.24) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: '${(level * 100).round()}%',
      child: Icon(
        _getBatteryIcon(),
        size: iconSize ?? Theme.of(context).iconTheme.size,
        color: _getBatteryColor(),
      ),
    );
  }
}

class BatteryIconPercentage extends BatteryIcon {
  BatteryIconPercentage({
    super.key,
    required super.level,
    super.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            '${(level * 100).round()}%',
            style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
