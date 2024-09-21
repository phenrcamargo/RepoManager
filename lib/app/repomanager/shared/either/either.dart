abstract class Either<L, R> {
  const Either();

  bool isLeft() => this is Left<L, R>;

  bool isRight() => this is Right<L, R>;

  L getLeft() {
    if (this is Left<L, R>) {
      return (this as Left<L, R>).value;
    } else {
      throw Exception("This Either is not a Left");
    }
  }

  R getRight() {
    if (this is Right<L, R>) {
      return (this as Right<L, R>).value;
    } else {
      throw Exception("This Either is not a Right");
    }
  }

  B fold<B>(B Function(L l) leftFn, B Function(R r) rightFn);
}

class Left<L, R> extends Either<L, R> {
  final L value;

  const Left(this.value);

  @override
  B fold<B>(B Function(L l) leftFn, B Function(R r) rightFn) {
    return leftFn(value);
  }
}

class Right<L, R> extends Either<L, R> {
  final R value;

  const Right(this.value);

  @override
  B fold<B>(B Function(L l) leftFn, B Function(R r) rightFn) {
    return rightFn(value);
  }
}
