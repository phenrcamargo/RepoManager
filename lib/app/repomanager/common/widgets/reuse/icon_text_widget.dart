import 'package:flutter/material.dart';
import 'package:repomanager/app/repomanager/common/extension/buildcontext_extension.dart';

class IconText extends StatelessWidget {
  const IconText({super.key, required this.icon, required this.text, required this.color});
  final IconData icon;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: 20,
        ),
        const SizedBox(width: 3),
        Text(
          text,
          style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onPrimaryContainer, fontWeight: FontWeight.bold),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}