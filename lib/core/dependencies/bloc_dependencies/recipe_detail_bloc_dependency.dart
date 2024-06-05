part of 'bloc_dependencies.dart';

class RecipeDetailBlocDependency extends InheritedWidget {
  const RecipeDetailBlocDependency({
    super.key,
    required super.child,
    required this.create,
  });

  final RecipeDetailBloc Function(BuildContext context) create;

  static RecipeDetailBloc of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<RecipeDetailBlocDependency>()!
      .create(context);

  @override
  bool updateShouldNotify(RecipeDetailBlocDependency oldWidget) => false;
}
