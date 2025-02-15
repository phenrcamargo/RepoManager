import 'package:repomanager/app/repomanager/application/use-cases/create_project_usecase.dart';
import 'package:repomanager/app/repomanager/application/use-cases/create_workspace_usecase.dart';
import 'package:repomanager/app/repomanager/application/use-cases/delete_project_usecase.dart';
import 'package:repomanager/app/repomanager/application/use-cases/delete_workspace_usecase.dart';
import 'package:repomanager/app/repomanager/application/use-cases/get_all_workspaces_usecase.dart';
import 'package:repomanager/app/repomanager/application/use-cases/get_branch_status_project_usecase.dart';
import 'package:repomanager/app/repomanager/application/use-cases/get_project_usecase.dart';
import 'package:repomanager/app/repomanager/application/use-cases/get_projects_by_workspace_usecase.dart';
import 'package:repomanager/app/repomanager/application/use-cases/get_all_projects_usecase.dart';
import 'package:repomanager/app/repomanager/application/use-cases/get_workspace_by_path_usecase.dart';
import 'package:repomanager/app/repomanager/application/use-cases/update_project_usecase.dart';
import 'package:repomanager/app/repomanager/application/use-cases/update_workspace_usecase.dart';
import 'package:repomanager/app/repomanager/domain/database/database_config.dart';
import 'package:repomanager/app/repomanager/domain/repository/project_repository.dart';
import 'package:repomanager/app/repomanager/domain/repository/workspace_repository.dart';
import 'package:repomanager/app/repomanager/infra/database/sembast_config.dart';
import 'package:repomanager/app/repomanager/infra/repository/database_project_repository.dart';
import 'package:repomanager/app/repomanager/infra/repository/database_workspace_repository.dart';
import 'package:repomanager/app/repomanager/shared/injector/injector.dart';
import 'package:sembast/sembast.dart';

class InjectorConfigurator {
  static void configure() {
    final injector = Injector.instance;

    //DATABASE
    injector.register<IDatabaseConfig<Database>>(SembastConfig());

    //REPOSITORIES
    injector.register<IProjectRepository>(DatabaseProjectRepository(injector.get<IDatabaseConfig<Database>>()));
    injector.register<IWorkspaceRepository>(DatabaseWorkspaceRepository(injector.get<IDatabaseConfig<Database>>()));

    //USE CASES
    injector.register<CreateProjectUseCase>(CreateProjectUseCase(repository: injector.get<IProjectRepository>()));
    injector.register<CreateWorkspaceUseCase>(CreateWorkspaceUseCase(repository: injector.get<IWorkspaceRepository>()));
    injector.register<DeleteProjectUseCase>(DeleteProjectUseCase(repository: injector.get<IProjectRepository>()));
    injector.register<DeleteWorkspaceUseCase>(DeleteWorkspaceUseCase(projectRepository: injector.get<IProjectRepository>(), workspaceRepository: injector.get<IWorkspaceRepository>()));
    injector.register<GetProjectUseCase>(GetProjectUseCase(repository: injector.get<IProjectRepository>()));
    injector.register<GetProjectsByWorkspaceUseCase>(GetProjectsByWorkspaceUseCase(repository: injector.get<IProjectRepository>()));
    injector.register<GetAllProjectsUseCase>(GetAllProjectsUseCase(repository: injector.get<IProjectRepository>()));
    injector.register<GetWorkspaceByPathUseCase>(GetWorkspaceByPathUseCase(repository: injector.get<IWorkspaceRepository>()));
    injector.register<GetAllWorkspaceUseCase>(GetAllWorkspaceUseCase(repository: injector.get<IWorkspaceRepository>()));
    injector.register<UpdateProjectUseCase>(UpdateProjectUseCase(repository: injector.get<IProjectRepository>()));
    injector.register<UpdateWorkspaceUseCase>(UpdateWorkspaceUseCase(repository: injector.get<IWorkspaceRepository>()));
    injector.register<GetBranchStatusProjectUseCase>(GetBranchStatusProjectUseCase());

  }
}