import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:repomanager/app/repomanager/application/use-cases/get_branch_status_project_usecase.dart';
import 'package:repomanager/app/repomanager/domain/entities/project_git_status_entity.dart';

void main() {
  late GetBranchStatusProjectUseCase sut;
  late GetBranchStatusProjectUseCaseParams params;

  setUp(() {
    sut = GetBranchStatusProjectUseCase();
    params = GetBranchStatusProjectUseCaseParams(Directory('C:\\Users\\phenr\\Documents\\Projetos\\flutter-projects\\RepoManager'));
  });

  test('should get branch status', () async {
    final result = await sut.execute(params);
    print('NO STAGED MODIFIED: ${result.notStagedModifiedFiles}');
    print('NO STAGED DELETED: ${result.notStagedDeletedFiles}');
    print('NO STAGED UNTRACKED: ${result.notStagedUntrackedFiles}');
    print('ON STAGED ADDED: ${result.onStagedAddedFiles}');
    print('ON STAGED MODIFIED: ${result.onStagedModifiedFiles}');
    print('ON STAGED DELETED: ${result.onStagedDeletedFiles}');

    expect(result, isA<ProjectGitStatusEntity>());
  });
}