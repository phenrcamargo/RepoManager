import 'package:flutter/material.dart';
import 'package:repomanager/app/repomanager/common/extension/buildcontext_extension.dart';

class DefaultTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? Function(String?)? validator;

  DefaultTextFieldWidget({super.key, required this.controller, required this.labelText, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
      ),
      style: TextStyle(color: context.theme.colorScheme.onSecondaryContainer),
      validator: validator ?? (value) => null,
    );
  }
}