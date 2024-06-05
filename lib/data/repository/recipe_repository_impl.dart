import 'package:mr_recipe/core/core.dart';
import 'package:mr_recipe/data/local/datasource/recipe_local_datasource.dart';
import 'package:mr_recipe/data/local/model/recipe_model.dart';
import 'package:mr_recipe/domain/domain.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  const RecipeRepositoryImpl({
    required RecipeLocalDataSource recipeLocalDataSource,
  }) : _recipeLocalDataSource = recipeLocalDataSource;

  final RecipeLocalDataSource _recipeLocalDataSource;

  @override
  Future<Option<Failure>> createRecipe(Recipe recipe) async {
    try {
      final recipeModel = RecipeModel.fromDomain(recipe);
      await _recipeLocalDataSource.createRecipe(recipeModel);
      return const None();
    } catch (e) {
      return Some(
        LocalFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Option<Failure>> deleteRecipe(String recipeId) async {
    try {
      await _recipeLocalDataSource.deleteRecipe(recipeId);
      return const None();
    } catch (e) {
      return Some(
        LocalFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, List<Recipe>>> getRecipes() async {
    try {
      final recipes = await _recipeLocalDataSource.getRecipes();
      return Right(recipes);
    } catch (e) {
      return Left(
        LocalFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Option<Failure>> updateRecipe(Recipe recipe) async {
    try {
      final recipeModel = RecipeModel.fromDomain(recipe);
      await _recipeLocalDataSource.updateRecipe(recipeModel);
      return const None();
    } catch (e) {
      return Some(
        LocalFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failure, Recipe>> getRecipeById(String recipeId) async {
    try {
      final recipe = await _recipeLocalDataSource.getRecipeById(recipeId);
      return Right(recipe);
    } catch (e) {
      return Left(
        LocalFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Either<Failure, Stream<List<Recipe>>> getRecipeWatcher() {
    try {
      return Right(_recipeLocalDataSource.getRecipeWatcher());
    } catch (e) {
      return Left(
        LocalFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Option<Failure>> closeRecipeWatcher() async {
    try {
      await _recipeLocalDataSource.closeWatcher();
      return const None();
    } catch (e) {
      return Some(
        LocalFailure(
          e.toString(),
        ),
      );
    }
  }
}
