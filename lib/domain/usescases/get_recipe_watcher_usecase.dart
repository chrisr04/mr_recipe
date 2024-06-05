import 'package:mr_recipe/core/core.dart';
import 'package:mr_recipe/domain/entities/recipe.dart';
import 'package:mr_recipe/domain/repositories/recipe_repository.dart';

class GetRecipeWatcherUseCase {
  GetRecipeWatcherUseCase(this._repository);

  final RecipeRepository _repository;

  Either<Failure, Stream<List<Recipe>>> call() =>
      _repository.getRecipeWatcher();
}
