import 'package:repomanager/app/repomanager/application/dto/workspace_dto.dart';
import 'package:repomanager/app/repomanager/domain/repository/workspace_repository.dart';
import 'package:repomanager/app/repomanager/domain/use-case/use_case_interface.dart';
import 'package:repomanager/app/repomanager/shared/either/either.dart';

class WorkspaceUseCase implements IUseCaseWithoutParams<Future<List<WorkspaceDTO>>>{
  final IWorkspaceRepository repository;

  WorkspaceUseCase({ required this.repository });

  @override
  Future<List<WorkspaceDTO>> execute() async{
    Either response = await repository.getWorkspaces();

    return response.fold(
        (error) => throw Exception("Failed to get workspaces"),
        (value) => value.map((e) => WorkspaceDTO.fromEntity(e)).toList()
    );
  }
}