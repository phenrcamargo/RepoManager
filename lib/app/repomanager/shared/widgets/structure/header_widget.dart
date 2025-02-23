import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repomanager/app/repomanager/shared/extension/buildcontext_extension.dart';
import 'package:repomanager/app/repomanager/shared/theme/theme_provider.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final themeProvider = context.watch<ThemeProvider>();

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                text: 'Repo',
                style: theme.textTheme.headlineLarge?.copyWith(
                  fontWeight: FontWeight.w100,
                  color: theme.colorScheme.onPrimaryContainer,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Manager',
                    style: theme.textTheme.headlineLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: theme.colorScheme.onPrimaryContainer,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Icon(
                  themeProvider.isDarkTheme ? Icons.dark_mode : Icons.light_mode,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 10,),
                Switch(
                  value: themeProvider.isDarkTheme,
                  onChanged: (_) {
                    themeProvider.toggleTheme();
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}