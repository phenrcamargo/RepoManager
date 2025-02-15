abstract class IDatabaseConfig<T> {
  Future<void> init();
  T get getDatabase;
}