import 'package:flutter/material.dart';
import 'package:repomanager/app/repomanager/core/presentation/extension/buildcontext_extension.dart';
import 'package:repomanager/app/repomanager/workspace/presentation/view_data/workspace_view_data.dart';

import '../form/default_button_widget.dart';
import '../form/default_text_field_widget.dart';
import '../form/directory_picker_widget.dart';
import 'add_window.dart';

class AddWorkspaceWindow extends StatefulWidget {
  final Function(WorkSpaceViewData) onSubmit;

  const AddWorkspaceWindow({super.key, required this.onSubmit});

  @override
  State<AddWorkspaceWindow> createState() => _AddWorkspaceWindowState();
}

class _AddWorkspaceWindowState extends State<AddWorkspaceWindow> {
  late final GlobalKey<FormState> formKey;
  late final TextEditingController _directoryController;
  late final TextEditingController _workspaceNameController;
  late final TextEditingController _workspaceDescriptionController;

  @override
  void initState() {
    formKey = GlobalKey<FormState>();
    _directoryController = TextEditingController();
    _workspaceNameController = TextEditingController();
    _workspaceDescriptionController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    formKey.currentState?.dispose();
    _directoryController.dispose();
    _workspaceNameController.dispose();
    _workspaceDescriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return AddWindow(
        title: 'Add Workspace',
        height: formKey.currentState == null || formKey.currentState!.validate() ? 0.5 : 0.6,
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
              DefaultTextFieldWidget(
                controller: _workspaceNameController,
                labelText: 'Workspace Name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a workspace name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20,),
              DefaultTextFieldWidget(
                controller: _workspaceDescriptionController,
                labelText: 'Workspace Description',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a workspace description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20,),
              DefaultButtonWidget(
                text: 'Create Workspace',
                onClicked: () {
                  setState(() {
                    if (formKey.currentState!.validate()) {
                      widget.onSubmit(WorkSpaceViewData(
                        path: _directoryController.text,
                        name: _workspaceNameController.text,
                        description: _workspaceDescriptionController.text,
                      ));
                      Navigator.of(context).pop();
                    }
                  });
                },                
              ),
            ],
          ),
        ),
    );
  }
}