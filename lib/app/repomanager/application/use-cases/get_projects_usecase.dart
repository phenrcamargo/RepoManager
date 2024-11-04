import 'package:repomanager/app/repomanager/application/dto/project_dto.dart';
import 'package:repomanager/app/repomanager/domain/repository/project_repository.dart';
import 'package:repomanager/app/repomanager/domain/use-case/use_case_interface.dart';

import '../../shared/either/either.dart';

class GetProjectsUseCase implements IUseCaseWithoutParams<Future<List<ProjectDTO>>>{
  final IProjectRepository repository;

  GetProjectsUseCase({
    required this.repository
  });

  @override
  Future<List<ProjectDTO>> execute() async {
    Either response = await repository.getProjects();

    return response.fold(
      (error) => throw Exception("Failed to get projects"),
      (value) => value.map((e) => ProjectDTO.fromEntity(e)).toList()
    );

  }


}