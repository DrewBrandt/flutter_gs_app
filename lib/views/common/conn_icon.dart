import 'package:flutter/material.dart';
import 'package:flutter_gs_app/models/device_data.dart';

class ConnIcon extends StatelessWidget {
  final DeviceData data;
  final double? iconSize;

  const ConnIcon({super.key, required this.data, this.iconSize});

  @override
  Widget build(BuildContext context) {
    final String message; //tooltip message
    final Widget
    icon; //which icon is used (Widget because RSSI is a stack of two widgets)
    switch (data.conStatus) {
      case ConStatus.noCon:
        message = 'Offline';
        icon = Icon(
          Icons.bluetooth_disabled_rounded,
          color: Theme.of(context).disabledColor,
        );
        break;
      case ConStatus.advert when data.type == DeviceType.gs:
        message = 'Available';
        icon = Icon(
          Icons.bluetooth_audio_rounded,
          color: Theme.of(context).colorScheme.primaryFixed,
        );
        break;
      case ConStatus.advert:
      case ConStatus.conLoRa:
        message = '${data.rssi} dbm';
        icon = _buildRSSIIcon(context);
        break;
      case ConStatus.conUSB:
        message = 'Connected via USB';
        icon = Icon(Icons.usb_rounded);
        break;
      case ConStatus.conBT:
        message = 'Connected Via BT';
        icon = Icon(Icons.bluetooth_audio_rounded);
        break;
    }
    return Tooltip(message: message, child: icon);
  }

  IconData? _getSignalStrengthIcon() {
    if (data.rssi >= -80) return Icons.signal_cellular_alt_rounded;
    if (data.rssi >= -100) return Icons.signal_cellular_alt_2_bar_rounded;
    if (data.rssi >= -115) return Icons.signal_cellular_alt_1_bar_rounded;
    return null;
  }

  Widget _buildRSSIIcon(BuildContext context) {
    return Stack(
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
    );
  }
}
