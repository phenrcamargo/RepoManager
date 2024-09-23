import 'dart:io';

import 'package:repomanager/app/repomanager/domain/repository/project.repository.dart';
import 'package:repomanager/app/repomanager/domain/use-case/use-case.interface.dart';
import 'package:repomanager/app/repomanager/shared/either/either.dart';

import '../dto/project.dto.dart';

class GetProjectUseCaseParams implements IUseCaseParams<GetProjectUseCase> {
  Directory path;
  GetProjectUseCaseParams({required this.path});
}

class GetProjectUseCase implements IUseCase<Future<ProjectDTO>> {
  final IProjectRepository repository;

  GetProjectUseCase({required this.repository});

  @override
  Future<ProjectDTO> execute(IUseCaseParams params) async {
    if(params is GetProjectUseCaseParams) {
      Either response = await repository.getProject(params.path);

      return response.fold<ProjectDTO>(
        (error) => throw Exception("Failed to get project"),
        (value) => ProjectDTO.fromEntity(value),
      );

    }
    throw Exception("Invalid params");
  }
}