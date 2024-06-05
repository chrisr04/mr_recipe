part of 'recipe_detail_bloc.dart';

sealed class RecipeDetailState {
  const RecipeDetailState();
}

final class DetailInitialState extends RecipeDetailState {
  const DetailInitialState();
}

final class DetailLoadingState extends RecipeDetailState {
  const DetailLoadingState();
}

final class DetailLoadedState extends RecipeDetailState {
  const DetailLoadedState(this.recipe);

  final Recipe recipe;
}

final class DetailFailureState extends RecipeDetailState {
  const DetailFailureState(this.message);

  final String message;
}

final class ShowLoadingState extends RecipeDetailState {
  const ShowLoadingState();
}

final class CloseLoadingState extends RecipeDetailState {
  const CloseLoadingState();
}

final class RecipeDeletedState extends RecipeDetailState {
  const RecipeDeletedState();
}

final class DeleteRecipeFailureState extends RecipeDetailState {
  const DeleteRecipeFailureState(this.message);

  final String message;
}
