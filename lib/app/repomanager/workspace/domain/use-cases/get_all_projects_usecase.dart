import 'package:repomanager/app/repomanager/core/domain/either/either.dart';
import 'package:repomanager/app/repomanager/core/domain/use_case/use_case_interface.dart';
import 'package:repomanager/app/repomanager/workspace/domain/entities/project_entity.dart';
import 'package:repomanager/app/repomanager/workspace/domain/repository/project_repository.dart';

class GetAllProjectsUseCase implements IUseCaseWithoutParams<Future<List<ProjectEntity>>>{
  final IProjectRepository repository;

  GetAllProjectsUseCase({
    required this.repository
  });

  @override
  Future<List<ProjectEntity>> execute() async {
    Either response = await repository.getProjects();

    return response.fold(
      (error) => throw Exception("Failed to get projects"),
      (value) => value,
    );
  }
}