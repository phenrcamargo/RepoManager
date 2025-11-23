import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repomanager/app/repomanager/core/presentation/theme/theme_provider.dart';
import 'package:window_manager/window_manager.dart';
import 'package:repomanager/app/repomanager/my_app.dart';

import 'app_modules.dart';

void main() async  {
  await _configureWindowManager();

  for (final module in appModules) {
    module.registerBinds();
  }

  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ],
        child: const MyApp(),
    ),
  );
}

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

