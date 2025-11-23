import 'package:repomanager/app/repomanager/core/domain/either/either.dart';
import 'package:repomanager/app/repomanager/core/domain/use_case/use_case_interface.dart';
import 'package:repomanager/app/repomanager/workspace/domain/entities/project_entity.dart';
import 'package:repomanager/app/repomanager/workspace/domain/repository/project_repository.dart';

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
