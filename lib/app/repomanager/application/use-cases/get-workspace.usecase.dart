import 'dart:io';

import 'package:repomanager/app/repomanager/application/dto/workspace.dto.dart';
import 'package:repomanager/app/repomanager/domain/repository/workspace.repository.dart';
import 'package:repomanager/app/repomanager/domain/use-case/use-case.interface.dart';
import 'package:repomanager/app/repomanager/shared/either/either.dart';

class GetWorkspaceUseCaseParams implements IUseCaseParams<GetWorkspaceUseCase> {
  final Directory workspacePath;

  GetWorkspaceUseCaseParams({ required this.workspacePath });
}

class GetWorkspaceUseCase implements IUseCase<Future<WorkspaceDTO>> {
  final IWorkspaceRepository repository;

  GetWorkspaceUseCase({ required this.repository });

  @override
  Future<WorkspaceDTO> execute(IUseCaseParams params)  async{
    if(params is GetWorkspaceUseCaseParams) {
      Either response = await repository.getWorkspace(params.workspacePath);

      return response.fold(
          (error) => throw Exception("Failed to get workspace"),
          (value) => WorkspaceDTO.fromEntity(value),
      );
    }
    throw Exception("Invalid params");
  }



}