import 'package:flutter/material.dart';

const List<Color> colorOptions = [
  Colors.blue,
  Colors.deepOrange,
  Colors.green,
  Colors.brown,
  Colors.purple,
  Colors.cyan,
  Colors.amber,
  Colors.pink,
];

class ColorPickerButton extends StatelessWidget {
  final Color color;
  final void Function(Color newColor) onPickNewColor;
  final MenuController _controller = MenuController();
  final int numPerRow = (colorOptions.length / 2.0).round();

  ColorPickerButton({
    super.key,
    required this.color,
    required this.onPickNewColor,
  });

  @override
  Widget build(BuildContext context) {
    int colorIdx = 0;
    return MenuAnchor(
      builder: (
        BuildContext context,
        MenuController controller,
        Widget? child,
      ) {
        return IconButton(
          icon: Tooltip(
            message: 'Change Color',
            padding: EdgeInsets.zero,
            child: Icon(Icons.circle, color: color),
          ),
          onPressed: () {
            controller.isOpen ? controller.close() : controller.open();
          },
        );
      },
      controller: _controller,
      menuChildren: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (; colorIdx < numPerRow; colorIdx++)
                    _iconBuilder(colorIdx),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (; colorIdx < colorOptions.length; colorIdx++)
                    _iconBuilder(colorIdx),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _iconBuilder(int idx) {
    return GestureDetector(
      onTap: () {
        _controller.close();
        onPickNewColor(colorOptions[idx]);
      },
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: colorOptions[idx],
            border: Border.all(
              color:
                  colorOptions[idx] == color
                      ? Colors.black
                      : Colors.transparent,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
