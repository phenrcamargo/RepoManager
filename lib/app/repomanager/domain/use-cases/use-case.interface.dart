abstract class IUseCaseParams<T> {}

abstract class IUseCase<T> {
  T execute(IUseCaseParams params);
}

abstract class IUseCaseWithoutParams<T> {
  T execute();
}