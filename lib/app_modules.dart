import 'package:repomanager/app/repomanager/core/core_module.dart';
import 'package:repomanager/app/repomanager/core/presentation/module/app_module.dart';
import 'package:repomanager/app/repomanager/workspace/workspace_module.dart';

final appModules = <AppModule>[
  CoreModule.instance,
  WorkSpaceModule.instance,
];
