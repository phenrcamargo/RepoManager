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

    injector.register<IDatabaseConfig<Database>>(SembastConfig());
    injector.register<IProjectRepository>(DatabaseProjectRepository(injector.get<IDatabaseConfig<Database>>()));
    injector.register<IWorkspaceRepository>(DatabaseWorkspaceRepository(injector.get<IDatabaseConfig<Database>>()));
  }
}