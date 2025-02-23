import 'package:repomanager/app/repomanager/application/use-cases/use_cases.dart';
import 'package:repomanager/app/repomanager/domain/database/database_config.dart';
import 'package:repomanager/app/repomanager/domain/repository/project_repository.dart';
import 'package:repomanager/app/repomanager/domain/repository/workspace_repository.dart';
import 'package:repomanager/app/repomanager/infra/database/sembast_config.dart';
import 'package:repomanager/app/repomanager/infra/repository/sembast_project_repository.dart';
import 'package:repomanager/app/repomanager/infra/repository/sembast_workspace_repository.dart';
import 'package:repomanager/app/repomanager/shared/injector/bind.dart';
import 'package:repomanager/app/repomanager/shared/injector/injector.dart';
import 'package:sembast/sembast.dart';

class InjectorConfigurator {
  static void configure(Injector injector) {
    _registerDatabase(injector);
    _registerRepositories(injector);
    _registerUseCases(injector);
  }

  static void _registerDatabase(Injector injector) {
    injector.register<IDatabaseConfig<Database>>(Bind.singleton(SembastConfig()));
  }

  static void _registerRepositories(Injector injector) {
    injector.register<IProjectRepository>(Bind.factory(() => SembastProjectRepository(injector.get<IDatabaseConfig<Database>>())));
    injector.register<IWorkspaceRepository>(Bind.factory(() => SembastWorkspaceRepository(injector.get<IDatabaseConfig<Database>>())));
  }

  static void _registerUseCases(Injector injector) {
    injector.register<CreateProjectUseCase>(
      Bind.lazySingleton(
            () => CreateProjectUseCase(repository: injector.get<IProjectRepository>()),
      ),
    );
    injector.register<CreateWorkspaceUseCase>(
      Bind.lazySingleton(
            () => CreateWorkspaceUseCase(repository: injector.get<IWorkspaceRepository>()),
      ),
    );
    injector.register<DeleteProjectUseCase>(
      Bind.lazySingleton(
            () => DeleteProjectUseCase(repository: injector.get<IProjectRepository>()),
      ),
    );
    injector.register<DeleteWorkspaceUseCase>(
      Bind.lazySingleton(
            () => DeleteWorkspaceUseCase(projectRepository: injector.get<IProjectRepository>(), workspaceRepository: injector.get<IWorkspaceRepository>()),
      ),
    );
    injector.register<GetProjectUseCase>(
      Bind.lazySingleton(
            () => GetProjectUseCase(repository: injector.get<IProjectRepository>()),
      ),
    );
    injector.register<GetProjectsByWorkspaceUseCase>(
      Bind.lazySingleton(
            () => GetProjectsByWorkspaceUseCase(repository: injector.get<IProjectRepository>()),
      ),
    );
    injector.register<GetAllProjectsUseCase>(
      Bind.lazySingleton(
            () => GetAllProjectsUseCase(repository: injector.get<IProjectRepository>()),
      ),
    );
    injector.register<GetWorkspaceByPathUseCase>(
      Bind.lazySingleton(
            () => GetWorkspaceByPathUseCase(repository: injector.get<IWorkspaceRepository>()),
      ),
    );
    injector.register<GetAllWorkspaceUseCase>(
      Bind.lazySingleton(
            () => GetAllWorkspaceUseCase(repository: injector.get<IWorkspaceRepository>()),
      ),
    );
    injector.register<UpdateProjectUseCase>(
      Bind.lazySingleton(
            () => UpdateProjectUseCase(repository: injector.get<IProjectRepository>()),
      ),
    );
    injector.register<UpdateWorkspaceUseCase>(
      Bind.lazySingleton(
            () => UpdateWorkspaceUseCase(repository: injector.get<IWorkspaceRepository>()),
      ),
    );
    injector.register<GetBranchStatusProjectUseCase>(
      Bind.lazySingleton(
            () => GetBranchStatusProjectUseCase(),
      ),
    );
  }
}