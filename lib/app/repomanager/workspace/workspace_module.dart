import 'package:flutter/material.dart';
import 'package:repomanager/app/repomanager/core/infra/injector/bind.dart';
import 'package:repomanager/app/repomanager/core/infra/injector/injector.dart';
import 'package:repomanager/app/repomanager/core/interface_adapters/database/database_config.dart';
import 'package:repomanager/app/repomanager/core/presentation/module/app_module.dart';
import 'package:repomanager/app/repomanager/workspace/domain/repository/project_repository.dart';
import 'package:repomanager/app/repomanager/workspace/domain/repository/workspace_repository.dart';
import 'package:repomanager/app/repomanager/workspace/domain/use-cases/use_cases.dart';
import 'package:repomanager/app/repomanager/workspace/infra/repository/sembast_project_repository.dart';
import 'package:repomanager/app/repomanager/workspace/infra/repository/sembast_workspace_repository.dart';
import 'package:repomanager/app/repomanager/workspace/presentation/view/workspace_view.dart';
import 'package:repomanager/app/repomanager/workspace/presentation/view_model/workspace_view_model.dart';
import 'package:sembast/sembast.dart';

class WorkSpaceModule extends AppModule {
  static final WorkSpaceModule instance = WorkSpaceModule._(Injector.instance);

  final Injector _injector;

  WorkSpaceModule._(this._injector);

  @override
  void registerBinds() {
    _registerRepositories(_injector);
    _registerUseCases(_injector);
  }

  @override
  Map<String, WidgetBuilder> get routes => {
    '/': (context) => WorkSpaceView(viewModel: _injector.get<WorkSpaceViewModel>()),
  };

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