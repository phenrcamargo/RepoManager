import 'dart:io';

import 'package:repomanager/app/repomanager/domain/entities/project_git_status_entity.dart';
import 'package:repomanager/app/repomanager/domain/entities/project_entity.dart';
import 'package:repomanager/app/repomanager/domain/repository/project_repository.dart';
import 'package:repomanager/app/repomanager/domain/use-case/use_case_interface.dart';
import 'package:repomanager/app/repomanager/shared/either/either.dart';


class CreateProjectUseCaseParams implements IUseCaseParams<CreateProjectUseCase> {
  final Directory path;
  final Directory workspacePath;
  final String name;
  final String description;
  final String gitBranch;

  CreateProjectUseCaseParams(this.path, this.workspacePath, this.name, this.description, this.gitBranch);
}

class CreateProjectUseCase implements IUseCase<Future<ProjectEntity>, CreateProjectUseCaseParams> {
  final IProjectRepository repository;

  CreateProjectUseCase({ required this.repository });

  @override
  Future<ProjectEntity> execute(CreateProjectUseCaseParams params) async {
      Either response = await repository.getProject(params.path);

      if(response.isLeft()) {
        throw Exception("Failed to get project for unique verification");
      }

      if(response.getRight() != null) {
        throw Exception("Project already exists");
      }

      ProjectEntity entity = ProjectEntity(
          path: params.path,
          workspacePath: params.workspacePath,
          name: params.name,
          description: params.description,
          gitBranch: params.gitBranch,
          fileModificationStatus: ProjectGitStatusEntity()
      );

      response = await repository.createProject(entity);

      return response.fold<ProjectEntity>(
            (error) => throw Exception("Failed to create project"),
            (value) => value,
      );
  }

}