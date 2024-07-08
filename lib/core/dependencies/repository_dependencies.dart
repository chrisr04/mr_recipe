part of 'app_dependencies.dart';

void repositoryDependencies() {
  inject.addSingleton<RecipeRepository>(
    RecipeRepositoryImpl(
      recipeLocalDataSource: inject<RecipeLocalDataSource>(),
    ),
  );
}
