import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repomanager/app/repomanager/shared/injector/injector.dart';
import 'package:window_manager/window_manager.dart';
import 'package:repomanager/app/repomanager/my_app.dart';
import 'package:repomanager/app/repomanager/presentation/pages/home/home_store.dart';
import 'package:repomanager/app/repomanager/shared/injector/injector_configurator.dart';

import 'app/repomanager/domain/database/database_config.dart';

void main() async  {
  _configureDependencyInjector();
  await _initDatabase();
  await _configureWindowManager();
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => HomeStore()),
        ],
        child: const MyApp(),
    ),
  );
}

void _configureDependencyInjector() => InjectorConfigurator.configure();

Future<void> _initDatabase() async => await Injector.instance.get<IDatabaseConfig>()?.init();

Future<void> _configureWindowManager() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(800, 800),
    minimumSize: Size(800, 800),
    maximumSize: Size(800, 800),
    center: true,
    skipTaskbar: false,
    title: 'RepoManager',
    titleBarStyle: TitleBarStyle.normal,
    windowButtonVisibility: true,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
}

