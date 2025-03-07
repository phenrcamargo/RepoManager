import 'package:repomanager/app/repomanager/common/injector/bind.dart';

class Injector {
  final Map<Type, dynamic> _dependencies = {};

  static final Injector instance = Injector._internal();

  factory Injector() {
    return instance;
  }

  Injector._internal();

  void register<T>(Bind<T> bind) {
    _dependencies[T] = bind;
  }

  void replaceBinds(List<Map<Type, dynamic>> binds) {
    for (var bind in binds) {
      _dependencies.addAll(bind);
    }
  }

  void unregister<T>() {
    _dependencies.remove(T);
  }

  void reset() {
    _dependencies.clear();
  }

  T get<T>() {
    final bind = _dependencies[T] as Bind<T>?;

    if (bind == null) {
      throw Exception("Dependency ${T.toString()} not found in Injector.");
    }

    return bind.getInstance();
  }
}