part of 'bloc_dependencies.dart';

class RecipeFormBlocDependency extends InheritedWidget {
  const RecipeFormBlocDependency({
    super.key,
    required super.child,
    required this.create,
  });

  final RecipeFormBloc Function(BuildContext context) create;

  static RecipeFormBloc of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<RecipeFormBlocDependency>()!
      .create(context);

  @override
  bool updateShouldNotify(RecipeFormBlocDependency oldWidget) => false;
}
