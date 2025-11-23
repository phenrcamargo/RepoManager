import 'dart:io';

import 'package:repomanager/app/repomanager/core/domain/either/either.dart';
import 'package:repomanager/app/repomanager/core/domain/failure/already_exists_failure.dart';
import 'package:repomanager/app/repomanager/core/domain/failure/database_failure.dart';
import 'package:repomanager/app/repomanager/core/domain/failure/failure.dart';
import 'package:repomanager/app/repomanager/core/domain/failure/not_found_failure.dart';
import 'package:repomanager/app/repomanager/core/domain/use_case/use_case_interface.dart';
import 'package:repomanager/app/repomanager/workspace/domain/entities/workspace_entity.dart';
import 'package:repomanager/app/repomanager/workspace/domain/repository/workspace_repository.dart';

class CreateWorkspaceUseCaseParams implements IUseCaseParams<CreateWorkspaceUseCase> {
  String path;
  String name;
  String description;

  CreateWorkspaceUseCaseParams({
    required this.path,
    required this.name,
    this.description = "",
  });
}

class CreateWorkspaceUseCase implements IUseCase<Future<Either<Failure, WorkSpaceEntity>>, CreateWorkspaceUseCaseParams> {
  final IWorkspaceRepository repository;

  CreateWorkspaceUseCase({ required this.repository });

  @override
  Future<Either<Failure, WorkSpaceEntity>> execute(CreateWorkspaceUseCaseParams params) async {
    final dir = Directory(params.path);
    final response = await repository.getWorkspace(dir);

    return await response.fold(
      (failure) async {
        if (failure is! NotFoundFailure) {
          return Left(DatabaseFailure("Failed to get project for unique verification"));
        }

        final entity = WorkSpaceEntity(path: dir, name: params.name, description: params.description);

        return await repository.createWorkspace(entity);
      },
      (project) => Left(AlreadyExistsFailure("Workspace already exists")),
    );
  }
}
