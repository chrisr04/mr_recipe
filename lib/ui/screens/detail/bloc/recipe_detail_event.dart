part of 'recipe_detail_bloc.dart';

sealed class RecipeDetailEvent {
  const RecipeDetailEvent();
}

final class LoadRecipeDetailEvent extends RecipeDetailEvent {
  const LoadRecipeDetailEvent(this.recipeId);
  final String recipeId;
}

final class DeleteRecipeEvent extends RecipeDetailEvent {
  const DeleteRecipeEvent(this.recipeId);
  final String recipeId;
}
