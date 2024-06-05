part of '../detail_screen.dart';

class RecipeRowButtons extends StatelessWidget {
  const RecipeRowButtons({super.key, required this.recipeId});

  final String recipeId;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton.filled(
          color: Theme.of(context).colorScheme.onPrimary,
          onPressed: () => DeleteConfirmationModal.show(
            context,
            onConfirm: () => _deleteRecipe(context),
          ),
          icon: const Icon(Icons.delete_outline_outlined),
        ),
        IconButton.filled(
          color: Theme.of(context).colorScheme.onPrimary,
          onPressed: () => RecipeDetailHelpers.navigateToEdit(
            context,
            recipeId,
          ),
          icon: const Icon(Icons.edit_outlined),
        ),
      ],
    );
  }

  void _deleteRecipe(BuildContext context) {
    final detailBloc = BlocInjector.of<RecipeDetailBloc>(context);
    detailBloc.events.add(
      DeleteRecipeEvent(recipeId),
    );
  }
}
