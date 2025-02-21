import 'dart:io';

import 'package:flutter/material.dart';
import 'package:repomanager/app/repomanager/domain/entities/project_entity.dart';
import 'package:repomanager/app/repomanager/domain/entities/workspace_entity.dart';

import '../../../domain/entities/project_git_status_entity.dart';

class HomeStore extends ChangeNotifier {
  late WorkSpaceEntity _workSpaceEntity;
  final List<ProjectEntity> _projects = [
    ProjectEntity(
      path: Directory.current,
      workspacePath: Directory.current,
      name: "Test Project",
      description: "Description of the project",
      gitBranch: "main",
      fileModificationStatus: ProjectGitStatusEntity(),
    )
  ];

  WorkSpaceEntity get workSpaceEntity => _workSpaceEntity;
  List<ProjectEntity> get projects => List.unmodifiable(_projects);

  void setWorkSpaceEntity(WorkSpaceEntity workSpaceEntity) {
    _workSpaceEntity = workSpaceEntity;
    notifyListeners();
  }

  void setProjects(List<ProjectEntity> projects) {
    _projects.clear();
    _projects.addAll(projects);
    notifyListeners();
  }

  void addProject(ProjectEntity project) {
    _projects.add(project);
    notifyListeners();
  }

  void removeProject(ProjectEntity project) {
    _projects.remove(project);
    notifyListeners();
  }

  void updateProjectList(List<ProjectEntity> projectos) {
    _projects.clear();
    _projects.addAll(projectos);
    notifyListeners();
  }
}