import 'package:flutter/material.dart';
import 'package:repomanager/app/repomanager/domain/entities/project_entity.dart';
import 'package:repomanager/app/repomanager/domain/entities/workspace_entity.dart';

class HomeStore extends ChangeNotifier {
  late WorkSpaceEntity _selectedWorkSpace;
  final List<WorkSpaceEntity> _workSpaces = [];
  final List<ProjectEntity> _projects = [];

  WorkSpaceEntity get selectedWorkSpace => _selectedWorkSpace;
  List<WorkSpaceEntity> get workSpaces => List.unmodifiable(_workSpaces);
  List<ProjectEntity> get projects => List.unmodifiable(_projects);

  void setSelectedWorkspace(WorkSpaceEntity workSpaceEntity) {
    _selectedWorkSpace = workSpaceEntity;
    notifyListeners();
  }

  void setWorkspaces(List<WorkSpaceEntity> workspaces) {
    _workSpaces.clear();
    _workSpaces.addAll(workspaces);
    notifyListeners();
  }

  void setProjects(List<ProjectEntity> projects) {
    _projects.clear();
    _projects.addAll(projects);
    notifyListeners();
  }

  void addWorkspace(WorkSpaceEntity workspace) {
    _workSpaces.add(workspace);
    notifyListeners();
  }

  void addProject(ProjectEntity project) {
    _projects.add(project);
    notifyListeners();
  }

  void removeWorkspace(WorkSpaceEntity workspace) {
    _workSpaces.remove(workspace);
    notifyListeners();
  }

  void removeProject(ProjectEntity project) {
    _projects.remove(project);
    notifyListeners();
  }

  void updateWorkspaceList(List<WorkSpaceEntity> workspaces) {
    _workSpaces.clear();
    _workSpaces.addAll(workspaces);
    notifyListeners();
  }

  void updateProjectList(List<ProjectEntity> projects) {
    _projects.clear();
    _projects.addAll(projects);
    notifyListeners();
  }
}