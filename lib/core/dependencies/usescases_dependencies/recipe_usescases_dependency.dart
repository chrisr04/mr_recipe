part of 'usescases_dependencies.dart';

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
