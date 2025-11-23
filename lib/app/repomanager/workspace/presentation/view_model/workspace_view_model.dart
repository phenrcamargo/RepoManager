import 'package:flutter/material.dart';
import 'package:repomanager/app/repomanager/core/domain/failure/database_failure.dart';
import 'package:repomanager/app/repomanager/workspace/domain/use-cases/create_workspace_usecase.dart';
import 'package:repomanager/app/repomanager/workspace/domain/use-cases/get_all_workspaces_usecase.dart';
import 'package:repomanager/app/repomanager/workspace/presentation/view_data/project_view_data.dart';
import 'package:repomanager/app/repomanager/workspace/presentation/view_data/workspace_page_view_data.dart';
import 'package:repomanager/app/repomanager/workspace/presentation/view_data/mappers/workspace_view_mapper.dart';
import 'package:repomanager/app/repomanager/workspace/presentation/view_data/workspace_view_data.dart';

class WorkSpaceViewModel extends ChangeNotifier {
  final CreateWorkspaceUseCase createWorkspaceUseCase;
  final GetAllWorkspaceUseCase getWorkspacesUseCase;

  WorkSpaceViewModel({
    required this.createWorkspaceUseCase,
    required this.getWorkspacesUseCase,
  });

  WorkSpacePageViewData _homeViewData = WorkSpacePageViewData();

  List<String> get workspacesNames => _homeViewData.workspacesNames;

  bool get projectListEmpty => _homeViewData.projects.isEmpty;

  int get projectListCount => _homeViewData.projects.length;

  ProjectViewData getProjectByIndex(int i) => _homeViewData.projects[i];

  Future<void> loadWorkspaces() async {
    try {
      var response = await getWorkspacesUseCase.execute();

      response.fold(
        (error) => throw error,
        (value) => setWorkspaces(WorkSpaceViewMapper.fromEntityList(value)),
      );
    } catch (e) {
      if (e is DatabaseFailure) print(e.message);
    }
  }

  Future<void> createWorkspace(WorkSpaceViewData workspace) async {
    try {
      var response = await createWorkspaceUseCase.execute(
          CreateWorkspaceUseCaseParams(
            path: workspace.path,
            name: workspace.name,
            description: workspace.description ?? "",
          )
      );

      response.fold(
        (error) => throw error,
        (value) => addWorkspace(WorkSpaceViewMapper.fromEntity(value)),
      );
    } catch (e) {
      if (e is DatabaseFailure) print(e.message);
    }
  }

  void setSelectedWorkspace(WorkSpaceViewData workSpaceEntity) {
    _homeViewData = _homeViewData.copyWith(selectedWorkSpace: workSpaceEntity);
    notifyListeners();
  }

  void setWorkspaces(List<WorkSpaceViewData> workspaces) {
    _homeViewData = _homeViewData.copyWith(workSpaces: workspaces);
    notifyListeners();
  }

  void setProjects(List<ProjectViewData> projects) {
    _homeViewData = _homeViewData.copyWith(projects: projects);
    notifyListeners();
  }

  void addWorkspace(WorkSpaceViewData workspace) {
    _homeViewData = _homeViewData.copyWith(
      workSpaces: [..._homeViewData.workSpaces, workspace]
    );
    notifyListeners();
  }

  void addProject(ProjectViewData project) {
    _homeViewData = _homeViewData.copyWith(
      projects: [..._homeViewData.projects, project]
    );
    notifyListeners();
  }

  void updateWorkspace(WorkSpaceViewData workSpace) {
    final newList = _homeViewData.workSpaces.map((w) => w == workSpace ? workSpace : w).toList();
    _homeViewData = _homeViewData.copyWith(workSpaces: newList);
    notifyListeners();
  }

  void updateProject(ProjectViewData project) {
    final newList = _homeViewData.projects.map((p) => p == project ? project : p).toList();
    _homeViewData = _homeViewData.copyWith(projects: newList);
    notifyListeners();
  }

  void removeWorkspace(WorkSpaceViewData workspace) {
    final newList = _homeViewData.workSpaces.where((w) => w != workspace).toList();
    _homeViewData = _homeViewData.copyWith(workSpaces: newList);
    notifyListeners();
  }

  void removeProject(ProjectViewData project) {
    final newList = _homeViewData.projects.where((p) => p != project).toList();
    _homeViewData = _homeViewData.copyWith(projects: newList);
    notifyListeners();
  }
}