part of 'datasource_dependencies.dart';

class RecipeLocalDataSourceDependency extends InheritedWidget {
  const RecipeLocalDataSourceDependency({
    super.key,
    required super.child,
    required this.dataSource,
  });

  final RecipeLocalDataSource dataSource;

  static RecipeLocalDataSource of(BuildContext context) => context
      .dependOnInheritedWidgetOfExactType<RecipeLocalDataSourceDependency>()!
      .dataSource;

  @override
  bool updateShouldNotify(RecipeLocalDataSourceDependency oldWidget) => false;
}
