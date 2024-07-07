import 'dart:async';

typedef ServiceCreator<T> = T Function();

typedef AsyncServiceCreator<T> = Future<T> Function();

typedef ServiceRemoved<T> = FutureOr<void> Function(T);
