import 'dart:io';

import 'package:repomanager/app/repomanager/domain/entities/workspace_entity.dart';
import 'package:repomanager/app/repomanager/domain/repository/workspace_repository.dart';
import 'package:repomanager/app/repomanager/domain/use-case/use_case_interface.dart';
import 'package:repomanager/app/repomanager/shared/either/either.dart';

class GetWorkspaceUseCaseParams implements IUseCaseParams<GetWorkspaceUseCase> {
  final Directory workspacePath;

  GetWorkspaceUseCaseParams({ required this.workspacePath });
}

class GetWorkspaceUseCase implements IUseCase<Future<WorkSpaceEntity>, GetWorkspaceUseCaseParams> {
  final IWorkspaceRepository repository;

  GetWorkspaceUseCase({ required this.repository });

  @override
  Future<WorkSpaceEntity> execute(GetWorkspaceUseCaseParams params)  async{
      Either response = await repository.getWorkspace(params.workspacePath);

      return response.fold(
          (error) => throw Exception("Failed to get workspace"),
          (value) => value,
      );
  }



}