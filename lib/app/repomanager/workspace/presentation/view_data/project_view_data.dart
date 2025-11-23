class ProjectViewData {
  final String path;
  final String workspacePath;
  final String name;
  final String description;
  final String gitBranch;
  final String notStagedModifiedFiles;
  final String notStagedDeletedFiles;
  final String notStagedUntrackedFiles;
  final String onStagedAddedFiles;
  final String onStagedModifiedFiles;
  final String onStagedDeletedFiles;

  ProjectViewData({
    required this.path,
    required this.workspacePath,
    required this.name,
    required this.description,
    required this.gitBranch,
    required this.notStagedModifiedFiles,
    required this.notStagedDeletedFiles,
    required this.notStagedUntrackedFiles,
    required this.onStagedAddedFiles,
    required this.onStagedModifiedFiles,
    required this.onStagedDeletedFiles,
  });

  ProjectViewData copyWith({
    String? path,
    String? workspacePath,
    String? name,
    String? description,
    String? gitBranch,
    String? notStagedModifiedFiles,
    String? notStagedDeletedFiles,
    String? notStagedUntrackedFiles,
    String? onStagedAddedFiles,
    String? onStagedModifiedFiles,
    String? onStagedDeletedFiles,
  }) => ProjectViewData(
    path: path ?? this.path,
    workspacePath: workspacePath ?? this.workspacePath,
    name: name ?? this.name,
    description: description ?? this.description,
    gitBranch: gitBranch ?? this.gitBranch,
    notStagedModifiedFiles: notStagedModifiedFiles ?? this.notStagedModifiedFiles,
    notStagedDeletedFiles: notStagedDeletedFiles ?? this.notStagedDeletedFiles,
    notStagedUntrackedFiles: notStagedUntrackedFiles ?? this.notStagedUntrackedFiles,
    onStagedAddedFiles: onStagedAddedFiles ?? this.onStagedAddedFiles,
    onStagedModifiedFiles: onStagedModifiedFiles ?? this.onStagedModifiedFiles,
    onStagedDeletedFiles: onStagedDeletedFiles ?? this.onStagedDeletedFiles,
  );

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProjectViewData &&
        other.path == path &&
        other.workspacePath == workspacePath &&
        other.name == name &&
        other.description == description &&
        other.gitBranch == gitBranch;
  }

  @override
  int get hashCode => path.hashCode ^ workspacePath.hashCode ^ name.hashCode ^
  description.hashCode ^ gitBranch.hashCode;
}