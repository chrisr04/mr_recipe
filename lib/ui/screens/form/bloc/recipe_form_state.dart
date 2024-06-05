part of 'recipe_form_bloc.dart';

sealed class RecipeFormState {
  const RecipeFormState(this.data);
  final RecipeFormStateData data;
}

final class FormInitialState extends RecipeFormState {
  const FormInitialState(super.data);
}

final class FormDataChangedState extends RecipeFormState {
  const FormDataChangedState(super.data);
}

final class ShowLoadingState extends RecipeFormState {
  const ShowLoadingState(super.data);
}

final class CloseLoadingState extends RecipeFormState {
  const CloseLoadingState(super.data);
}

final class RecipeSavedState extends RecipeFormState {
  const RecipeSavedState(super.data);
}

final class RecipeUpdatedState extends RecipeFormState {
  const RecipeUpdatedState(super.data);
}

final class FormFailureState extends RecipeFormState {
  const FormFailureState(super.data, {required this.message});

  final String message;
}

enum RecipeFormField { name, description, preparationTime, cookingTime }

class RecipeFormStateData {
  const RecipeFormStateData({
    this.name = '',
    this.description = '',
    this.preparationTime = '',
    this.cookingTime = '',
    this.ingredients = const <int, String>{0: ''},
  });

  final String name;
  final String description;
  final String preparationTime;
  final String cookingTime;
  final Map<int, String> ingredients;

  RecipeFormStateData copyWith({
    String? name,
    String? description,
    String? preparationTime,
    String? cookingTime,
    Map<int, String>? ingredients,
  }) =>
      RecipeFormStateData(
        name: name ?? this.name,
        description: description ?? this.description,
        preparationTime: preparationTime ?? this.preparationTime,
        cookingTime: cookingTime ?? this.cookingTime,
        ingredients: ingredients ?? this.ingredients,
      );
}
