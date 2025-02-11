import 'package:flutter/material.dart';
import 'package:repomanager/app/repomanager/shared/extension/buildcontext_extension.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

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
            GestureDetector(
              onTap: () {},
              child: CircleAvatar(
                radius: 35,
                backgroundColor: theme.colorScheme.primary.withOpacity(0.2),
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}