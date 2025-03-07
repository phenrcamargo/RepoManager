import 'dart:io';

import 'package:flutter/material.dart';
import 'package:repomanager/app/repomanager/domain/entities/workspace_entity.dart';
import 'package:repomanager/app/repomanager/common/widgets/form/directory_picker_widget.dart';
import 'package:repomanager/app/repomanager/common/widgets/structure/add_window.dart';

class AddWorkspaceWindow extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _directoryController = TextEditingController();
  final TextEditingController _workspaceNameController = TextEditingController();
  final TextEditingController _workspaceDescriptionController = TextEditingController();
  final Function(WorkSpaceEntity) onSubmit;

  AddWorkspaceWindow({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return AddWindow(
        title: 'Add Workspace',
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
                controller: _workspaceNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Workspace Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a workspace name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: _workspaceDescriptionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Workspace Description',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a workspace description';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                child: const Text('Create Workspace'),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    onSubmit(WorkSpaceEntity(
                      path: Directory(_directoryController.text),
                      name: _workspaceNameController.text,
                      description: _workspaceDescriptionController.text,
                    ));
                    Navigator.of(context).pop();
                  } 
                },                
              ),
            ],
          ),
        ),
    );
  }
}