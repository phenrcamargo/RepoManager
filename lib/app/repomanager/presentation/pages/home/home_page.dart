import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repomanager/app/repomanager/domain/entities/project_entity.dart';
import 'package:repomanager/app/repomanager/domain/entities/project_git_status_entity.dart';
import 'package:repomanager/app/repomanager/presentation/pages/home/home_store.dart';
import 'package:repomanager/app/repomanager/shared/extension/buildcontext_extension.dart';
import 'package:repomanager/app/repomanager/shared/widgets/form/default_button_widget.dart';
import 'package:repomanager/app/repomanager/shared/widgets/form/select_input_widget.dart';
import 'package:repomanager/app/repomanager/shared/widgets/reuse/project_card_widget.dart';
import 'package:repomanager/app/repomanager/shared/widgets/structure/add_project_window.dart';

import 'package:repomanager/app/repomanager/shared/widgets/structure/header_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final HomeStore homeStore = Provider.of<HomeStore>(context);
    final theme = context.theme;

    final ProjectEntity projectEntity = ProjectEntity(
      path: Directory.current,
      workspacePath: Directory.current,
      name: "Test Project",
      description: "Description of the project",
      gitBranch: "main",
      fileModificationStatus: ProjectGitStatusEntity(),
    );

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
                    const SelectInputWidget(),
                    const SizedBox(
                      width: 10,
                    ),
                    DefaultButtonWidget(
                      text: 'Add Workspace',
                      onClicked: () {},
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
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        DefaultButtonWidget(
                          text: 'Add Project',
                          onClicked: () {
                            showDialog(
                                context: context,
                                builder: (_) => AddProjectWindow(),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    if(homeStore.projects.isEmpty)
                      Text("No projects yet", style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal),),
                    if(homeStore.projects.isNotEmpty)
                      ListView.builder(
                        itemCount: homeStore.projects.length,
                        itemBuilder: (_, index) {
                          return ProjectCardWidget(project: homeStore.projects[index]);
                        },
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
