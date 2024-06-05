part of '../detail_screen.dart';

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
