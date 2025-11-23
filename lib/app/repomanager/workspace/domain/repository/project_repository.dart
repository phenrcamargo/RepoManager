import 'dart:io';

import 'package:repomanager/app/repomanager/core/domain/either/either.dart';
import 'package:repomanager/app/repomanager/core/domain/failure/failure.dart';
import 'package:repomanager/app/repomanager/workspace/domain/entities/project_entity.dart';

abstract class IProjectRepository {
  Future<Either<Failure, List<ProjectEntity>>> getProjects();
  Future<Either<Failure, List<ProjectEntity>>> getProjectsByWorkspace(Directory workspacePath);
  Future<Either<Failure, ProjectEntity?>> getProject(Directory path);
  Future<Either<Failure, ProjectEntity>> createProject(ProjectEntity project);
  Future<Either<Failure, int>> updateProject(ProjectEntity project);
  Future<Either<Failure, int>> deleteProject(Directory path, Directory workspacePath);
}