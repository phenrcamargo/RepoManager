import 'dart:io';

import 'package:repomanager/app/repomanager/domain/entities/workspace_entity.dart';
import 'package:repomanager/app/repomanager/common/common.dart';

abstract class IWorkspaceRepository {
  Future<Either<Failure, List<WorkSpaceEntity>>> getWorkspaces();
  Future<Either<Failure, WorkSpaceEntity?>> getWorkspace(Directory workspacePath);
  Future<Either<Failure, WorkSpaceEntity>> createWorkspace(WorkSpaceEntity workspace);
  Future<Either<Failure, int>> updateWorkspace(WorkSpaceEntity workspace);
  Future<Either<Failure, int>> deleteWorkspace(Directory workspacePath);
}

