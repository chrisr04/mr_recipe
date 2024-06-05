import 'package:flutter/material.dart';
import 'package:mr_recipe/data/data.dart';
import 'package:mr_recipe/core/dependencies/core_dependencies/core_dependencies.dart';

part 'recipe_local_datasource_dependency.dart';

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
