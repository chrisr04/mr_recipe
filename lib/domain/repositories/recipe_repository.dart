import 'package:mr_recipe/core/core.dart';
import 'package:mr_recipe/domain/entities/recipe.dart';

abstract class RecipeRepository {
  Either<Failure, Stream<List<Recipe>>> getRecipeWatcher();
  Future<Option<Failure>> closeRecipeWatcher();
  Future<Either<Failure, List<Recipe>>> getRecipes();
  Future<Either<Failure, Recipe>> getRecipeById(String recipeId);
  Future<Option<Failure>> createRecipe(Recipe recipe);
  Future<Option<Failure>> updateRecipe(Recipe recipe);
  Future<Option<Failure>> deleteRecipe(String recipeId);
}
