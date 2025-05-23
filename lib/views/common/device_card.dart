import 'package:flutter/material.dart';
import 'package:flutter_gs_app/models/device_data.dart';
import 'package:flutter_gs_app/views/common/color_picker.dart';

class DeviceCard extends StatelessWidget {
  final DeviceData data;
  final void Function(DeviceData data)? onTap;
  final List<Widget> icons;
  final double? margin;
  final void Function(Color newColor)? onColorChanged;

  const DeviceCard({
    super.key,
    required this.data,
    this.onTap,
    required this.icons,
    this.margin,
    this.onColorChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Tooltip(
        message:
            data.conStatus == ConStatus.advert ? 'Disconnected' : 'Connected',
        child: Card(
          color: data.color?.withAlpha(
            data.conStatus == ConStatus.advert ? 50 : 180,
          ),
          margin: EdgeInsets.all(margin ?? 6),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  elevation: 0,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: OverflowBox(
                            maxWidth: double.infinity,
                            maxHeight: double.infinity,
                            child: Icon(
                              data.type == DeviceType.fc
                                  ? Icons.rocket_launch_outlined
                                  : Icons.satellite_outlined,
                              size: 70,
                              color: Theme.of(context).disabledColor.withAlpha(
                                data.conStatus == ConStatus.advert ? 10 : 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ListTile(
                        onTap: () => onTap?.call(data),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 0,
                        ),
                        minVerticalPadding: 0,
                        minLeadingWidth: 0,
                        title: Text(
                          data.name,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        subtitle: Text(
                          'ID: ${data.id}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        leading: ColorPickerButton(
                          color: data.color ?? Colors.black,
                          onPickNewColor:
                              (color) => onColorChanged?.call(color),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (final icon in icons) ...[
                              const SizedBox(width: 10),
                              icon,
                            ],
                          ],
                        ),
                      ),
                    ],
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
