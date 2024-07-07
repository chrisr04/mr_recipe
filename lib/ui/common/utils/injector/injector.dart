import 'dart:async';
import 'package:mr_recipe/ui/common/utils/injector/services/services.dart';
import 'package:mr_recipe/ui/common/utils/injector/types/injector_types.dart';

part 'injector_impl.dart';
part 'service_resolver.dart';

abstract class Injector {
  static final inject = _InjectorImpl();

  void addSingleton<T>(
    T instance, {
    String? name,
    ServiceDisposer<T>? onDispose,
  });

  void addAsyncSingleton<T>(
    AsyncServiceCreator<T> create, {
    String? name,
    ServiceDisposer<T>? onDispose,
  });

  void addLazySingleton<T>(
    ServiceCreator<T> create, {
    String? name,
    ServiceDisposer<T>? onDispose,
  });

  void addFactory<T>(
    ServiceCreator<T> create, {
    String? name,
    ServiceDisposer<T>? onDispose,
  });

  void addAsyncFactory<T>(
    AsyncServiceCreator<T> create, {
    String? name,
    ServiceDisposer<T>? onDispose,
  });

  Future<T> getAsync<T>({String? name});

  Future<void> resolveAsync();

  void dispose<T>(T instance, {String? name});

  void clear();
}
