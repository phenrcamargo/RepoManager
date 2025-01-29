import 'dart:io';

import 'package:repomanager/app/repomanager/domain/entities/project_entity.dart';
import 'package:repomanager/app/repomanager/domain/repository/project_repository.dart';
import 'package:repomanager/app/repomanager/domain/use-case/use_case_interface.dart';
import 'package:repomanager/app/repomanager/shared/either/either.dart';

class GetProjectsByWorkspaceUseCaseParams implements IUseCaseParams<GetProjectsByWorkspaceUseCase> {
  final Directory workspacePath;

  GetProjectsByWorkspaceUseCaseParams({ required this.workspacePath });
}

class GetProjectsByWorkspaceUseCase implements IUseCase<Future<List<ProjectEntity>>, GetProjectsByWorkspaceUseCaseParams> {
  final IProjectRepository repository;

  GetProjectsByWorkspaceUseCase({ required this.repository });

  @override
  Future<List<ProjectEntity>> execute(GetProjectsByWorkspaceUseCaseParams params) async {
      Either response = await repository.getProjectsByWorkspace(params.workspacePath);

      return response.fold<List<ProjectEntity>>(
          (error) => throw Exception("Failed to get projects"),
          (value) => value,
      );
  }

}