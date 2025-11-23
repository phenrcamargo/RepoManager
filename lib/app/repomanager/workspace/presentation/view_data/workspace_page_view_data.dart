import 'dart:collection';

import 'project_view_data.dart';
import 'workspace_view_data.dart';

class WorkSpacePageViewData {
  final WorkSpaceViewData? selectedWorkSpace;
  final UnmodifiableListView<WorkSpaceViewData> workSpaces;
  final UnmodifiableListView<ProjectViewData> projects;

  WorkSpacePageViewData({
    this.selectedWorkSpace,
    List<WorkSpaceViewData> workSpaces = const [],
    List<ProjectViewData> projects = const [],
  })  : workSpaces = UnmodifiableListView(workSpaces),
        projects = UnmodifiableListView(projects);

  WorkSpacePageViewData copyWith({
    WorkSpaceViewData? selectedWorkSpace,
    List<WorkSpaceViewData>? workSpaces,
    List<ProjectViewData>? projects,
  }) => WorkSpacePageViewData(
    selectedWorkSpace: selectedWorkSpace ?? this.selectedWorkSpace,
    workSpaces: workSpaces ?? this.workSpaces,
    projects: projects ?? this.projects,
  );

  List<String> get workspacesNames => workSpaces.map((w) => w.name).toList();
}