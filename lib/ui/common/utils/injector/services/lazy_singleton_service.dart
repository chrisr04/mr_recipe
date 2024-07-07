import 'package:mr_recipe/ui/common/utils/injector/types/injector_types.dart';
import 'package:mr_recipe/ui/common/utils/injector/services/service.dart';

class LazySingletonService<T> extends Service<T> {
  LazySingletonService({
    super.onRemove,
    required this.create,
  });

  final ServiceCreator<T> create;
}
