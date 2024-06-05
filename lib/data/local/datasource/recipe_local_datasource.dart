import 'package:mr_recipe/core/managers/data_manager.dart';
import 'package:mr_recipe/data/local/model/recipe_model.dart';

class RecipeLocalDataSource {
  const RecipeLocalDataSource({
    required DataManager dataManager,
  }) : _dataManager = dataManager;

  final DataManager _dataManager;

  Stream<List<RecipeModel>> getRecipeWatcher() {
    return _dataManager.getWatcher().map(
          (event) => event.map((e) => RecipeModel.fromJson(e)).toList(),
        );
  }

  Future<List<RecipeModel>> getRecipes() async {
    final data = await _dataManager.getData();
    final recipes = data.map((e) => RecipeModel.fromJson(e)).toList();
    return recipes;
  }

  Future<RecipeModel> getRecipeById(String recipeId) async {
    final data = await _dataManager.getData();
    final recipes = data.map((e) => RecipeModel.fromJson(e)).toList();
    return recipes.firstWhere(
      (e) => e.id == recipeId,
      orElse: () => RecipeModel.fromJson({}),
    );
  }

  Future<void> createRecipe(RecipeModel recipe) async {
    _dataManager.create(recipe.toMap());
  }

  Future<void> updateRecipe(RecipeModel recipe) async {
    final data = await _dataManager.getData();
    final recipes = data.map((e) => RecipeModel.fromJson(e)).toList();
    final index = recipes.indexWhere((e) => e.id == recipe.id);
    if (index != -1) {
      _dataManager.update(index, recipe.toMap());
    }
  }

  Future<void> deleteRecipe(String recipeId) async {
    final data = await _dataManager.getData();
    final recipes = data.map((e) => RecipeModel.fromJson(e)).toList();
    final index = recipes.indexWhere((e) => e.id == recipeId);
    if (index != -1) {
      _dataManager.delete(index);
    }
  }

  Future<void> closeWatcher() => _dataManager.close();
}
