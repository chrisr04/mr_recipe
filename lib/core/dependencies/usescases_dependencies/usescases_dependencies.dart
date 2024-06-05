import 'package:flutter/material.dart';
import 'package:mr_recipe/domain/domain.dart';
import 'package:mr_recipe/core/dependencies/repository_dependencies/repository_dependencies.dart';

part 'recipe_usescases_dependency.dart';

class UsesCasesDependencies extends StatelessWidget {
  const UsesCasesDependencies({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return RecipeUsesCasesDependency(
      getRecipeWatcherUseCase: GetRecipeWatcherUseCase(
        RecipeRepositoryDependency.of(context),
      ),
      closeRecipeWatcherUseCase: CloseRecipeWatcherUseCase(
        RecipeRepositoryDependency.of(context),
      ),
      getRecipesUseCase: GetRecipesUseCase(
        RecipeRepositoryDependency.of(context),
      ),
      getRecipeByIdUseCase: GetRecipeByIdUseCase(
        RecipeRepositoryDependency.of(context),
      ),
      createRecipeUseCase: CreateRecipeUseCase(
        RecipeRepositoryDependency.of(context),
      ),
      updateRecipeUseCase: UpdateRecipeUseCase(
        RecipeRepositoryDependency.of(context),
      ),
      deleteRecipeUseCase: DeleteRecipeUseCase(
        RecipeRepositoryDependency.of(context),
      ),
      child: child,
    );
  }
}
