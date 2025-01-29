import 'dart:io';

import 'package:repomanager/app/repomanager/domain/entities/project_git_status_entity.dart';
import 'package:repomanager/app/repomanager/domain/use-case/use_case_interface.dart';

class GetBranchStatusProjectUseCaseParams implements IUseCaseParams<GetBranchStatusProjectUseCase> {
  final Directory pathProject;

  GetBranchStatusProjectUseCaseParams(this.pathProject);
}

class GetBranchStatusProjectUseCase implements IUseCase<Future<void>, GetBranchStatusProjectUseCaseParams> {
  @override
  Future<ProjectGitStatusEntity> execute(GetBranchStatusProjectUseCaseParams params) async {
    final result = await _runGitCommand(params.pathProject.path);

    final output = result.stdout.toString();
    final lines = output.split('\n').where((line) => line.isNotEmpty);
    final fileModificationEntity = _buildEntityToReturn(lines);

    return fileModificationEntity;
  }

  Future<ProcessResult> _runGitCommand(String directoryPath) async {
    final process = await Process.run(
      'git',
      ['status', '--short'],
      runInShell: true,
      workingDirectory: directoryPath,
    );

    if (process.exitCode != 0) {
      throw Exception('Failed to get branch status');
    }

    return process;
  }

  ProjectGitStatusEntity _buildEntityToReturn(Iterable<String> lines) {
    final notStagedModified = lines.where((line) => RegExp(r'^.M').hasMatch(line)).length;
    final notStagedDeleted = lines.where((line) => RegExp(r'^.D').hasMatch(line)).length;
    final notStagedUntracked = lines.where((line) => line.startsWith('??')).length;
    final onStagedAdded = lines.where((line) => line.startsWith('A')).length;
    final onStagedModified = lines.where((line) => line.startsWith('M')).length;
    final onStagedDeleted = lines.where((line) => line.startsWith('D')).length;

    return ProjectGitStatusEntity(
      notStagedModifiedFiles: notStagedModified,
      notStagedDeletedFiles: notStagedDeleted,
      notStagedUntrackedFiles: notStagedUntracked,
      onStagedAddedFiles: onStagedAdded,
      onStagedModifiedFiles: onStagedModified,
      onStagedDeletedFiles: onStagedDeleted,
    );
  }
}