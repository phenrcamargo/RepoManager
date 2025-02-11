import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:repomanager/app/repomanager/shared/route/routes.dart';

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