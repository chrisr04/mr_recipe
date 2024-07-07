import 'package:mr_recipe/ui/common/utils/injector/types/injector_types.dart';

abstract class Service<T> {
  Service({
    this.onRemove,
  });

  ServiceRemoved<T>? onRemove;
}
