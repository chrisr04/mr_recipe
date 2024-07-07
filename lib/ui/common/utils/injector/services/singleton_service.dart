import 'package:mr_recipe/ui/common/utils/injector/services/service.dart';

class SingletonService<T> extends Service<T> {
  SingletonService({
    super.onDispose,
    required this.instance,
  });

  final T instance;
}
