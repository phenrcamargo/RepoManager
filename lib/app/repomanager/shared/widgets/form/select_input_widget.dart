import 'package:flutter/material.dart';
import 'package:repomanager/app/repomanager/shared/extension/buildcontext_extension.dart';

class SelectInputWidget extends StatefulWidget {
  final List<String> items;
  const SelectInputWidget({super.key, required this.items});

  @override
  State<SelectInputWidget> createState() => _SelectInputWidgetState();
}

class _SelectInputWidgetState extends State<SelectInputWidget> {
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final List<String> items = widget.items;
    String? selectedItem;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          " Workspace",
          style: theme.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.onPrimaryContainer,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                    color: theme.colorScheme.primaryContainer, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: DropdownButton<String>(
                borderRadius: BorderRadius.circular(10),
                underline: Container(),
                padding: const EdgeInsets.symmetric(horizontal: 8),
                focusColor: theme.cardColor,
                value: selectedItem,
                hint: items.isEmpty ? const Text("No items yet") : const Text("Select a item"),
                items: items.map((item) {
                  return DropdownMenuItem<String>(
                    alignment: Alignment.centerLeft,
                    value: item,
                    child: Text(item, style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onPrimaryContainer),),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedItem = newValue;
                  });
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}