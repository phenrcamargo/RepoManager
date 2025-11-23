import 'package:repomanager/app/repomanager/core/domain/either/either.dart';
import 'package:repomanager/app/repomanager/core/domain/failure/failure.dart';
import 'package:repomanager/app/repomanager/core/domain/use_case/use_case_interface.dart';
import 'package:repomanager/app/repomanager/workspace/domain/entities/workspace_entity.dart';
import 'package:repomanager/app/repomanager/workspace/domain/repository/workspace_repository.dart';

class GetAllWorkspaceUseCase implements IUseCaseWithoutParams<Future<Either<Failure, List<WorkSpaceEntity>>>>{
  final IWorkspaceRepository repository;

  GetAllWorkspaceUseCase({ required this.repository });

  @override
  Future<Either<Failure, List<WorkSpaceEntity>>> execute() async{
    var response = await repository.getWorkspaces();

    return response;
  }
}