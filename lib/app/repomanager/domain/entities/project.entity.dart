import 'dart:io';

class ProjectEntity {
  final Directory path;
  final Directory workspacePath;
  final String name;
  final String description;
  final String gitStatus;
  final String gitBranch;

  ProjectEntity({
    required this.path,
    required this.workspacePath,
    required this.name,
    required this.description,
    required this.gitStatus,
    required this.gitBranch,
  });
}