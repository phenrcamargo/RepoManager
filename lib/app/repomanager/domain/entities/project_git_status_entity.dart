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

  static ProjectGitStatusEntity fromMap(Map<String, dynamic> map) => ProjectGitStatusEntity(
    notStagedModifiedFiles: map['notStagedModifiedFiles'] as int,
    notStagedDeletedFiles: map['notStagedDeletedFiles'] as int,
    notStagedUntrackedFiles: map['notStagedUntrackedFiles'] as int,
    onStagedAddedFiles: map['onStagedAddedFiles'] as int,
    onStagedModifiedFiles: map['onStagedModifiedFiles'] as int,
    onStagedDeletedFiles: map['onStagedDeletedFiles'] as int,
  );

  bool get thereIsChanges => notStagedModifiedFiles > 0 || notStagedDeletedFiles > 0 || onStagedAddedFiles > 0 || onStagedModifiedFiles > 0 || onStagedDeletedFiles > 0;

  bool get thereIsUntrackedChanges => notStagedUntrackedFiles > 0;

  Map<String, dynamic> toMap() => {
    'notStagedModifiedFiles': notStagedModifiedFiles,
    'notStagedDeletedFiles': notStagedDeletedFiles,
    'notStagedUntrackedFiles': notStagedUntrackedFiles,
    'onStagedAddedFiles': onStagedAddedFiles,
    'onStagedModifiedFiles': onStagedModifiedFiles,
    'onStagedDeletedFiles': onStagedDeletedFiles,
  };
}