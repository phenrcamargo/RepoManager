import 'dart:io';

import 'package:repomanager/app/repomanager/domain/datasource/database_config.dart';
import 'package:repomanager/app/repomanager/domain/datasource/project_datasource.dart';
import 'package:repomanager/app/repomanager/domain/entities/project_entity.dart';
import 'package:sembast/sembast.dart';

class SembastProjectDataSource extends IProjectDataSource {

  final IDatabaseConfig<Database> _database;
  late final Database _databaseInstance;
  late final StoreRef _store;

  SembastProjectDataSource(this._database) {
    _databaseInstance = _database.getDatabase;
    _store = intMapStoreFactory.store('projects');
  }

  @override
  Future<void> createProject(ProjectEntity project) async {
    await _store.add(_databaseInstance, project.toMap());
  }

  @override
  Future<void> deleteProject(Directory path, Directory workspacePath) async {
    final finder = Finder(
      filter: Filter.and([
        Filter.equals('path', path.path),
        Filter.equals('workspacePath', workspacePath.path),
      ]),
    );

    await _store.delete(_databaseInstance, finder: finder);
  }

  @override
  Future<ProjectEntity?> getProjectByPath(Directory path) async {
    final recordSnapshot  = await _store.findFirst(_databaseInstance, finder: Finder(filter: Filter.equals('path', path.path)));

    if (recordSnapshot  == null ) {
      return null;
    }

    if(recordSnapshot.value is! Map<String, dynamic>) {
      return null;
    }

    return ProjectEntity.fromMap(recordSnapshot.value as Map<String, dynamic>);
  }

  @override
  Future<List<ProjectEntity>> getProjects() {
    // TODO: implement getProjects
    throw UnimplementedError();
  }

  @override
  Future<List<ProjectEntity>> getProjectsByWorkspace(Directory workspacePath) {
    // TODO: implement getProjectsByWorkspace
    throw UnimplementedError();
  }

  @override
  Future<void> updateProject(ProjectEntity project) {
    // TODO: implement updateProject
    throw UnimplementedError();
  }
}