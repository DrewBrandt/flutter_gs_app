import 'package:flutter/material.dart';
import 'package:flutter_gs_app/models/device_data.dart';
import 'package:flutter_gs_app/views/common/color_picker.dart';

class DeviceCard extends StatelessWidget {
  final DeviceData data;
  final void Function(DeviceData data)? onTap;
  final List<Widget> icons;
  final double? margin;

  const DeviceCard({
    super.key,
    required this.data,
    this.onTap,
    required this.icons,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final isNotCon = {
      ConStatus.advert,
      ConStatus.noCon,
    }.contains(data.conStatus);

    return Center(
      child: Tooltip(
        message: isNotCon ? 'Offline' : '',
        child: Card(
          color: data.color?.withAlpha(150),
          margin: EdgeInsets.all(margin ?? 6),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Card(
                  elevation: 0,
                  child: ListTile(
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
                      onPickNewColor: (_) {},
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
