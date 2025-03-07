import 'dart:io';

import 'package:repomanager/app/repomanager/domain/entities/workspace_entity.dart';
import 'package:repomanager/app/repomanager/domain/failure/failure.dart';
import 'package:repomanager/app/repomanager/domain/repository/workspace_repository.dart';
import 'package:repomanager/app/repomanager/domain/use-case/use_case_interface.dart';
import 'package:repomanager/app/repomanager/infra/failure/already_exists_failure.dart';
import 'package:repomanager/app/repomanager/infra/failure/database_failure.dart';
import 'package:repomanager/app/repomanager/infra/failure/not_found_failure.dart';
import 'package:repomanager/app/repomanager/common/either/either.dart';

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

class CreateWorkspaceUseCase implements IUseCase<Future<Either<Failure, WorkSpaceEntity>>, CreateWorkspaceUseCaseParams> {
  final IWorkspaceRepository repository;

  CreateWorkspaceUseCase({ required this.repository });

  @override
  Future<Either<Failure, WorkSpaceEntity>> execute(CreateWorkspaceUseCaseParams params) async {
      final response = await repository.getWorkspace(params.path);

      return await response.fold(
        (failure) async {
          if (failure is! NotFoundFailure) {
            return Left(DatabaseFailure("Failed to get project for unique verification"));
          }

          final entity = WorkSpaceEntity(path: params.path, name: params.name, description: params.description);

          return await repository.createWorkspace(entity);
        },
        (project) => Left(AlreadyExistsFailure("Workspace already exists")),
      );
  }
}
