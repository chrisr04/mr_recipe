part of '../home_screen.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({
    super.key,
    required this.recipe,
    required this.onTap,
  });

  final Recipe recipe;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      child: Card(
        elevation: 8.0,
        margin: const EdgeInsets.only(bottom: MrSpacing.md),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: MrSpacing.md,
            horizontal: MrSpacing.sl,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  const Image(
                    image: AssetImage(MrAssets.dishIcon),
                    width: 25.0,
                  ),
                  const MrSpacingS(
                    axis: MrSpacingAxis.x,
                  ),
                  Expanded(
                    child: MrTextLarge(
                      recipe.name,
                      weight: FontWeight.w600,
                    ),
                  ),
                  Icon(
                    Icons.chevron_right_rounded,
                    color: theme.primaryColor,
                  ),
                ],
              ),
              const MrSpacingM(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RecipeItemProperty(
                    label: MrStrings.preparationTime,
                    content: '${recipe.preparationTime} ${MrStrings.minutes}',
                  ),
                  const MrSpacingXS(),
                  RecipeItemProperty(
                    label: MrStrings.cookingTime,
                    content: '${recipe.cookingTime} ${MrStrings.minutes}',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
