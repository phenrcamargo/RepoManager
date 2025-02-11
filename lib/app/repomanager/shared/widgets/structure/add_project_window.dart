import 'package:flutter/material.dart';
import 'package:repomanager/app/repomanager/shared/extension/buildcontext_extension.dart';
import 'package:repomanager/app/repomanager/shared/widgets/form/directory_picker_widget.dart';

class AddProjectWindow extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AddProjectWindow({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = context.getSize;
    ThemeData theme = context.theme;

    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          color: theme.colorScheme.secondaryContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(16),
        width: size.width * 0.5,
        height: size.height * 0.8,
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
              'Add Project',
              style: theme.textTheme.headlineMedium?.copyWith(color: theme.colorScheme.onPrimaryContainer, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20,),
            Form(
              key: formKey,
              child: Column(
                children: [
                  const DirectoryPickerWidget(),
                  const SizedBox(height: 20,),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Project Name',
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Project Description',
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}