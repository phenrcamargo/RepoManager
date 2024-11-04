import 'dart:io';

import 'package:repomanager/app/repomanager/application/dto/project_dto.dart';
import 'package:repomanager/app/repomanager/domain/repository/project_repository.dart';
import 'package:repomanager/app/repomanager/domain/use-case/use_case_interface.dart';
import 'package:repomanager/app/repomanager/shared/either/either.dart';

class GetProjectsByWorkspaceUseCaseParams implements IUseCaseParams<GetProjectsByWorkspaceUseCase> {
  final Directory workspacePath;

  GetProjectsByWorkspaceUseCaseParams({ required this.workspacePath });
}

class GetProjectsByWorkspaceUseCase implements IUseCase<Future<List<ProjectDTO>>> {
  final IProjectRepository repository;

  GetProjectsByWorkspaceUseCase({ required this.repository });

  @override
  Future<List<ProjectDTO>> execute(IUseCaseParams params) async {
    if(params is GetProjectsByWorkspaceUseCaseParams) {
      Either response = await repository.getProjectsByWorkspace(params.workspacePath);

      return response.fold(
          (error) => throw Exception("Failed to get projects"),
          (value) => value.map((e) => ProjectDTO.fromEntity(e)).toList()
      );
    }
    throw Exception("Invalid params");
  }

}