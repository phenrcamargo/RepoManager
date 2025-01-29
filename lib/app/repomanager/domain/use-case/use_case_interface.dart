abstract class IUseCaseParams<T> {}

abstract class IUseCase<T, P extends IUseCaseParams> {
  T execute(P params);
}

abstract class IUseCaseWithoutParams<T> {
  T execute();
}