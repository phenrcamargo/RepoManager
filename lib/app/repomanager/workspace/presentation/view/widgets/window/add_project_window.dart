import 'package:flutter/material.dart';

import '../form/directory_picker_widget.dart';
import 'add_window.dart';

class AddProjectWindow extends StatefulWidget {
  const AddProjectWindow({super.key});

  @override
  State<AddProjectWindow> createState() => _AddProjectWindowState();
}

class _AddProjectWindowState extends State<AddProjectWindow> {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController _directoryController;
  late final TextEditingController _nameController;
  late final TextEditingController _descriptionController;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    _directoryController = TextEditingController();
    _nameController = TextEditingController();
    _descriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    formKey.currentState?.dispose();
    _directoryController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AddWindow(
      title: 'Add Project',
      addForm: Form(
        key: formKey,
        child: Column(
          children: [
            DirectoryPickerWidget(
              _directoryController,
              (value) {
                if(value == null || value.isEmpty) {
                  return 'Please select a directory';
                }
                return null;
              }
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Project Name',
              ),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: _descriptionController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Project Description',
              ),
            ),
          ],
        ),
      ),
    );
  }
}