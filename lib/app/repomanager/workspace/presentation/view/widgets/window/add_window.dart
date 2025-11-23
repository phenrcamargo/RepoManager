import 'package:flutter/material.dart';
import 'package:repomanager/app/repomanager/core/presentation/extension/buildcontext_extension.dart';

class AddWindow extends StatefulWidget {
  final String title;
  final Widget addForm;
  final double width;
  final double height;

  const AddWindow({super.key, required this.title, required this.addForm, this.width = 0.5, this.height = 0.5});

  @override
  State<AddWindow> createState() => _AddWindowState();
}

class _AddWindowState extends State<AddWindow> {
  late final GlobalKey<FormState> formKey;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    formKey.currentState?.dispose();
    super.dispose();
  }

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
        width: size.width * widget.width,
        height: size.height * widget.height,
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
              widget.title,
              style: theme.textTheme.headlineMedium?.copyWith(color: theme.colorScheme.onPrimaryContainer, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20,),
            widget.addForm,
          ],
        ),
      ),
    );
  }
}