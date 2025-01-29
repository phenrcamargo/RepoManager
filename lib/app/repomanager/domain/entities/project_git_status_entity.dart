class ProjectGitStatusEntity {
  final int notStagedModifiedFiles;
  final int notStagedDeletedFiles;
  final int notStagedUntrackedFiles;
  final int onStagedAddedFiles;
  final int onStagedModifiedFiles;
  final int onStagedDeletedFiles;

  ProjectGitStatusEntity({
    this.notStagedModifiedFiles = 0,
    this.notStagedDeletedFiles = 0,
    this.notStagedUntrackedFiles = 0,
    this.onStagedAddedFiles = 0,
    this.onStagedModifiedFiles = 0,
    this.onStagedDeletedFiles = 0,
  });

  bool get thereIsChanges => notStagedModifiedFiles > 0 || notStagedDeletedFiles > 0 || onStagedAddedFiles > 0 || onStagedModifiedFiles > 0 || onStagedDeletedFiles > 0;

  bool get thereIsUntrackedChanges => notStagedUntrackedFiles > 0;
}