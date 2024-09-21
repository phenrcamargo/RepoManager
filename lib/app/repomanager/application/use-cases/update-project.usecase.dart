import 'package:repomanager/app/repomanager/application/dto/project.dto.dart';
import 'package:repomanager/app/repomanager/domain/entities/project.entity.dart';
import 'package:repomanager/app/repomanager/domain/repository/project.repository.dart';
import 'package:repomanager/app/repomanager/domain/use-cases/use-case.interface.dart';
import 'package:repomanager/app/repomanager/shared/either/either.dart';

class UpdateProjectUseCaseParams implements IUseCaseParams<UpdateProjectUseCase> {
  final ProjectEntity projectEntity;

  UpdateProjectUseCaseParams({required this.projectEntity});
}

class UpdateProjectUseCase implements IUseCase<Future<ProjectDTO>> {
  final IProjectRepository repository;

  UpdateProjectUseCase({ required this.repository} );

  @override
  Future<ProjectDTO> execute(IUseCaseParams params) async {
    if(params is UpdateProjectUseCaseParams) {
      Either response = await repository.updateProject(params.projectEntity);

      return response.fold<ProjectDTO>(
        (error) => throw Exception("Failed to update project"),
        (value) => ProjectDTO.fromEntity(value),
      );
    }
    throw Exception("Invalid params");
  }



}
