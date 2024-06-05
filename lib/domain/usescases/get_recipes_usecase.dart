import 'package:mr_recipe/core/core.dart';
import 'package:mr_recipe/domain/entities/recipe.dart';
import 'package:mr_recipe/domain/repositories/recipe_repository.dart';

class GetRecipesUseCase {
  GetRecipesUseCase(this._repository);

  final RecipeRepository _repository;

  Future<Either<Failure, List<Recipe>>> call() => _repository.getRecipes();
}
