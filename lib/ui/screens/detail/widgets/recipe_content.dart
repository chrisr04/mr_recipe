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
              RecipeRowButtons(
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

class RecipeProperty extends StatelessWidget {
  const RecipeProperty({
    super.key,
    required this.label,
    required this.content,
  });

  final String label;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MrTextMedium(
          label,
          weight: FontWeight.w600,
        ),
        const MrSpacingXS(),
        MrTextMedium(content),
      ],
    );
  }
}

class RecipeIngredients extends StatelessWidget {
  const RecipeIngredients({super.key, required this.ingredients});

  final List<String> ingredients;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MrTextMedium(
          MrStrings.ingredients,
          weight: FontWeight.w600,
        ),
        const MrSpacingXS(),
        for (final ingredient in ingredients)
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: MrSpacing.sm,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.check,
                  color: Theme.of(context).colorScheme.success,
                  size: 22.0,
                ),
                const MrSpacingXS(axis: MrSpacingAxis.x),
                Expanded(
                  child: MrTextMedium(ingredient),
                ),
              ],
            ),
          ),
      ],
    );
  }
}
