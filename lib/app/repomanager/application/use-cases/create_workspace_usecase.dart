import 'dart:io';

import 'package:repomanager/app/repomanager/domain/entities/workspace_entity.dart';
import 'package:repomanager/app/repomanager/domain/repository/workspace_repository.dart';
import 'package:repomanager/app/repomanager/domain/use-case/use_case_interface.dart';
import 'package:repomanager/app/repomanager/shared/either/either.dart';

class CreateWorkspaceUseCaseParams implements IUseCaseParams<CreateWorkspaceUseCase> {
  Directory path;
  String name;
  String description;

  CreateWorkspaceUseCaseParams({
    required this.path,
    required this.name,
    this.description = "",
  });
}

class CreateWorkspaceUseCase implements IUseCase<Future<WorkSpaceEntity>, CreateWorkspaceUseCaseParams> {
  final IWorkspaceRepository repository;

  CreateWorkspaceUseCase({ required this.repository });

  @override
  Future<WorkSpaceEntity> execute(CreateWorkspaceUseCaseParams params) async {
      Either response = await repository.getWorkspace(params.path);

      if(response.isLeft()) {
        throw Exception("Failed to get workspace for unique verification");
      }

      if(response.getRight() != null) {
        throw Exception("Workspace already exists");
      }

      WorkSpaceEntity workspace = WorkSpaceEntity(path: params.path, name: params.name, description: params.description);

      response = await repository.createWorkspace(workspace);

      return response.fold<WorkSpaceEntity>(
        (error) => throw Exception("Failed to create workspace"),
        (value) => value,
      );
  }
}
