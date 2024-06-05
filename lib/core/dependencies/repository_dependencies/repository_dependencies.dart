import 'package:flutter/material.dart';
import 'package:mr_recipe/data/data.dart';
import 'package:mr_recipe/domain/domain.dart';
import 'package:mr_recipe/core/dependencies/datasource_dependencies/datasource_dependencies.dart';

part 'recipe_repository_dependency.dart';

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
