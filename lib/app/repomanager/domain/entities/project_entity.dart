import 'dart:io';

import 'package:repomanager/app/repomanager/domain/enum/git_status_enum.dart';

class ProjectEntity {
  final Directory path;
  final Directory workspacePath;
  final String name;
  final String description;
  final String gitBranch;
  final GitStatusEnum gitStatus;
  int filesAdded;
  int filesModified;
  int filesDeleted;
  int filesUntracked;

  ProjectEntity({
    required this.path,
    required this.workspacePath,
    required this.name,
    required this.description,
    required this.gitBranch,
    required this.gitStatus,
    this.filesAdded = 0,
    this.filesModified = 0,
    this.filesDeleted = 0,
    this.filesUntracked = 0,
  });
}