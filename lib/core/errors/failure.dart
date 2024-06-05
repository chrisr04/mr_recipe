abstract class Failure {
  const Failure(this.message);
  final String message;
}

class LocalFailure extends Failure {
  LocalFailure(super.message);
}
