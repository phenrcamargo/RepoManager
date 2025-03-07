import 'dart:io';

import 'package:repomanager/app/repomanager/domain/repository/project_repository.dart';
import 'package:repomanager/app/repomanager/domain/repository/workspace_repository.dart';
import 'package:repomanager/app/repomanager/domain/use-case/use_case_interface.dart';
import 'package:repomanager/app/repomanager/common/either/either.dart';

class DeleteWorkspaceUseCaseParams implements IUseCaseParams<DeleteWorkspaceUseCase> {
  final Directory workspacePath;

  DeleteWorkspaceUseCaseParams(this.workspacePath);
}

class DeleteWorkspaceUseCase implements IUseCase<Future<void>, DeleteWorkspaceUseCaseParams> {
  final IProjectRepository projectRepository;
  final IWorkspaceRepository workspaceRepository;

  DeleteWorkspaceUseCase({ required this.projectRepository, required this.workspaceRepository });

  @override
  Future<void> execute(DeleteWorkspaceUseCaseParams params) async {
      Either projectsResponse = await projectRepository.getProjectsByWorkspace(params.workspacePath);

      projectsResponse.fold(
        (error) => throw Exception("Failed to get workspace projects"),
        (value) async {
          if(value.isNotEmpty) {
            throw Exception("Failed to delete workspace. Workspace has projects");
          }

          Either response = await workspaceRepository.deleteWorkspace(params.workspacePath);
          response.fold(
            (error) => throw Exception("Failed to delete workspace"),
            (value) {},
          );
        },
      );
  }

}