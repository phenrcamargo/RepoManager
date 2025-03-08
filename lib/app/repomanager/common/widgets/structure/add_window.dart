import 'package:flutter/material.dart';
import 'package:repomanager/app/repomanager/common/extension/buildcontext_extension.dart';

class AddWindow extends StatelessWidget {
  final String title;
  final Widget addForm;
  final double width;
  final double height;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AddWindow({super.key, required this.title, required this.addForm, this.width = 0.5, this.height = 0.5});

  @override
  Widget build(BuildContext context) {
    Size size = context.getSize;
    ThemeData theme = context.theme;

    return Dialog(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.linear,
        decoration: BoxDecoration(
          color: theme.cardTheme.color,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: theme.colorScheme.primaryContainer, width: 2),
        ),
        padding: const EdgeInsets.all(16),
        width: size.width * width,
        height: size.height * height,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  color: theme.colorScheme.onPrimaryContainer,
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            Text(
              title,
              style: theme.textTheme.headlineMedium?.copyWith(color: theme.colorScheme.onPrimaryContainer, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20,),
            addForm,
          ],
        ),
      ),
    );
  }
}