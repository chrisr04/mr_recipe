import 'package:mr_recipe/ui/common/utils/injector/types/injector_types.dart';

abstract class Service<T> {
  Service({
    this.onDispose,
  });

  ServiceDisposer<T>? onDispose;
}
