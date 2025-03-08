import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:repomanager/app/repomanager/common/common.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    if (!themeProvider.isInitialized) {
      return const Center(child: CircularProgressIndicator(color: Colors.white, strokeWidth: 5, ));
    }

    return MaterialApp(
      title: 'RepoManager',
      theme: _lightTheme(),
      darkTheme: _darkTheme(),
      themeMode: themeProvider.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
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