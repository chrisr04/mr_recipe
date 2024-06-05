part of '../home_screen.dart';

class RecipeItemProperty extends StatelessWidget {
  const RecipeItemProperty({
    super.key,
    required this.label,
    required this.content,
  });

  final String label;
  final String content;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MrTextSmall(
            label,
            color: theme.colorScheme.outline,
          ),
          const MrSpacingXS(),
          MrTextSmall(
            content,
            weight: FontWeight.w500,
          ),
        ],
      ),
    );
  }
}
