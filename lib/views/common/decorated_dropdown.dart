import 'package:flutter/material.dart';

class LabeledDropdown<T> extends StatelessWidget {
  final String label;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;

  const LabeledDropdown({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InputDecorator(
      decoration: InputDecoration(
        labelText: label,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        labelStyle: TextStyle(color: theme.colorScheme.primary)
      ),
      expands: true,
      isEmpty: value == null,
      child: DropdownButtonHideUnderline(
        
        child: DropdownButton<T>(
          value: value,
          items: items,
          onChanged: onChanged,
          focusColor: Colors.transparent,
        ),
      ),
    );
  }
}
