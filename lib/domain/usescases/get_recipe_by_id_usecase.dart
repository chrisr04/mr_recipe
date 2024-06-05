import 'package:mr_recipe/core/core.dart';
import 'package:mr_recipe/domain/entities/recipe.dart';
import 'package:mr_recipe/domain/repositories/recipe_repository.dart';

class GetRecipeByIdUseCase {
  GetRecipeByIdUseCase(this._repository);

  final RecipeRepository _repository;

  Future<Either<Failure, Recipe>> call(String recipeId) =>
      _repository.getRecipeById(recipeId);
}
