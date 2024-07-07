import 'package:mr_recipe/ui/common/utils/bloc/nested/nested.dart';

class MultiBlocListener extends Nested {
  MultiBlocListener({
    super.key,
    required super.child,
    required List<SingleChildWidget> listeners,
  }) : super(children: listeners);
}
