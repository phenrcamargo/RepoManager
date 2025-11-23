import 'package:flutter/material.dart';
import 'package:repomanager/app/repomanager/core/interface_adapters/types/types.dart';
import 'package:repomanager/app/repomanager/core/presentation/extension/buildcontext_extension.dart';

class DefaultTextFieldWidget extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final NullableStringCallback validator;

  const DefaultTextFieldWidget({super.key, required this.labelText, required this.controller, this.validator});

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