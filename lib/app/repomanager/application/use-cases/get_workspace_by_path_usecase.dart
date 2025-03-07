import 'dart:io';

import 'package:repomanager/app/repomanager/domain/entities/workspace_entity.dart';
import 'package:repomanager/app/repomanager/domain/repository/workspace_repository.dart';
import 'package:repomanager/app/repomanager/domain/use-case/use_case_interface.dart';
import 'package:repomanager/app/repomanager/common/either/either.dart';

class GetWorkspaceByPathUseCaseParams implements IUseCaseParams<GetWorkspaceByPathUseCase> {
  final Directory workspacePath;

  GetWorkspaceByPathUseCaseParams({ required this.workspacePath });
}

class GetWorkspaceByPathUseCase implements IUseCase<Future<WorkSpaceEntity>, GetWorkspaceByPathUseCaseParams> {
  final IWorkspaceRepository repository;

  GetWorkspaceByPathUseCase({ required this.repository });

  @override
  Future<WorkSpaceEntity> execute(GetWorkspaceByPathUseCaseParams params)  async{
      Either response = await repository.getWorkspace(params.workspacePath);

      return response.fold(
          (error) => throw Exception("Failed to get workspace"),
          (value) => value,
      );
  }



}