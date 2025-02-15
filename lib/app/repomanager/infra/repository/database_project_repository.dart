import 'dart:io';

import 'package:repomanager/app/repomanager/domain/database/database_config.dart';
import 'package:repomanager/app/repomanager/domain/entities/project_entity.dart';
import 'package:repomanager/app/repomanager/domain/failure/failure.dart';
import 'package:repomanager/app/repomanager/domain/repository/project_repository.dart';
import 'package:repomanager/app/repomanager/infra/failure/database_failure.dart';
import 'package:repomanager/app/repomanager/shared/either/either.dart';
import 'package:sembast/sembast.dart';

class DatabaseProjectRepository extends IProjectRepository {

  final IDatabaseConfig<Database> _database;
  late final Database _databaseInstance;
  late final StoreRef _store;

  DatabaseProjectRepository(this._database) {
    _databaseInstance = _database.getDatabase;
    _store = intMapStoreFactory.store('projects');
  }

  @override
  Future<Either<Failure, ProjectEntity>> createProject(ProjectEntity project) async {
    try {
      await _store.add(_databaseInstance, project.toMap());
      return Right(project);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> deleteProject(Directory path, Directory workspacePath) async {
    try {
      final finder = Finder(
        filter: Filter.and([
          Filter.equals('path', path.path),
          Filter.equals('workspacePath', workspacePath.path),
        ]),
      );

      var deletedRecords = await _store.delete(_databaseInstance, finder: finder);

      return Right(deletedRecords);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProjectEntity?>> getProject(Directory path) async {
    try {
      final recordSnapshot  = await _store.findFirst(_databaseInstance, finder: Finder(filter: Filter.equals('path', path.path)));

      if (recordSnapshot  == null ) {
        return Left(DatabaseFailure("Project not found"));
      }

      if(recordSnapshot.value is! Map<String, dynamic>) {
        return Left(DatabaseFailure("Project format is invalid"));
      }

      return Right(ProjectEntity.fromMap(recordSnapshot.value as Map<String, dynamic>));
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProjectEntity>>> getProjects() async {
    try {
      final recordSnapshots = await _store.find(_databaseInstance);

      if (recordSnapshots.isEmpty) {
        return Left(DatabaseFailure("No projects found"));
      }

      if (recordSnapshots.any((snapshot) => snapshot.value is! Map<String, dynamic>)) {
        return Left(DatabaseFailure("There is project with invalid format"));
      }

      return Right(recordSnapshots.map((snapshot) => ProjectEntity.fromMap(snapshot.value as Map<String, dynamic>)).toList());
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProjectEntity>>> getProjectsByWorkspace(Directory workspacePath) async {
    try {
      final recordSnapshots = await _store.find(_databaseInstance, finder: Finder(filter: Filter.equals('workspacePath', workspacePath.path)));

      if (recordSnapshots.isEmpty) {
        return Left(DatabaseFailure("No projects found"));
      }

      if (recordSnapshots.any((snapshot) => snapshot.value is! Map<String, dynamic>)) {
        return Left(DatabaseFailure("There is project with invalid format"));
      }

      return Right(recordSnapshots.map((snapshot) => ProjectEntity.fromMap(snapshot.value as Map<String, dynamic>)).toList());
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, int>> updateProject(ProjectEntity project) async {
    try {
      final finder = Finder(
        filter: Filter.and([
          Filter.equals('path', project.path.path),
          Filter.equals('workspacePath', project.workspacePath.path),
        ]),
      );

      var updatedRecords = await _store.update(_databaseInstance, project, finder: finder);

      return Right(updatedRecords);
    } catch (e) {
      return Left(DatabaseFailure(e.toString()));
    }
  }
}