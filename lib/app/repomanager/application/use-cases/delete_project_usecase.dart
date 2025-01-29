import 'dart:io';

import 'package:repomanager/app/repomanager/domain/repository/project_repository.dart';
import 'package:repomanager/app/repomanager/domain/use-case/use_case_interface.dart';


class DeleteProjectUseCaseParams implements IUseCaseParams<DeleteProjectUseCase> {
  final Directory path;
  final Directory workspacePath;

  DeleteProjectUseCaseParams(this.path, this.workspacePath);
}

class DeleteProjectUseCase implements IUseCase<Future<void>, DeleteProjectUseCaseParams> {
  final IProjectRepository repository;

  DeleteProjectUseCase({ required this.repository });

  @override
  Future<void> execute(DeleteProjectUseCaseParams params) async {
      final response = await repository.deleteProject(params.path, params.workspacePath);

      response.fold<void>(
        (error) => throw Exception("Failed to delete project"),
        (value) {},
      );
  }
  
}