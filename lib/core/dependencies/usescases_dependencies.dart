part of 'dependencies.dart';

void usescasesDependencies() {
  inject.addSingleton<GetRecipeWatcherUseCase>(
    GetRecipeWatcherUseCase(inject<RecipeRepository>()),
  );
  inject.addSingleton<CloseRecipeWatcherUseCase>(
    CloseRecipeWatcherUseCase(inject<RecipeRepository>()),
  );
  inject.addSingleton<GetRecipesUseCase>(
    GetRecipesUseCase(inject<RecipeRepository>()),
  );
  inject.addSingleton<GetRecipeByIdUseCase>(
    GetRecipeByIdUseCase(inject<RecipeRepository>()),
  );
  inject.addSingleton<CreateRecipeUseCase>(
    CreateRecipeUseCase(inject<RecipeRepository>()),
  );
  inject.addSingleton<UpdateRecipeUseCase>(
    UpdateRecipeUseCase(inject<RecipeRepository>()),
  );
  inject.addSingleton<DeleteRecipeUseCase>(
    DeleteRecipeUseCase(inject<RecipeRepository>()),
  );
}
