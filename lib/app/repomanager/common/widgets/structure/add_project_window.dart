import 'package:flutter/material.dart';
import 'package:repomanager/app/repomanager/common/widgets/form/directory_picker_widget.dart';
import 'package:repomanager/app/repomanager/common/widgets/structure/add_window.dart';

class AddProjectWindow extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _directoryController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  AddProjectWindow({super.key});

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