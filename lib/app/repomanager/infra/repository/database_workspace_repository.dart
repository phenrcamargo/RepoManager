import 'dart:io';

import 'package:repomanager/app/repomanager/domain/database/database_config.dart';
import 'package:repomanager/app/repomanager/domain/entities/workspace_entity.dart';
import 'package:repomanager/app/repomanager/domain/failure/failure.dart';
import 'package:repomanager/app/repomanager/domain/repository/workspace_repository.dart';
import 'package:repomanager/app/repomanager/infra/failure/database_failure.dart';
import 'package:repomanager/app/repomanager/shared/either/either.dart';
import 'package:sembast/sembast.dart';

class DatabaseWorkspaceRepository extends IWorkspaceRepository {

  late final IDatabaseConfig<Database> _database;
  late final Database _databaseInstance;
  late final StoreRef _store;

  DatabaseWorkspaceRepository(
      IDatabaseConfig<Database>? databaseConfig
  ) {
    if (databaseConfig == null) throw Exception("Database config must not be null");
    _database = databaseConfig;
    _databaseInstance = _database.getDatabase;
    _store = intMapStoreFactory.store('workspaces');
  }

  @override
  Future<Either<Failure, WorkSpaceEntity>> createWorkspace(WorkSpaceEntity workspace) async {
    try {
      await _store.add(_databaseInstance, workspace);
      return Right(workspace);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> deleteWorkspace(Directory workspacePath) async {
    try {
      var deletedWorkspaces = await _store.delete(_databaseInstance, finder: Finder(filter: Filter.equals('path', workspacePath.path)));
      return Right(deletedWorkspaces);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, WorkSpaceEntity?>> getWorkspace(Directory workspacePath) async {
    try {
      var recordSnapshot = await _store.findFirst(_databaseInstance, finder: Finder(filter: Filter.equals('path', workspacePath.path)));

      if (recordSnapshot == null) {
        return Left(DatabaseFailure("Workspace not found"));
      }

      if (recordSnapshot.value is! Map<String, dynamic>) {
        return Left(DatabaseFailure("Workspace format invalid"));
      }

      return Right(WorkSpaceEntity.fromMap(recordSnapshot.value as Map<String, dynamic>));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<WorkSpaceEntity>>> getWorkspaces() async {
    try {
      var recordSnapshots = await _store.find(_databaseInstance);

      if (recordSnapshots.isEmpty) {
        return Left(DatabaseFailure("No workspaces found"));
      }

      if (recordSnapshots.any((snapshot) => snapshot is! Map<String, dynamic>)) {
        return Left(DatabaseFailure("There is workspace with invalid format"));
      }

      return Right(recordSnapshots.map((snapshot) => WorkSpaceEntity.fromMap(snapshot.value as Map<String, dynamic>)).toList());
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> updateWorkspace(WorkSpaceEntity workspace) async {
    try {
      var updatedWorkspaces = await _store.update(_databaseInstance, workspace, finder: Finder(filter: Filter.equals('path', workspace.path.path)));

      return Right(updatedWorkspaces);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}