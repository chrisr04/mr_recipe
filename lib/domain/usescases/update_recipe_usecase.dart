import 'package:mr_recipe/core/core.dart';
import 'package:mr_recipe/domain/entities/recipe.dart';
import 'package:mr_recipe/domain/repositories/recipe_repository.dart';

class UpdateRecipeUseCase {
  UpdateRecipeUseCase(this._repository);

  final RecipeRepository _repository;

  Future<Option<Failure>> call(Recipe recipe) =>
      _repository.updateRecipe(recipe);
}
