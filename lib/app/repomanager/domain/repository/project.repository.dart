import 'dart:io';

import 'package:repomanager/app/repomanager/domain/entities/project.entity.dart';
import 'package:repomanager/app/repomanager/shared/either/either.dart';

abstract class IProjectRepository {
  Future<Either<void, List<ProjectEntity>>> getProjects();
  Future<Either<void, List<ProjectEntity>>> getProjectsByWorkspace(Directory workspacePath);
  Future<Either<void, ProjectEntity?>> getProject(Directory path);
  Future<Either<void, ProjectEntity>> createProject(ProjectEntity project);
  Future<Either<void, ProjectEntity>> updateProject(ProjectEntity project);
  Future<Either<void, void>> deleteProject(Directory path, Directory workspacePath);
}