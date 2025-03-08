import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:repomanager/app/repomanager/common/extension/buildcontext_extension.dart';

class DirectoryPickerWidget extends StatefulWidget {
  final TextEditingController directoryController;
  final String? Function(String?)? validate;

  const DirectoryPickerWidget(this.directoryController, this.validate, {super.key});

  @override
  _DirectoryPickerFormState createState() => _DirectoryPickerFormState();
}

class _DirectoryPickerFormState extends State<DirectoryPickerWidget> {
  String? _selectedDirectory;

  Future<void> _pickDirectory() async {
    String? directoryPath = await FilePicker.platform.getDirectoryPath();

    if (directoryPath != null) {
      setState(() {
        _selectedDirectory = directoryPath;
        widget.directoryController.text = directoryPath;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = context.theme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: TextFormField(
            controller: widget.directoryController,
            readOnly: true,
            validator: widget.validate,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: _selectedDirectory ?? 'Chose a directory',
              prefixIcon: Tooltip(
                message: _selectedDirectory ?? 'Chose a directory',
                child: const Icon(Icons.info),
              )
            ),
            style: TextStyle(color: context.theme.colorScheme.onSecondaryContainer),
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          height: 47,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              backgroundColor: theme.colorScheme.onPrimaryContainer,
            ),
            onPressed: _pickDirectory,
            child: Icon(Icons.folder, color: theme.colorScheme.surface),
          ),
        ),
      ],
    );
  }
}
