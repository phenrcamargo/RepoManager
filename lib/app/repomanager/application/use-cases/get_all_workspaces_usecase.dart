import 'package:repomanager/app/repomanager/domain/entities/workspace_entity.dart';
import 'package:repomanager/app/repomanager/domain/repository/workspace_repository.dart';
import 'package:repomanager/app/repomanager/domain/use-case/use_case_interface.dart';
import 'package:repomanager/app/repomanager/shared/either/either.dart';

class GetAllWorkspaceUseCase implements IUseCaseWithoutParams<Future<List<WorkSpaceEntity>>>{
  final IWorkspaceRepository repository;

  GetAllWorkspaceUseCase({ required this.repository });

  @override
  Future<List<WorkSpaceEntity>> execute() async{
    Either response = await repository.getWorkspaces();

    return response.fold(
        (error) => throw Exception("Failed to get workspaces"),
        (value) => value,
    );
  }
}