import 'package:mr_recipe/ui/common/utils/bloc/nested/nested.dart';

class MultiBlocInjector extends Nested {
  MultiBlocInjector({
    super.key,
    required super.child,
    required List<SingleChildWidget> injectors,
  }) : super(children: injectors);
}
