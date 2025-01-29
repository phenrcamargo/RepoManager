import 'package:flutter/material.dart';
import 'package:repomanager/app/repomanager/shared/extension/buildcontext_extension.dart';

class DefaultButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const DefaultButtonWidget({
    super.key,
    required this.text,
    required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.primaryContainer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      onPressed: onClicked,
      child: Text(text, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onPrimaryContainer),),
    );
  }
}