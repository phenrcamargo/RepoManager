import 'package:repomanager/app/repomanager/domain/entities/project_entity.dart';
import 'package:repomanager/app/repomanager/domain/repository/project_repository.dart';
import 'package:repomanager/app/repomanager/domain/use-case/use_case_interface.dart';
import 'package:repomanager/app/repomanager/shared/either/either.dart';

class UpdateProjectUseCaseParams implements IUseCaseParams<UpdateProjectUseCase> {
  final ProjectEntity projectEntity;

  UpdateProjectUseCaseParams({required this.projectEntity});
}

class UpdateProjectUseCase implements IUseCase<Future<ProjectEntity>, UpdateProjectUseCaseParams> {
  final IProjectRepository repository;

  UpdateProjectUseCase({ required this.repository} );

  @override
  Future<ProjectEntity> execute(UpdateProjectUseCaseParams params) async {
      Either response = await repository.updateProject(params.projectEntity);

      return response.fold<ProjectEntity>(
        (error) => throw Exception("Failed to update project"),
        (value) => value,
      );
  }
}
