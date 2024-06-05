part of 'repository_dependencies.dart';

class RecipeRepositoryDependency extends InheritedWidget {
  const RecipeRepositoryDependency({
    super.key,
    required super.child,
    required this.repository,
  });

  final RecipeRepository repository;

  static RecipeRepository of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<RecipeRepositoryDependency>()!
        .repository;
  }

  @override
  bool updateShouldNotify(RecipeRepositoryDependency oldWidget) => false;
}
