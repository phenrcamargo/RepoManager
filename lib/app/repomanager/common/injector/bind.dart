class Bind<T> {
  final T Function()? _factory;
  T? _instance;

  Bind.factory(this._factory);
  Bind.singleton(T instance) : _instance = instance, _factory = null;
  Bind.lazySingleton(T Function() factory) : _factory = factory, _instance = null;

  T getInstance() {
   if (_instance == null && _factory != null) {
     _instance = _factory();
   }
   return _instance!;
  }
}