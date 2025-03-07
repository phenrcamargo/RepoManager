import 'package:repomanager/app/repomanager/common/either/either.dart';
import 'package:repomanager/app/repomanager/domain/entities/project_entity.dart';
import 'package:repomanager/app/repomanager/domain/repository/project_repository.dart';
import 'package:repomanager/app/repomanager/domain/use-case/use_case_interface.dart';


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