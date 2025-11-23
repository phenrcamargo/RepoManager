import 'package:flutter/material.dart';
import 'package:repomanager/app/repomanager/core/presentation/module/app_module.dart';
import 'package:sembast/sembast.dart';

import 'interface_adapters/database/database_config.dart';
import 'infra/database/sembast_config.dart';
import 'infra/injector/bind.dart';
import 'infra/injector/injector.dart';

class CoreModule extends AppModule {
  static final CoreModule instance = CoreModule._(Injector.instance);

  final Injector _injector;
  CoreModule._(this._injector);

  @override
  void registerBinds() {
    _registerAndInitializeDatabase(_injector);
  }

  @override
  Map<String, WidgetBuilder> get routes => {};

  static Future<void> _registerAndInitializeDatabase(Injector injector) async {
    injector.register<IDatabaseConfig<Database>>(Bind.singleton(SembastConfig()));
    await Injector.instance.get<IDatabaseConfig<Database>>().init();
  }

}