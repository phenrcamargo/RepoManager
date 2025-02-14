import 'dart:io';

import 'package:repomanager/app/repomanager/domain/datasource/workspace_datasource.dart';
import 'package:repomanager/app/repomanager/domain/entities/workspace_entity.dart';

class SembastWorkspaceDataSource extends IWorkspaceDataSource {
  @override
  Future<void> createWorkSpace(WorkSpaceEntity workSpaceEntity) {
    // TODO: implement createWorkSpace
    throw UnimplementedError();
  }

  @override
  Future<void> deleteWorkSpace(Directory path) {
    // TODO: implement deleteWorkSpace
    throw UnimplementedError();
  }

  @override
  Future<WorkSpaceEntity?> getWorkSpaceByPath(Directory path) {
    // TODO: implement getWorkSpaceByPath
    throw UnimplementedError();
  }

  @override
  Future<List<WorkSpaceEntity>> getWorkSpaces() {
    // TODO: implement getWorkSpaces
    throw UnimplementedError();
  }

  @override
  Future<void> updateWorkSpace(WorkSpaceEntity workSpaceEntity) {
    // TODO: implement updateWorkSpace
    throw UnimplementedError();
  }
}