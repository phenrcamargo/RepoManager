import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:repomanager/app/repomanager/domain/entities/project_git_status_entity.dart';

class ProjectEntity {
  final Directory path;
  final Directory workspacePath;
  final String name;
  final String description;
  final String gitBranch;
  final ProjectGitStatusEntity fileModificationStatus;

  ProjectEntity({
    required Directory path,
    required Directory workspacePath,
    required this.name,
    required this.description,
    required this.gitBranch,
    required this.fileModificationStatus
  }) : path = Directory(p.normalize(path.path)), workspacePath = Directory(p.normalize(workspacePath.path));

  factory ProjectEntity.fromMap(Map<String, dynamic> map) => ProjectEntity(
      path: Directory(p.normalize(map['path'])),
      workspacePath: Directory(p.normalize(map['workspacePath'])),
      name: map['name'],
      description: map['description'],
      gitBranch: map['gitBranch'],
      fileModificationStatus: ProjectGitStatusEntity.fromMap(map['fileModificationStatus'])
  );

  String get branchState {
    if (fileModificationStatus.thereIsChanges) {
      return 'MODIFIED';
    }

    if(fileModificationStatus.thereIsUntrackedChanges) {
      return 'UNTRACKED';
    }

    return 'CLEAN';
  }

  Map<String, dynamic> toMap() => {
    'path': p.normalize(path.path),
    'workspacePath': workspacePath.path,
    'name': name,
    'description': description,
    'gitBranch': gitBranch,
    'fileModificationStatus': fileModificationStatus.toMap()
  };
}