import 'package:repomanager/app/repomanager/domain/datasource/database_config.dart';
import 'package:repomanager/app/repomanager/infra/internal/sembast_config.dart';
import 'package:repomanager/app/repomanager/shared/injector/injector.dart';

class InjectorConfigurator {
  static void configure() {
    final injector = Injector.instance;

    final sembastConfig = SembastConfig();

    injector.register<IDatabaseConfig>(sembastConfig);
  }
}