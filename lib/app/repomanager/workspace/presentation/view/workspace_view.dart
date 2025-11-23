import 'package:flutter/material.dart';
import 'package:repomanager/app/repomanager/core/presentation/extension/buildcontext_extension.dart';
import 'package:repomanager/app/repomanager/workspace/presentation/view_model/workspace_view_model.dart';

import 'widgets/form/default_button_widget.dart';
import 'widgets/form/select_input_widget.dart';
import 'widgets/reuse/project_card_widget.dart';
import 'widgets/window/add_project_window.dart';
import 'widgets/window/add_workspace_window.dart';
import 'widgets/reuse/header_widget.dart';

class WorkSpaceView extends StatefulWidget {
  final WorkSpaceViewModel viewModel;

  const WorkSpaceView({super.key, required this.viewModel});

  @override
  State<WorkSpaceView> createState() => _WorkSpaceViewState();
}

class _WorkSpaceViewState extends State<WorkSpaceView> {
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final model = widget.viewModel;

    return Scaffold(
      body: Column(
        children: [
          const HeaderWidget(),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SelectInputWidget(
                      items: model.workspacesNames,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    DefaultButtonWidget(
                      text: 'Add Workspace',
                      onClicked: () {
                        showDialog(
                          context: context,
                          builder: (_) => AddWorkspaceWindow(
                            onSubmit: (workspace) {
                              model.createWorkspace(workspace);
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Projects",
                          style: theme.textTheme.bodySmall
                              ?.copyWith(fontWeight: FontWeight.bold, color: theme.colorScheme.onPrimaryContainer),
                        ),
                        const Spacer(),
                        DefaultButtonWidget(
                          text: 'Add Project',
                          onClicked: () {
                            showDialog(
                                context: context,
                                builder: (_) => const AddProjectWindow(),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if(model.projectListEmpty)
                      Text("No projects yet", style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal, color: theme.colorScheme.onPrimaryContainer),),
                    if(!model.projectListEmpty)
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 300,
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: model.projectListCount,
                          itemBuilder: (_, index) {
                            return SizedBox(
                                height: 120,
                                child: ProjectCardWidget(project: model.getProjectByIndex(index)),
                            );
                          },
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
