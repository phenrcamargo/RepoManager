import 'dart:io';

import 'package:repomanager/app/repomanager/domain/entities/project_entity.dart';
import 'package:repomanager/app/repomanager/domain/failure/failure.dart';
import 'package:repomanager/app/repomanager/shared/either/either.dart';

abstract class IProjectRepository {
  Future<Either<Failure, List<ProjectEntity>>> getProjects();
  Future<Either<Failure, List<ProjectEntity>>> getProjectsByWorkspace(Directory workspacePath);
  Future<Either<Failure, ProjectEntity?>> getProject(Directory path);
  Future<Either<Failure, ProjectEntity>> createProject(ProjectEntity project);
  Future<Either<Failure, int>> updateProject(ProjectEntity project);
  Future<Either<Failure, int>> deleteProject(Directory path, Directory workspacePath);
}