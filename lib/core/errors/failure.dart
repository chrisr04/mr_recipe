part 'local_failure.dart';

abstract class Failure {
  const Failure(this.message);
  final String message;
}
