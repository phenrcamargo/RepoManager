import 'dart:io';

import 'package:repomanager/app/repomanager/domain/entities/project_git_status_entity.dart';
import 'package:repomanager/app/repomanager/domain/entities/project_entity.dart';
import 'package:repomanager/app/repomanager/domain/failure/failure.dart';
import 'package:repomanager/app/repomanager/domain/repository/project_repository.dart';
import 'package:repomanager/app/repomanager/domain/use-case/use_case_interface.dart';
import 'package:repomanager/app/repomanager/infra/failure/already_exists_failure.dart';
import 'package:repomanager/app/repomanager/infra/failure/database_failure.dart';
import 'package:repomanager/app/repomanager/infra/failure/not_found_failure.dart';
import 'package:repomanager/app/repomanager/shared/either/either.dart';


class CreateProjectUseCaseParams implements IUseCaseParams<CreateProjectUseCase> {
  final Directory path;
  final Directory workspacePath;
  final String name;
  final String description;
  final String gitBranch;

  CreateProjectUseCaseParams(this.path, this.workspacePath, this.name, this.description, this.gitBranch);
}

class CreateProjectUseCase implements IUseCase<Future<Either<Failure, ProjectEntity>>, CreateProjectUseCaseParams> {
  final IProjectRepository repository;

  CreateProjectUseCase({ required this.repository });

  @override
  Future<Either<Failure, ProjectEntity>> execute(CreateProjectUseCaseParams params) async {
      final response = await repository.getProject(params.path);

      return await response.fold(
        (failure) async {
          if (failure is! NotFoundFailure) {
            return Left(DatabaseFailure("Failed to get project for unique verification"));
          }

          final entity = ProjectEntity(
              path: params.path,
              workspacePath: params.workspacePath,
              name: params.name,
              description: params.description,
              gitBranch: params.gitBranch,
              fileModificationStatus: ProjectGitStatusEntity()
          );

          return await repository.createProject(entity);
        },
        (project) => Left(AlreadyExistsFailure("Project already exists in some workspace"))
      );
  }

}