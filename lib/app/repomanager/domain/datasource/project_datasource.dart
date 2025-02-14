import 'dart:io';

import 'package:repomanager/app/repomanager/domain/entities/project_entity.dart';

abstract class IProjectDataSource {
  Future<List<ProjectEntity>> getProjects();
  Future<List<ProjectEntity>> getProjectsByWorkspace(Directory workspacePath);
  Future<ProjectEntity?> getProjectByPath(Directory path);
  Future<void> createProject(ProjectEntity project);
  Future<void> updateProject(ProjectEntity project);
  Future<void> deleteProject(Directory path, Directory workspacePath);
}