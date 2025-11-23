import 'dart:io';

import 'package:repomanager/app/repomanager/core/domain/either/either.dart';
import 'package:repomanager/app/repomanager/core/domain/use_case/use_case_interface.dart';
import 'package:repomanager/app/repomanager/workspace/domain/entities/project_entity.dart';
import 'package:repomanager/app/repomanager/workspace/domain/repository/project_repository.dart';


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