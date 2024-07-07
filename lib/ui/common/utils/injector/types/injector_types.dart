import 'dart:async';

typedef ServiceCreator<T> = T Function();

typedef AsyncServiceCreator<T> = Future<T> Function();

typedef ServiceDisposer<T> = void Function(T);
