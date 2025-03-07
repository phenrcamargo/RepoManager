import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repomanager/app/repomanager/common/common.dart';
import 'package:repomanager/app/repomanager/presentation/presenters/home_presenter.dart';
import 'package:repomanager/app/repomanager/presentation/stores/home_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final homeStore = context.watch<HomeStore>();
    final homePresenter = HomePresenter(homeStore);

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
                      items: homeStore.workSpaces.map((e) => e.name).toList(),
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
                              homePresenter.addWorkspace(workspace);
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
                      Text("No projects yet", style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.normal, color: theme.colorScheme.onPrimaryContainer),),
                    if(homeStore.projects.isNotEmpty)
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxHeight: 300,
                        ),
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: homeStore.projects.length,
                          itemBuilder: (_, index) {
                            return SizedBox(
                                height: 120, // Ajuste conforme necessário
                                child: ProjectCardWidget(project: homeStore.projects[index]),
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
