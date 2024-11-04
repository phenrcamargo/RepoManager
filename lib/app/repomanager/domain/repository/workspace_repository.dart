import 'dart:io';

import 'package:repomanager/app/repomanager/domain/entities/workspace_entity.dart';
import 'package:repomanager/app/repomanager/shared/either/either.dart';

abstract class IWorkspaceRepository {
  Future<Either<void, List<WorkSpaceEntity>>> getWorkspaces();
  Future<Either<void, WorkSpaceEntity?>> getWorkspace(Directory workspacePath);
  Future<Either<void, WorkSpaceEntity>> createWorkspace(WorkSpaceEntity workspace);
  Future<Either<void, WorkSpaceEntity>> updateWorkspace(WorkSpaceEntity workspace);
  Future<Either<void, WorkSpaceEntity>> deleteWorkspace(Directory workspacePath);
}

