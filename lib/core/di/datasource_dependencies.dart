part of 'di.dart';

class DataSourceDependencies extends StatelessWidget {
  const DataSourceDependencies({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RecipeLocalDataSourceDependency(
      dataSource: RecipeLocalDataSource(
        dataManager: DataManagerDependency.of(context),
      ),
      child: child,
    );
  }
}

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
