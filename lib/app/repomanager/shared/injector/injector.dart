class Injector {
  final Map<Type, dynamic> _dependencies = {};

  static final Injector instance = Injector._internal();

  factory Injector() {
    return instance;
  }

  Injector._internal();

  void register<T>(T dependency) {
    _dependencies[T] = dependency;
  }

  void replaceBinds(List<Map<Type, dynamic>> binds) {
    for (var bind in binds) {
      _dependencies.addAll(bind);
    }
  }

  T get<T>() {
    return _dependencies[T] as T;
  }
}