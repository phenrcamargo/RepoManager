import 'dart:io';

import 'package:repomanager/app/repomanager/domain/entities/project_git_status_entity.dart';

class ProjectEntity {
  final Directory path;
  final Directory workspacePath;
  final String name;
  final String description;
  final String gitBranch;
  final ProjectGitStatusEntity fileModificationStatus;

  ProjectEntity({
    required this.path,
    required this.workspacePath,
    required this.name,
    required this.description,
    required this.gitBranch,
    required this.fileModificationStatus
  });

  String get branchState {
    if (fileModificationStatus.thereIsChanges) {
      return 'MODIFIED';
    }

    if(fileModificationStatus.thereIsUntrackedChanges) {
      return 'UNTRACKED';
    }

    return 'CLEAN';
  }
}