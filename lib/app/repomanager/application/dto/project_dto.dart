import 'package:repomanager/app/repomanager/domain/enum/git_status_enum.dart';

import '../../domain/entities/project_entity.dart';

class ProjectDTO {
  final String path;
  final String workspacePath;
  final String name;
  final String? description;
  final String gitBranch;
  final GitStatusEnum gitStatus;
  final int filesAdded;
  final int filesModified;
  final int filesDeleted;
  final int filesUntracked;
  
  ProjectDTO({
    required this.path,
    required this.workspacePath,
    required this.name,
    this.description,
    required this.gitBranch,
    required this.gitStatus,
    required this.filesAdded,
    required this.filesModified,
    required this.filesDeleted,
    required this.filesUntracked,
  });

  factory ProjectDTO.fromEntity(ProjectEntity entity) {
    return ProjectDTO(
      path: entity.path.toString(),
      workspacePath: entity.workspacePath.toString(),
      name: entity.name,
      description: entity.description,
      gitBranch: entity.gitBranch,
      gitStatus: entity.gitStatus,
      filesAdded: entity.filesAdded,
      filesModified: entity.filesModified,
      filesDeleted: entity.filesDeleted,
      filesUntracked: entity.filesUntracked,
    );
  }
}