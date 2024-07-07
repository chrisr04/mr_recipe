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
    ServiceRemoved<T>? onRemove,
  });

  void addAsyncSingleton<T>(
    AsyncServiceCreator<T> create, {
    String? name,
    ServiceRemoved<T>? onRemove,
  });

  void addLazySingleton<T>(
    ServiceCreator<T> create, {
    String? name,
    ServiceRemoved<T>? onRemove,
  });

  void addFactory<T>(
    ServiceCreator<T> create, {
    String? name,
    ServiceRemoved<T>? onRemove,
  });

  void addAsyncFactory<T>(
    AsyncServiceCreator<T> create, {
    String? name,
    ServiceRemoved<T>? onRemove,
  });

  Future<T> getAsync<T>({String? name});

  Future<void> resolveAsync();

  void remove<T>(T instance, {String? name});

  void clear();
}
