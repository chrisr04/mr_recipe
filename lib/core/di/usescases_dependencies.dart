part of 'di.dart';

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

class RecipeUsesCasesDependency extends InheritedWidget {
  const RecipeUsesCasesDependency({
    super.key,
    required super.child,
    required this.getRecipeWatcherUseCase,
    required this.closeRecipeWatcherUseCase,
    required this.getRecipesUseCase,
    required this.getRecipeByIdUseCase,
    required this.createRecipeUseCase,
    required this.updateRecipeUseCase,
    required this.deleteRecipeUseCase,
  });

  final GetRecipeWatcherUseCase getRecipeWatcherUseCase;
  final CloseRecipeWatcherUseCase closeRecipeWatcherUseCase;
  final GetRecipesUseCase getRecipesUseCase;
  final GetRecipeByIdUseCase getRecipeByIdUseCase;
  final CreateRecipeUseCase createRecipeUseCase;
  final UpdateRecipeUseCase updateRecipeUseCase;
  final DeleteRecipeUseCase deleteRecipeUseCase;

  static RecipeUsesCasesDependency of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<RecipeUsesCasesDependency>()!;
  }

  @override
  bool updateShouldNotify(RecipeUsesCasesDependency oldWidget) => false;
}
