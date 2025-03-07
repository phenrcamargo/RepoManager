import 'package:repomanager/app/repomanager/application/use-cases/create_workspace_usecase.dart';
import 'package:repomanager/app/repomanager/domain/entities/workspace_entity.dart';
import 'package:repomanager/app/repomanager/infra/failure/database_failure.dart';
import 'package:repomanager/app/repomanager/presentation/pages/home/home_store.dart';
import 'package:repomanager/app/repomanager/common/injector/injector.dart';

class HomePresenter {
  final HomeStore homeStore;
  final CreateWorkspaceUseCase createWorkspaceUseCase = Injector.instance.get<CreateWorkspaceUseCase>();

  HomePresenter(this.homeStore);

  Future<void> addWorkspace(WorkSpaceEntity workspace) async {
    try {
      var response = await createWorkspaceUseCase.execute(
          CreateWorkspaceUseCaseParams(
              path: workspace.path,
              name: workspace.name,
              description: workspace.description ?? "",
          )
      );

      response.fold(
        (error) => throw error,
        (value) => homeStore.addWorkspace(value),
      );
    } catch (e) {
      if (e is DatabaseFailure)
        print(e.message);
    }
  }
}