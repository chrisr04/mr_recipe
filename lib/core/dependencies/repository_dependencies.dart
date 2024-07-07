part of 'dependencies.dart';

void repositoryDependencies() {
  inject.addSingleton<RecipeRepository>(
    RecipeRepositoryImpl(
      recipeLocalDataSource: inject<RecipeLocalDataSource>(),
    ),
  );
}
