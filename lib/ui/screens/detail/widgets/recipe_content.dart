part of '../detail_screen.dart';

class RecipeContent extends StatelessWidget {
  const RecipeContent({super.key, required this.recipe});

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(
        horizontal: MrSpacing.md,
        vertical: MrSpacing.lg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Image(
                image: AssetImage(MrAssets.dishIcon),
                width: 40.0,
              ),
              const MrSpacingS(axis: MrSpacingAxis.x),
              Expanded(
                child: MrTextHeading5(recipe.name),
              ),
              RowButtons(
                recipeId: recipe.id,
              ),
            ],
          ),
          if (recipe.description.isNotEmpty) ...[
            const MrSpacingM(),
            MrTextMedium(
              recipe.description,
            ),
          ],
          const MrSpacingL(),
          RecipeProperty(
            label: MrStrings.preparationTime,
            content: '${recipe.preparationTime} ${MrStrings.minutes}',
          ),
          const MrSpacingL(),
          RecipeProperty(
            label: MrStrings.cookingTime,
            content: '${recipe.cookingTime} ${MrStrings.minutes}',
          ),
          const MrSpacingL(),
          RecipeIngredients(
            ingredients: recipe.ingredients,
          ),
        ],
      ),
    );
  }
}
