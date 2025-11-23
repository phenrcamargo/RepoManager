import 'dart:io';

import 'package:repomanager/app/repomanager/core/domain/either/either.dart';
import 'package:repomanager/app/repomanager/core/domain/failure/failure.dart';
import 'package:repomanager/app/repomanager/workspace/domain/entities/workspace_entity.dart';

abstract class IWorkspaceRepository {
  Future<Either<Failure, List<WorkSpaceEntity>>> getWorkspaces();
  Future<Either<Failure, WorkSpaceEntity?>> getWorkspace(Directory workspacePath);
  Future<Either<Failure, WorkSpaceEntity>> createWorkspace(WorkSpaceEntity workspace);
  Future<Either<Failure, int>> updateWorkspace(WorkSpaceEntity workspace);
  Future<Either<Failure, int>> deleteWorkspace(Directory workspacePath);
}

