import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repomanager/app/repomanager/shared/injector/injector_configurator.dart';
import 'package:repomanager/app/repomanager/shared/route/routes.dart';
import 'package:window_manager/window_manager.dart';

void main() async  {
  configureDependencyInjector();
  await configureWindowManager();
  runApp(const MyApp());
}

void configureDependencyInjector() => InjectorConfigurator.configure();

Future<void> configureWindowManager() async {
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

class MyApp extends StatelessWidget {
  final bool isDarkTheme = false;

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RepoManager',
      theme: _lightTheme(),
      darkTheme: _darkTheme(),
      themeMode: isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      initialRoute: '/',
      routes: routes,
    );
  }

  ThemeData _lightTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
      useMaterial3: true,
      textTheme: GoogleFonts.poppinsTextTheme(),
    );
  }

  ThemeData _darkTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.green, brightness: Brightness.dark),
      useMaterial3: true,
      textTheme: GoogleFonts.poppinsTextTheme(),
    );
  }
}