class Injector {
  // Mapa para armazenar as dependências registradas
  final Map<Type, dynamic> _dependencies = {};

  // Instância singleton da classe
  static final Injector instance = Injector._internal();

  // Construtor privado para garantir que apenas uma instância da classe seja criada
  factory Injector() {
    return instance;
  }

  Injector._internal();

  // Método para registrar uma dependência
  void register<T>(T dependency) {
    _dependencies[T] = dependency;
  }

  void replaceBinds(List<Map<Type, dynamic>> binds) {
    for (var bind in binds) {
      _dependencies.addAll(bind);
    }
  }

  // Método para obter uma dependência
  T? get<T>() {
    return _dependencies[T] as T?;
  }
}