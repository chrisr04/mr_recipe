part of 'recipe_form_bloc.dart';

sealed class RecipeFormEvent {
  const RecipeFormEvent();
}

final class InitializeFormEvent extends RecipeFormEvent {
  const InitializeFormEvent(this.recipeId);

  final String recipeId;
}

final class ChangeRecipeDataEvent extends RecipeFormEvent {
  const ChangeRecipeDataEvent({
    required this.field,
    required this.value,
  });

  final RecipeFormField field;
  final String value;
}

final class ChangeIngredientEvent extends RecipeFormEvent {
  const ChangeIngredientEvent({
    required this.ingredientId,
    required this.value,
  });

  final int ingredientId;
  final String value;
}

final class AddIngredientEvent extends RecipeFormEvent {
  const AddIngredientEvent(this.ingredientId);
  final int ingredientId;
}

final class DeleteIngredientEvent extends RecipeFormEvent {
  const DeleteIngredientEvent(this.ingredientId);
  final int ingredientId;
}

final class SaveRecipeEvent extends RecipeFormEvent {
  const SaveRecipeEvent(this.recipe);
  final Recipe recipe;
}

final class UpdateRecipeEvent extends RecipeFormEvent {
  const UpdateRecipeEvent(this.recipe);
  final Recipe recipe;
}
