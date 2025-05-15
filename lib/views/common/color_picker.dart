import 'package:flutter/material.dart';

final List<Color> colorOptions = [
  Colors.orange,
  Colors.blue,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.teal,
  Colors.amber,
  Colors.indigo,
  Colors.cyan,
  Colors.pink,
  Colors.brown,
  Colors.grey,
  Colors.deepOrange,
  Colors.lightGreen,
];

class ColorPickerButton extends StatelessWidget {
  final Color color;
  final void Function(Color newColor) onPickNewColor;

  const ColorPickerButton({
    super.key,
    required this.color,
    required this.onPickNewColor,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Color>(
      initialValue: color,
      icon: Tooltip(
        message: 'Change Color',
        padding: EdgeInsets.zero,
        child: Icon(Icons.circle, color: color),
      ),
      padding: EdgeInsets.zero,
      constraints: BoxConstraints(),
      menuPadding: EdgeInsets.zero,

      itemBuilder:
          (context) => [
            PopupMenuItem<Color>(
              enabled: false,
              padding: EdgeInsets.zero,
              
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i < colorOptions.length; i += 2)
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        for (int j = 0; j < 2; j++)
                          if (i + j < colorOptions.length)
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context, colorOptions[i + j]);
                                onPickNewColor(colorOptions[i + j]);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: colorOptions[i + j],
                                    border: Border.all(
                                      color:
                                          colorOptions[i + j] == color
                                              ? Colors.black
                                              : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          else
                            const SizedBox(width: 36), // keep layout aligned
                      ],
                    ),
                ],
              ),
            ),

          ],
    );
  }
}
