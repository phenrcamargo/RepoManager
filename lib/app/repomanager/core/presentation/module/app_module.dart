import 'package:flutter/widgets.dart';

abstract class AppModule {
  void registerBinds();

  Map<String, WidgetBuilder> get routes;
}
