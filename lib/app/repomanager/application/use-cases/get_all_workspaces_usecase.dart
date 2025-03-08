import 'package:repomanager/app/repomanager/domain/entities/workspace_entity.dart';
import 'package:repomanager/app/repomanager/common/failure/failure.dart';
import 'package:repomanager/app/repomanager/domain/repository/workspace_repository.dart';
import 'package:repomanager/app/repomanager/domain/use-case/use_case_interface.dart';
import 'package:repomanager/app/repomanager/common/either/either.dart';

class GetAllWorkspaceUseCase implements IUseCaseWithoutParams<Future<Either<Failure, List<WorkSpaceEntity>>>>{
  final IWorkspaceRepository repository;

  GetAllWorkspaceUseCase({ required this.repository });

  @override
  Future<Either<Failure, List<WorkSpaceEntity>>> execute() async{
    var response = await repository.getWorkspaces();

    return response;
  }
}