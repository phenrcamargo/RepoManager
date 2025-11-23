import 'dart:io';

import 'package:repomanager/app/repomanager/core/domain/use_case/use_case_interface.dart';
import 'package:repomanager/app/repomanager/workspace/domain/entities/project_entity.dart';
import 'package:repomanager/app/repomanager/workspace/domain/repository/project_repository.dart';
import 'package:repomanager/app/repomanager/core/domain/either/either.dart';

class GetProjectUseCaseParams implements IUseCaseParams<GetProjectUseCase> {
  Directory path;
  GetProjectUseCaseParams({required this.path});
}

class GetProjectUseCase implements IUseCase<Future<ProjectEntity>, GetProjectUseCaseParams> {
  final IProjectRepository repository;

  GetProjectUseCase({required this.repository});

  @override
  Future<ProjectEntity> execute(GetProjectUseCaseParams params) async {
      Either response = await repository.getProject(params.path);

      return response.fold<ProjectEntity>(
        (error) => throw Exception("Failed to get project"),
        (value) => value,
      );
  }
}