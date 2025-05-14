import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({super.key, required this.title, required this.theme});

  final String title;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(title, style: theme.textTheme.titleLarge),
    );
  }
}

class SubTitleText extends StatelessWidget {
  const SubTitleText({super.key, required this.subtitle, required this.theme});

  final String subtitle;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, left: 8),
      child: Text(subtitle, style: theme.textTheme.titleMedium),
    );
  }
}
