sealed class Option<S> {
  const Option();

  bool get isNone => this is None;

  bool get isSome => this is Some<S>;

  T fold<T>(T Function() onNone, T Function(S some) onSome);
}

final class None<S> extends Option<S> {
  const None();

  @override
  T fold<T>(T Function() onNone, T Function(S some) onSome) => onNone();
}

final class Some<S> extends Option<S> {
  const Some(this.value);

  final S value;

  @override
  T fold<T>(T Function() onNone, T Function(S some) onSome) => onSome(value);
}
