import 'package:mr_recipe/ui/common/utils/injector/types/injector_types.dart';
import 'package:mr_recipe/ui/common/utils/injector/services/service.dart';

class AsyncFactoryService<T> extends Service<T> {
  AsyncFactoryService({
    super.onDispose,
    required this.create,
  });

  final AsyncServiceCreator<T> create;
}
