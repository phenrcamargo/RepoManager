import 'dart:io';

import 'package:flutter/material.dart';
import 'package:repomanager/app/repomanager/domain/entities/workspace_entity.dart';
import 'package:repomanager/app/repomanager/common/extension/buildcontext_extension.dart';
import 'package:repomanager/app/repomanager/common/widgets/form/default_button_widget.dart';
import 'package:repomanager/app/repomanager/common/widgets/form/default_text_field_widget.dart';
import 'package:repomanager/app/repomanager/common/widgets/form/directory_picker_widget.dart';
import 'package:repomanager/app/repomanager/common/widgets/structure/add_window.dart';

class AddWorkspaceWindow extends StatefulWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _directoryController = TextEditingController();
  final TextEditingController _workspaceNameController = TextEditingController();
  final TextEditingController _workspaceDescriptionController = TextEditingController();
  final Function(WorkSpaceEntity) onSubmit;

  AddWorkspaceWindow({super.key, required this.onSubmit});

  @override
  State<AddWorkspaceWindow> createState() => _AddWorkspaceWindowState();
}

class _AddWorkspaceWindowState extends State<AddWorkspaceWindow> {
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    return AddWindow(
        title: 'Add Workspace',
        height: widget.formKey.currentState == null || widget.formKey.currentState!.validate() ? 0.5 : 0.6,
        addForm: Form(
          key: widget.formKey,
          child: Column(
            children: [
              DirectoryPickerWidget(
                  widget._directoryController,
                (value) {
                  if(value == null || value.isEmpty) {
                    return 'Please select a directory';
                  }
                  return null;
                }
              ),
              const SizedBox(height: 20,),
              DefaultTextFieldWidget(
                controller: widget._workspaceNameController,
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
                controller: widget._workspaceDescriptionController,
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
                    if (widget.formKey.currentState!.validate()) {
                      widget.onSubmit(WorkSpaceEntity(
                        path: Directory(widget._directoryController.text),
                        name: widget._workspaceNameController.text,
                        description: widget._workspaceDescriptionController.text,
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