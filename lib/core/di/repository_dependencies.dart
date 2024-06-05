part of 'di.dart';

class RepositoryDependencies extends StatelessWidget {
  const RepositoryDependencies({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RecipeRepositoryDependency(
      repository: RecipeRepositoryImpl(
        recipeLocalDataSource: RecipeLocalDataSourceDependency.of(context),
      ),
      child: child,
    );
  }
}

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
