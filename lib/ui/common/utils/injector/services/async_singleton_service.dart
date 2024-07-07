import 'package:mr_recipe/ui/common/utils/injector/types/injector_types.dart';
import 'package:mr_recipe/ui/common/utils/injector/services/service.dart';
import 'package:mr_recipe/ui/common/utils/injector/services/singleton_service.dart';

class AsyncSingletonService<T> extends Service<T> {
  AsyncSingletonService({
    super.onRemove,
    required this.create,
  });

  final AsyncServiceCreator<T> create;

  Future<SingletonService<T>> resolve() async => SingletonService<T>(
        instance: await create(),
        onRemove: onRemove,
      );
}
