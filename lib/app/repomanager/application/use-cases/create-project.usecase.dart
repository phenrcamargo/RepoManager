import 'dart:io';

import 'package:repomanager/app/repomanager/application/dto/project.dto.dart';
import 'package:repomanager/app/repomanager/domain/entities/project.entity.dart';
import 'package:repomanager/app/repomanager/domain/repository/project.repository.dart';
import 'package:repomanager/app/repomanager/domain/use-case/use-case.interface.dart';
import 'package:repomanager/app/repomanager/shared/either/either.dart';


class CreateProjectUseCaseParams implements IUseCaseParams<CreateProjectUseCase> {
  final Directory path;
  final Directory workspacePath;
  final String name;
  final String description;
  final String gitStatus;
  final String gitBranch;

  CreateProjectUseCaseParams(this.path, this.workspacePath, this.name, this.description, this.gitStatus, this.gitBranch);
}

class CreateProjectUseCase implements IUseCase<Future<ProjectDTO>> {
  final IProjectRepository repository;

  CreateProjectUseCase({ required this.repository });

  @override
  Future<ProjectDTO> execute(IUseCaseParams params) async {
    if (params is CreateProjectUseCaseParams) {
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
          gitStatus: params.gitStatus,
          gitBranch: params.gitBranch
      );

      response = await repository.createProject(entity);

      return response.fold<ProjectDTO>(
            (error) => throw Exception("Failed to create project"),
            (value) => ProjectDTO.fromEntity(value),
      );
    }
    throw Exception("Invalid params");
  }

}