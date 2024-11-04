import 'package:repomanager/app/repomanager/application/dto/workspace_dto.dart';
import 'package:repomanager/app/repomanager/domain/entities/workspace_entity.dart';
import 'package:repomanager/app/repomanager/domain/repository/workspace_repository.dart';
import 'package:repomanager/app/repomanager/domain/use-case/use_case_interface.dart';
import 'package:repomanager/app/repomanager/shared/either/either.dart';

class UpdateWorkspaceUseCaseParams extends IUseCaseParams {
  final WorkSpaceEntity workspace;

  UpdateWorkspaceUseCaseParams({required this.workspace});
}

class UpdateWorkspaceUseCase implements IUseCase<Future<WorkspaceDTO>> {
  final IWorkspaceRepository repository;

  UpdateWorkspaceUseCase({required this.repository});

  @override
  Future<WorkspaceDTO> execute(IUseCaseParams params) async {
    if(params is UpdateWorkspaceUseCaseParams) {
      Either response = await repository.updateWorkspace(params.workspace);

      return response.fold(
          (error) => throw Exception("Failed to update workspace"),
          (value) => WorkspaceDTO.fromEntity(value),
      );

    }
    throw Exception("Invalid params");
  }

}