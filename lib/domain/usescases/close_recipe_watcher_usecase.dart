import 'package:mr_recipe/core/core.dart';
import 'package:mr_recipe/domain/repositories/recipe_repository.dart';

class CloseRecipeWatcherUseCase {
  CloseRecipeWatcherUseCase(this._repository);

  final RecipeRepository _repository;

  Future<Option<Failure>> call() => _repository.closeRecipeWatcher();
}
