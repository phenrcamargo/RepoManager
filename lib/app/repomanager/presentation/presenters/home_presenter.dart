import 'package:repomanager/app/repomanager/application/use-cases/create_workspace_usecase.dart';
import 'package:repomanager/app/repomanager/application/use-cases/get_all_workspaces_usecase.dart';
import 'package:repomanager/app/repomanager/domain/entities/workspace_entity.dart';
import 'package:repomanager/app/repomanager/presentation/stores/home_store.dart';
import 'package:repomanager/app/repomanager/common/common.dart';

class HomePresenter {
  final HomeStore homeStore;
  final CreateWorkspaceUseCase createWorkspaceUseCase = Injector.instance.get<CreateWorkspaceUseCase>();
  final GetAllWorkspaceUseCase getWorkspacesUseCase = Injector.instance.get<GetAllWorkspaceUseCase>();

  HomePresenter(this.homeStore) { loadWorkspaces(); }

  Future<void> loadWorkspaces() async {
    try {
        var response = await getWorkspacesUseCase.execute();

        response.fold(
          (error) => throw error,
          (value) => homeStore.setWorkspaces(value),
        );
    } catch (e) {
      if (e is DatabaseFailure) print(e.message);
    }
  }

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