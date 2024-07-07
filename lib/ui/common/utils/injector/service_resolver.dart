part of 'injector.dart';

abstract class _ServiceResolver {
  static T resolveNamedService<T>(
    Map<String, dynamic> namedServices,
    String name,
  ) {
    if (name.isEmpty || !namedServices.containsKey(name)) {
      throw StateError(
        'The service $T with name \'$name\' doesn\'t exist. '
        'make sure to register it before calling inject<$T>(\'$name\')',
      );
    }

    if (namedServices[name] is AsyncFactoryService<T>) {
      throw StateError(
        'The service $T can\'t be accessed via inject<$T>(\'$name\'). '
        'call inject.getAsync<$T>(\'$name\') instead',
      );
    }

    if (namedServices[name] is AsyncSingletonService<T>) {
      throw StateError(
        'The service $T must be resolved, '
        'make sure to call resolveAsync() before calling inject<$T>(\'$name\')',
      );
    }

    if (namedServices[name] is LazySingletonService<T>) {
      namedServices[name] = SingletonService<T>(
        instance: (namedServices[name] as LazySingletonService<T>).create(),
      );
    }

    return namedServices[name] is FactoryService<T>
        ? (namedServices[name] as FactoryService<T>).create()
        : (namedServices[name] as SingletonService<T>).instance;
  }

  static T resolveTypedService<T>(Map<Type, dynamic> typedServices) {
    if (typedServices[T] is AsyncFactoryService<T>) {
      throw StateError(
        'The service $T can\'t be accessed via inject<$T>(). '
        'call inject.getAsync<$T>() instead',
      );
    }

    if (typedServices[T] is AsyncSingletonService<T>) {
      throw StateError(
        'The service $T must be resolved, '
        'make sure to call resolveAsync() before calling inject<$T>()',
      );
    }

    if (typedServices[T] is LazySingletonService<T>) {
      typedServices[T] = SingletonService<T>(
        instance: (typedServices[T] as LazySingletonService<T>).create(),
      );
    }

    return typedServices[T] is FactoryService<T>
        ? (typedServices[T] as FactoryService<T>).create()
        : (typedServices[T] as SingletonService<T>).instance;
  }

  static Future<T> resolveNamedAsyncService<T>(
    Map<String, dynamic> namedServices,
    String name,
  ) {
    if (namedServices[name] is! AsyncFactoryService<T>) {
      throw StateError(
        '$T is not an async service, you must use inject<$T>(\'$name\') instead',
      );
    }

    return (namedServices[name] as AsyncFactoryService<T>).create();
  }

  static Future<T> resolveTypedAsyncService<T>(
    Map<Type, dynamic> typedServices,
  ) {
    if (typedServices[T] is! AsyncFactoryService<T>) {
      throw StateError(
        '$T is not an async service, you must use inject<$T>() instead',
      );
    }

    return (typedServices[T] as AsyncFactoryService<T>).create();
  }
}
