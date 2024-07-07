part of 'dependencies.dart';

void blocDependencies() {
  inject.addFactory<HomeBloc>(
    () => HomeBloc(
      inject<GetRecipesUseCase>(),
      inject<GetRecipeWatcherUseCase>(),
      inject<CloseRecipeWatcherUseCase>(),
    ),
  );
  inject.addFactory<RecipeDetailBloc>(
    () => RecipeDetailBloc(
      inject<GetRecipeByIdUseCase>(),
      inject<DeleteRecipeUseCase>(),
    ),
  );
  inject.addFactory<RecipeFormBloc>(
    () => RecipeFormBloc(
      inject<GetRecipeByIdUseCase>(),
      inject<CreateRecipeUseCase>(),
      inject<UpdateRecipeUseCase>(),
    ),
  );
}
