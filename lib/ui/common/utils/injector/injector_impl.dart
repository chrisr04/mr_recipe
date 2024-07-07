part of 'injector.dart';

class _InjectorImpl implements Injector {
  _InjectorImpl._();

  static final _instance = _InjectorImpl._();
  factory _InjectorImpl() => _instance;

  final _typedServices = <Type, dynamic>{};
  final _namedServices = <String, dynamic>{};

  T call<T>({String? name}) {
    if (name != null) {
      return _ServiceResolver.resolveNamedService<T>(_namedServices, name);
    }

    if (_typedServices.containsKey(T)) {
      return _ServiceResolver.resolveTypedService<T>(_typedServices);
    }

    throw StateError('The $T service wasn\'t registered');
  }

  @override
  Future<T> getAsync<T>({String? name}) {
    if (name != null && name.isNotEmpty && _namedServices.containsKey(name)) {
      return _ServiceResolver.resolveNamedAsyncService<T>(_namedServices, name);
    }

    if (_typedServices.containsKey(T)) {
      return _ServiceResolver.resolveTypedAsyncService<T>(_typedServices);
    }

    throw StateError('The $T service wasn\'t registered');
  }

  @override
  void addSingleton<T>(
    T instance, {
    String? name,
    ServiceRemoved<T>? onRemove,
  }) {
    final service = SingletonService<T>(
      onRemove: onRemove,
      instance: instance,
    );

    if (name != null) {
      _namedServices[name] = service;
      return;
    }

    _typedServices[T] = service;
  }

  @override
  void addAsyncSingleton<T>(
    AsyncServiceCreator<T> create, {
    String? name,
    ServiceRemoved<T>? onRemove,
  }) {
    final service = AsyncSingletonService<T>(
      onRemove: onRemove,
      create: create,
    );

    if (name != null) {
      _namedServices[name] = service;
      return;
    }

    _typedServices[T] = service;
  }

  @override
  void addLazySingleton<T>(
    ServiceCreator<T> create, {
    String? name,
    ServiceRemoved<T>? onRemove,
  }) {
    final service = LazySingletonService<T>(
      onRemove: onRemove,
      create: create,
    );

    if (name != null) {
      _namedServices[name] = service;
      return;
    }

    _typedServices[T] = service;
  }

  @override
  void addFactory<T>(
    ServiceCreator<T> create, {
    String? name,
    ServiceRemoved<T>? onRemove,
  }) {
    final service = FactoryService(
      onRemove: onRemove,
      create: create,
    );

    if (name != null) {
      _namedServices[name] = service;
      return;
    }

    _typedServices[T] = service;
  }

  @override
  void addAsyncFactory<T>(
    AsyncServiceCreator<T> create, {
    String? name,
    ServiceRemoved<T>? onRemove,
  }) {
    final service = AsyncFactoryService(
      onRemove: onRemove,
      create: create,
    );

    if (name != null) {
      _namedServices[name] = service;
      return;
    }

    _typedServices[T] = service;
  }

  @override
  Future<void> resolveAsync() async {
    for (final name in _namedServices.keys) {
      if (_namedServices[name] is AsyncSingletonService) {
        final service = _namedServices[name] as AsyncSingletonService;
        _namedServices[name] = await service.resolve();
      }
    }

    for (final type in _typedServices.keys) {
      if (_typedServices[type] is AsyncSingletonService) {
        final service = _typedServices[type] as AsyncSingletonService;
        _typedServices[type] = await service.resolve();
      }
    }
  }

  @override
  void remove<T>(T instance, {String? name}) {
    Service<T>? serviceRemoved;
    if (name != null && _namedServices.containsKey(name)) {
      serviceRemoved = _namedServices.remove(name) as Service<T>;
    } else if (_typedServices.containsKey(T)) {
      serviceRemoved = _typedServices.remove(T) as Service<T>;
    }

    if (serviceRemoved != null && serviceRemoved.onRemove != null) {
      serviceRemoved.onRemove!(instance);
    }
  }

  @override
  void clear() {
    _namedServices.clear();
    _typedServices.clear();
  }
}
