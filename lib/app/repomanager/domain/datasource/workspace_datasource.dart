import 'dart:io';

import 'package:repomanager/app/repomanager/domain/entities/workspace_entity.dart';

abstract class IWorkspaceDataSource {
  Future<List<WorkSpaceEntity>> getWorkSpaces();
  Future<WorkSpaceEntity?> getWorkSpaceByPath(Directory path);
  Future<void> createWorkSpace(WorkSpaceEntity workSpaceEntity);
  Future<void> updateWorkSpace(WorkSpaceEntity workSpaceEntity);
  Future<void> deleteWorkSpace(Directory path);
}